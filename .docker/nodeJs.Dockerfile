FROM node:24-alpine

# Aceptar argumentos de nombre de usuario y UID
ARG USER
ARG UID

# Set working directory
WORKDIR /usr/src/app

# Install system dependencies
RUN apk add --no-cache \
    curl \
    git \
    libstdc++ \
    linux-headers \
    sudo \
    zsh
RUN npm install -g pnpm@10

# Clear cache
RUN rm -rf /var/cache/apk/*

# Reutilizar el UID del host sin asumir que ya existe en la imagen base.
RUN OLD_USER="$(getent passwd "$UID" | cut -d: -f1)"; \
    if [ -n "$OLD_USER" ]; then deluser "$OLD_USER"; fi; \
    adduser -D -u "$UID" "$USER"
RUN mkdir -p /home/$USER/.vscode-server \
    && chown -R $USER:$USER /home/$USER/.vscode-server
RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Cambiar al usuario proporcionado
USER $USER

# Serve the frontend welcome page.
CMD ["node", "server.js"]
