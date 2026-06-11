FROM cypress/included:10.2.0

ARG USER
ARG UID

# Install dependencies
RUN apt-get update && apt-get install -y \
    libasound2 \
    libxtst6 \
    xauth \
    x11-apps \
    xvfb \
    dbus \
    libva2 \
    libva-drm2 \
    libva-x11-2 \
    libvdpau-va-gl1 \
    mesa-utils \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    firefox

# Configure user
WORKDIR /e2e
RUN chmod -R 777 /e2e

# Create necessary directories for reports
RUN mkdir -p /e2e/cypress/results/report/.jsons && \
    mkdir -p /e2e/cypress/results/report/screenshots && \
    mkdir -p /e2e/cypress/results/report/videos && \
    mkdir -p /e2e/screenshots && \
    mkdir -p /e2e/videos && \
    chmod -R 777 /e2e

RUN npm install --save-dev cypress-mochawesome-reporter
RUN npm install dotenv

RUN OLD_USER=$(getent passwd $UID | cut -d: -f1) && deluser $OLD_USER && adduser --uid $UID --disabled-password $USER
RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER $USER

