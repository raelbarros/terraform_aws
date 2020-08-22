variable "region" {
    default = "us-east-1"
    description = "Regiao de criacao dos recursos"
}

variable "access_key" {
    default = ""
}

variable "secret_key" {
    default = ""
}

variable "linux_ami" {
    default = "ami-0f4aeaec5b3ce9152"
}

variable "type" {
}

# Variavel tipo lista
variable "ips" {
    type = list
    default = ["3ffe:1900:4545:3:200:f8ff:fe21:67cf", "3ffe:1900:4545:3:200:f8ff:fe21:67cd"]
}

# Variavel tipo Map
variable "tags" {
    type = map
    default = {
        "Name" = "Israel"
        "Env" = "Dev"
    }
}