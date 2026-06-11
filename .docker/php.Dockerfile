FROM php:8.5-fpm-alpine

# Aceptar argumentos de nombre de usuario y UID
ARG USER
ARG UID

# Set working directory
WORKDIR /var/www

# More dependencies list
# libpq-dev
# libpng-dev
# libzip-dev
# libonig-dev
# libxml2-dev
# libxslt-dev
# librabbitmq-dev

# Install system dependencies and PHP extensions required by Laravel.
RUN apk add --no-cache \
    ${PHPIZE_DEPS} \
    curl \
    freetype-dev \
    imagemagick \
    imagemagick-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    git \
    libstdc++ \
    postgresql-dev \
    sudo \
    zsh \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        bcmath \
        exif \
        gd \
        intl \
        pcntl \
        pdo_pgsql \
        soap \
        sockets \
        xsl \
        zip \
    && pecl install imagick xdebug \
    && docker-php-ext-enable imagick xdebug \
    && rm -rf /tmp/pear /var/cache/apk/*

# libmagickwand-dev \
# libonig-dev \

# Get Composer 2
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# agregar usuario y grupo con el UID proporcionado y cambiar el nombre de usuario root al nombre de usuario proporcionado
RUN addgroup -g $UID -S $USER && adduser -u $UID -S $USER -G $USER -s /bin/sh && adduser $USER www-data

# El volumen conserva VS Code Server entre recreaciones del contenedor.
RUN mkdir -p /home/$USER/.vscode-server \
    && chown -R $USER:$USER /home/$USER/.vscode-server

RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Cambiar al usuario proporcionado
USER $USER
