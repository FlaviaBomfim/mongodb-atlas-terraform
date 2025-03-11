resource "mongodbatlas_cluster" "cluster" {
  project_id                  = var.project_id
  name                        = "mug-floripa-terraform"
  provider_name               = "AWS"
  provider_region_name        = "US_EAST_1"
  cluster_type                = "REPLICASET"
  replication_factor          = 3
  provider_instance_size_name = "M10"
  disk_size_gb                = 10

 # Versão do MongoDB
  mongo_db_major_version      = "8.0"

  # Configurações de backup
  cloud_backup                = false    # true para ativar backups automáticos

}
