FROM gitpod/workspace-full

USER root

# Install Docker
RUN apt-get update && apt-get install -y docker.io unzip curl

# Install Terraform via direct binary
RUN curl -fsSL https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip -o terraform.zip &&     unzip terraform.zip &&     mv terraform /usr/local/bin/terraform &&     rm terraform.zip
    
