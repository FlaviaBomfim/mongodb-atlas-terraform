resource "mongodbatlas_cluster" "cluster_import" {
  project_id                  = var.project_id
  name                        = "mug-floripa-terraform-not"
  provider_name               = "AWS"
  provider_region_name        = "US_EAST_1"
  provider_instance_size_name = "M10"
  cloud_backup                = false 
}

#terraform import mongodbatlas_cluster.cluster_import PROJECT_ID-mug-floripa-terraform-not