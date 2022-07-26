FROM ubuntu:22.04

# Update and install curl
RUN apt-get update && apt-get install -y curl

# Install nginx
RUN apt-get install -y nginx

# Install php 8.1
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y php8.1 php8.1-fpm php8.1-mysql php8.1-curl php8.1-gd php8.1-mbstring php8.1-xml php8.1-zip

USER root

# Install Node.js 18.x
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin

CMD service nginx start \
&& service php8.1-fpm start \
# shows nginx error logs
&& tail -f -v /var/log/nginx/error.log \
# keep container running
&& tail -f /dev/null