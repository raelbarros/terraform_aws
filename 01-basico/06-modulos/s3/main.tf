resource "aws_s3_bucket" "s3" {
    bucket = var.name
    acl = var.acl
    
    versioning {
        enabled = var.versioning
    }
}

resource "aws_s3_bucket_object" "obj" {
    # if create_object = true, soma +1 no count
    count = var.create_object ? 1 : 0

    bucket = aws_s3_bucket.s3.id
    key = var.object_key
    source = var.object_source
    etag = md5(file(var.object_source))
}