# Config de acesso
provider "aws" {
    access_key = ""
    secret_key = ""
    region = ""
}

# Criacao de S3
resource "aws_s3_bucket" "b" {
    bucket = "my-ib-teste-bucket-123132"
    acl = "private"

    tags = {
        Name = "teste-bucket"
        Environment = "dev"
    }
}

