variable "atlas_public_key" {
  description = "Sua chave pública do MongoDB Atlas"
  type        = string
  default       = "xxxx"
}

variable "atlas_private_key" {
  description = "Sua chave privada do MongoDB Atlas"
  type        = string
  sensitive   = true
  default       = "xxxxx"
}

variable "project_id" {
  description = "ID do seu projeto no MongoDB Atlas"
  type        = string
  default       =  "xxxxxx"
}