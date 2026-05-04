FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV ZSH=/root/.oh-my-zsh

# --- Base packages (minimal) ---
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    gnupg \
    git \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# --- Install Terraform (static binary) ---
RUN curl -fsSL https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform.zip

# --- Install AWS CLI v2 ---
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

# --- Install Oh My Zsh (non-interactive) ---
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# --- Plugins ---
RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH}/custom/plugins/zsh-autosuggestions

# --- Zsh config ---
RUN sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' /root/.zshrc

# --- AWS alias (auto Floci endpoint) ---
RUN echo '\n# Floci AWS shortcut\nalias aws="aws --endpoint-url=$AWS_ENDPOINT_URL"\n' >> /root/.zshrc

# --- Default AWS config ---
RUN mkdir -p /root/.aws && \
    echo "[default]\nregion=us-east-1\noutput=json" > /root/.aws/config && \
    echo "[default]\naws_access_key_id=test\naws_secret_access_key=test" > /root/.aws/credentials

# --- Set zsh as default shell ---
RUN chsh -s $(which zsh)

WORKDIR /workspace
