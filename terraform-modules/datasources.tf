# Data source to get the availability domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Data source to get the image
data "oci_core_images" "compute_images" {
  compartment_id           = var.compartment_id
  operating_system         = var.image_OS
  operating_system_version = var.image_version
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}


