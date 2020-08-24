# Config de acesso
provider "aws" {
    region = var.region
}

# Criacao de funcao RANDOM
resource "random_id" "bucket" {
    byte_length = 5
} 

resource "random_id" "bucket_2" {
    byte_length = 3
} 

# Criando um modulo
# Criacao de bucket com variaveis e obj
module "modulo_bucket" {
    source = "./s3"
    name = "my-bucket-${random_id.bucket.hex}"

    versioning = true

    tags = {
        "Name" = "Meu bucket de anotações"
    }

    create_object = true
    object_key = "/file/${random_id.bucket.dec}.txt"
    object_source = "arquivo.txt"
}

# Criacao de bucket basico
module "modulo_bucket_2" {
    source = "./s3"
    name = "my-bucket-${random_id.bucket_2.hex}"
}