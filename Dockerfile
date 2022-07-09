FROM docker.io/bitpoke/wordpress-runtime:bedrock-php-8.1.7

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs