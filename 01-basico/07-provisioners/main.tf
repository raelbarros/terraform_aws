# Config de acesso
provider "aws" {
    region = var.region
}

// Variaveis locais
locals {
    conn_type = "ssh"
    conn_user = "ec2-user"
    conn_key = file("~/Downloads/aws-key.pem")
}

// Criando uma instancia Linux
resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.type
    // informando a key da instancia
    key_name = "aws-key"

    // transferindo arquivos para instancia
    provisioner "file" {
        source = "log.log"
        destination = "/tmp/file.log"

        // funcao de connection na instancia
        connection {
            type = local.conn_type
            user = local.conn_user
            host = self.public_ip
            private_key = local.conn_key
        }
    }

    // executando scripts remotos na instancia
    // instalando apache
    provisioner "remote-exec" {
        // comando de instalacao do apache
        inline = [
            "sleep 10",
            "echo [UPDATE INSTANCE]",
            "sudo yum update -y",
            "echo [INSTALANDO APACHE]",
            "sudo yum install httpd -y",
            "echo [INICIANDO APACHE]",
            "sudo service httpd start",
            "sleep 10"
        ]

        // conexao da instancia
        connection {
            type = local.conn_type
            user = local.conn_user
            host = self.public_ip
            private_key = local.conn_key
        }
    }
}

resource "null_resource" "null" {
    provisioner "local-exec" {
        command = "echo ${aws_instance.web.id}:${aws_instance.web.public_ip} >> public_ips.txt"
    }
}

// Criando uma security key
resource "tls_private_key" "create_private_key" {
    algorithm = "RSA"
    rsa_bits = 2048
}

resource "aws_key_pair" "keypair" {
    key_name = "terraform_key"
    public_key = tls_private_key.create_private_key.public_key_openssh
}