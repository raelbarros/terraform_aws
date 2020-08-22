# Config de acesso
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region
}

# Criando uma instancia
resource "aws_instance" "instance" {
    ami = var.linux_ami
    instance_type = var.type
}
