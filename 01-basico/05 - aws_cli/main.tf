# Config de acesso
provider "aws" {
    region = var.region
}

# Criando uma instancia
resource "aws_instance" "instance" {
    ami = var.linux_ami
    instance_type = var.type

    tags = var.tags
}
