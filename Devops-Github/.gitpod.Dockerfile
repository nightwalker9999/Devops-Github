FROM gitpod/workspace-full

USER root

# Install Docker
RUN apt-get update && apt-get install -y docker.io

# Install Terraform (official script)
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg &&     echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com bookworm main" | tee /etc/apt/sources.list.d/hashicorp.list &&     apt-get update && apt-get install terraform -y
    
