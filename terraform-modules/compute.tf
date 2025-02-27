resource "oci_core_instance" "instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.instance_shape
  display_name        = "my-terraform-instance"
  
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.compute_images.images[0].id
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = true 
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key 
  }
}
