# 1. Use the official image with Apache as a base
FROM wordpress:php8.2-apache

# 2. Install dependencies for image optimization and other tools
RUN apt-get update && apt-get install -y \
    libmagickwand-dev \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# 3. Set the working directory
WORKDIR /var/www/html

# 4. Download WP-CLI, make it executable, and move it to the system's PATH
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp