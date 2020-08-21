provider "aws" {
    access_key = "AKIATP6SCMAHNLWVLWQH"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_s3_bucket" "b" {
    bucket = "my-ib-teste-bucket-123132"
    acl = "private"

    tags = {
        Name = "teste-bucket"
        Environment = "dev"
    }
}

resource "aws_s3_bucket_object" "object" {
    bucket = aws_s3_bucket.b.id
    key = "hello-world.txt"
    source = "arquivo.txt"
    etag = md5(file("arquivo.txt"))

}

output "bucket" {
    value = aws_s3_bucket.b.id
}

output "etag" {
    value = aws_s3_bucket_object.object.etag
}