# Config de acesso
provider "aws" {
    access_key = ""
    secret_key = ""
<<<<<<< HEAD:01-basico/02/main.tf
    region = ""
=======
    region = "us-east-1"
>>>>>>> 94c90cbd8fc1838cfd8339acdc00076d7dda1c81:01/main.tf
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
<<<<<<< HEAD:01-basico/02/main.tf
=======

output "bucket" {
    value = aws_s3_bucket.b.id
}

output "etag" {
    value = aws_s3_bucket_object.object.etag
}
>>>>>>> 94c90cbd8fc1838cfd8339acdc00076d7dda1c81:01/main.tf
