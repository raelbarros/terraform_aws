# OUTPUT DO RESOURCE
output "bucket_name" {
    value = aws_s3_bucket.s3.id
}

output "object_name" {
    value = aws_s3_bucket_object.obj.*.key
}