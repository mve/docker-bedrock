FROM ubuntu:22.04

# Install php 8.1
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y php8.1 php8.1-fpm php8.1-mysql php8.1-curl php8.1-gd php8.1-mbstring php8.1-xml php8.1-zip

# Install Node.js 18.x
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# install composer 2.3.10
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.3.10

# Install nginx
RUN apt-get install -y nginx

# Start nginx
RUN service nginx start

CMD tail -f /dev/null