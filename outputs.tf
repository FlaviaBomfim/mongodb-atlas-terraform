output "cluster_connection_string" {
  value       = mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
  description = "Connection string para conectar ao cluster criado"
}
