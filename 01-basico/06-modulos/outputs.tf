# OUTPUT DO MODULO
# Pego a refenrecia do modulo 
output "modulo_bucket_1" {
    # nome do modulo.nome do output do resource
    value = module.modulo_bucket.bucket_name
}

output "modulo_bucket_1_object" {
    # nome do obj dentro do bucket.nome do output do resource
    value = module.modulo_bucket.object_name
}

output "modulo_bucket-2" {
    value = module.modulo_bucket_2.bucket_name
}