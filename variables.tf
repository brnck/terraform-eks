variable "cluster_name" {
  default = "terraform-eks-cluster"
  type    = string
}

variable "bucket_name" {
  default = "brnck-eks-terraform-state"
  type    = string
}
