
#Dockerfile
FROM ghcr.io/coder/coder:latest

USER root

RUN apk add curl unzip

# Create directory for the Terraform CLI (and assets)
RUN mkdir -p /opt/terraform

# Terraform is already included in the official Coder image.
# See https://github.com/coder/coder/blob/main/scripts/Dockerfile.base#L15
# If you need to install a different version of Terraform, you can do so here.
# The below step is optional if you wish to keep the existing version.
# See https://github.com/coder/coder/blob/main/provisioner/terraform/install.go#L23-L24
# for supported Terraform versions. e.g., 1.3.4 is highest supported as of 2023-03-08
COPY terraform_1.3.4_linux_amd64.zip .
RUN unzip -o terraform_1.3.4_linux_amd64.zip \
    && mv terraform /opt/terraform \
    && rm terraform_1.3.4_linux_amd64.zip
ENV PATH=/opt/terraform:${PATH}

# Additionally, a Terraform mirror needs to be configured
# to download the Terraform providers used in Coder templates.
#
# There are two options:

# Option 1) Use a filesystem mirror. We can seed this at build-time
#    or by mounting a volume to /opt/terraform/plugins in the container.
#    https://developer.hashicorp.com/terraform/cli/config/config-file#filesystem_mirror
#
#    Be sure to add all the providers you use in your templates to /opt/terraform/plugins

RUN mkdir -p /opt/terraform/plugins
ADD filesystem-mirror-example.tfrc /opt/terraform/config.tfrc

# Optionally, we can "seed" the filesystem mirror with common providers.
# Coder and Docker. Comment out lines 40-49 if you plan on only using a
# volume or network mirror:
RUN mkdir -p /opt/terraform/plugins/registry.terraform.io
WORKDIR /opt/terraform/plugins/registry.terraform.io
RUN echo "Adding coder/coder" \
    && mkdir -p coder/coder && cd coder/coder
COPY terraform-provider-coder_0.6.16_linux_amd64.zip .
RUN echo "Adding kreuzwerker/docker" \
    && mkdir -p kreuzwerker/docker && cd kreuzwerker/docker
COPY terraform-provider-docker_3.0.1_linux_amd64.zip .
RUN echo "Adding Kubernetes provider" \
    && mkdir -p kubernetes && cd kubernetes
COPY v2.18.1.zip .
RUN chown -R coder:coder /opt/terraform/plugins
WORKDIR /home/coder

# Option 2) Use a network mirror.
#    https://developer.hashicorp.com/terraform/cli/config/config-file#network_mirror

#    Be sure uncomment line 60 and edit network-mirror-example.tfrc to
#    specify the HTTPS base URL of your mirror.

# ADD network-mirror-example.tfrc /opt/terraform/config.tfrc

USER coder

# Use the tfrc file to inform
ENV TF_CLI_CONFIG_FILE=/opt/terraform/config.tfrc
