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

