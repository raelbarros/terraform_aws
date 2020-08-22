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

# Interpolacao
# Jogando um arquivo local no S3
resource "aws_s3_bucket_object" "object" {
    # Pegando referencia do S3 criado acima
    bucket = aws_s3_bucket.b.id
    
    # Nome do arquivo no S3
    key = "hello-world.txt"

    # Diretorio do arquivo local
    source = "arquivo.txt"
    etag = md5(file("arquivo.txt"))

}
