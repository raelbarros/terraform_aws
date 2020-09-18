variable "region" {
    default = "us-east-1"
}

variable "ami" {
    default = "ami-0c94855ba95c71c99"
}

variable "type" {
    default = "t2.micro"
}

variable "tags" {
    type = map
    default = {
        "Name" = "Israel"
        "Env" = "Dev"
    }
}