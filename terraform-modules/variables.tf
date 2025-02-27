#Reading from terraform.tfvars
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "region" {}
variable "compartment_id" {}
variable "image_id" {}

#Variables that can be dynamically set

#Networking
variable "availability_domain" {
  default = "AD-1"
}
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
  default = "Oracle-Linux"
}
variable "image_version" {
  description = "Choose version of image desired:"
  default     = "20.04"
}
variable "instance_shape" {
  default = "VM.Standard2.1"
}
variable "ssh_public_key" {
  description = "Path to the public key file"
  default     = "/home/muturiiii/Desktop/HNG12/HNG12-S4/Terra-Ansible/terra-instance_key.pub"
}