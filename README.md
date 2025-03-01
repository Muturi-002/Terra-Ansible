# Terra-Ansible

### Description
Infrastructure as Code and Configuration Management

## Setup Instructions
Terraform modules:
- Provision cloud server(s)
- Configure security groups
- Dynamically create inventory files
- Trigger Ansible playbook execution after provisioning

Ansible modules:
- Create Ansible roles for:
  1. Dependencies role
     
     Installing Docker, Docker Compose and other required dependencies
  2. Deployment role
     
     Cloning the application repo- https://github.com/Muturi-002/DevOps-Stage-4
     
     Executing Docker Compose to deploy the application
     
     Setting up SSL/TLS with Traefik

### Requirements
- Terraform (v1.0.0 or later)
- Ansible (v2.9.0 or later)
- OCI CLI (for Oracle Cloud Infrastructure)
- SSH key pair for accessing the provisioned instances

#### Environment Variables (For Terraform setup)
Ensure the following environment variables are set for OCI authentication:
- `TF_VAR_tenancy_ocid`
- `TF_VAR_user_ocid`
- `TF_VAR_fingerprint`
- `TF_VAR_private_key_path`
- `TF_VAR_region`

### Terraform Setup
1. **Clone the repository:**
   ```bash
   git clone https://github.com/Muturi-002/DevOps-Stage-4
   cd DevOps-Stage-4
   ```
2. Initialize Terraform in current directory

   ```bash
   terraform init
   ```

3. Create terraform.tfvars file with these contents:

   ```file.tf
   tenancy_ocid         = "ocid1.tenancy.oc1..exampleuniqueID"
   user_ocid            = "ocid1.user.oc1..exampleuniqueID"
   fingerprint          = "20:3b:97:13:55:1c:aa:5e:fa:aa:bb:cc:dd:ee:ff:00"
   private_key_path     = "/path/to/private_key.pem"
   region               = "us-ashburn-1"
   availability_domain  = "example:AD-1"
   compartment_id       = "ocid1.compartment.oc1..exampleuniqueID"
   instance_shape       = "VM.Standard2.1"
   subnet_id            = "ocid1.subnet.oc1..exampleuniqueID"
   image_id             = "ocid1.image.oc1..exampleuniqueID"
   ssh_public_key       = "/path/to/ssh_public_key.pub"
   instance_name        = "example-instance"
   vcn_id               = "ocid1.vcn.oc1..exampleuniqueID"
   ```

4. Apply configurations
   ```bash
   terraform apply
   ```

### Ansible Setup
1. Install required Ansible roles

   ```
   ansible-galaxy install -r requirements.yml
   ```

2. Create Ansible Inventory file

3. Run Ansible playbook

   ```
   ansible-playbook -i inventory.ini playbook.yml
   ```

Ensure the terraform variables contain the correct values, and the SSH key pair is correctly configured for accessing the provisioned instance(s)
