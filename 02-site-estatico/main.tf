provider "aws" {
    region = var.region
}
resource "aws_s3_bucket" "bucket_log" {
    bucket = "${var.domain}-log"
    acl = "log-delivery-write"
}

resource "aws_s3_bucket" "bucket_site" {
    bucket = "${var.domain}-site"
    acl = "public-read"
    policy = file("policy.json")

    website {
        index_document = "index.html"
        error_document = "index.html"
    }

    logging {
        target_bucket = aws_s3_bucket.bucket_log.id
        target_prefix = var.domain
    }
}

resource "aws_s3_bucket" "redirect" {
  bucket = "www.${var.domain}"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "${var.domain}"

  }
}