resource "oci_core_instance" "instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.instance_shape
  display_name        = "Terraform-instance"
  
  source_details {
    source_type = "image"
    source_id= data.oci_core_images.compute_images.images[0].id
    #source_id   = var.image_id - achieves the same result if explicitly set in terraform.tfvars
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    assign_public_ip = true 
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key 
  }
}
