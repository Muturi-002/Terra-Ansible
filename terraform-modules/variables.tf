#Reading from terraform.tfvars
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "region" {}
variable "compartment_id" {}
variable "availability_domain" {}
variable "ssh_public_key" {}
variable "instance_shape" {}

#Variables that can be dynamically set

#Networking
variable "vcn-cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
variable "vcn_dns_label" {
  description = "DNS label for the VCN"
  default     = "vcn1"
}
variable "dns_label" {
  description = "DNS label for the subnet"
  default     = "subnet1"
}

#Compute
variable "image_OS" {
  default = "Canonical Ubuntu"
}
variable "image_version" {
  description = "Choose version of image desired:"
  default     = "24.04"
}