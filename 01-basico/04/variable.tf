variable "region" {
    default = "us-west-1"
    description = "Regiao de criacao dos recursos"
}

variable "access_key" {
    default = "AKIA6JG2G6TRVUYPI2MB"
}

variable "secret_key" {
    default = "oFDLnq+rN+KJNuWMv0cDdNA1hwI60VzL0jO8wM3P"
}

variable "linux_ami" {
    default = "ami-05655c267c89566dd"
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