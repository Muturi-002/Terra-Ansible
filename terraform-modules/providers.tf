terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.25.0"
    }
  }
}
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = "/home/muturiiii/.oci/terraform-key.pem"
  region           = var.region
}
