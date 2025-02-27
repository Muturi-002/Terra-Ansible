# Data source to get the availability domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Data Source to get a VCN
data "oci_core_vcn" "vcn" {
  vcn_id = "ocid1.vcn.oc1.af-johannesburg-1.amaaaaaatydu5sqaahiy7jcuuv5jctyudxawqou4r5ag522qxlqw5duyarka" #paste the VCN OCID after the network is created
}

data "oci_core_images" "compute_images" {
  compartment_id           = var.compartment_id
  operating_system         = var.image_OS
  operating_system_version = var.image_version
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}


