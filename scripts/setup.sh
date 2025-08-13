#!/bin/bash

echo "🐳 Setting up WordPress project with Docker..."

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Start containers in the background
echo "📦 Starting containers..."
docker-compose up -d

if [ $? -ne 0 ]; then
    echo "❌ Error starting containers. Check the logs with 'docker-compose logs'."
    exit 1
fi

# The command below now explicitly waits for the database
echo "⏳ Waiting for the database to be ready..."
until docker-compose exec -T db mysqladmin ping -h "localhost" --silent; do
    echo -n "."
    sleep 2
done
echo -e "\n✔ Database is ready."

# Download WordPress if it doesn't exist
echo "🔍 Checking WordPress installation..."
if ! docker-compose exec -T wordpress [ -f /var/www/html/wp-includes/version.php ]; then
    echo "📥 Downloading WordPress..."
    docker-compose exec -T wordpress wp core download --allow-root
    if [ $? -ne 0 ]; then
        echo "❌ Failed to download WordPress."
        exit 1
    fi
else
    echo "✔ WordPress is already present."
fi

# Create wp-config.php if it doesn't exist
if ! docker-compose exec -T wordpress [ -f /var/www/html/wp-config.php ]; then
    echo "⚙️ Creating wp-config.php configuration file..."
    # Note that environment variables (e.g., $WORDPRESS_DB_NAME) are expanded here
    docker-compose exec -T wordpress wp config create \
        --allow-root \
        --dbname="${WORDPRESS_DB_NAME}" \
        --dbuser="${WORDPRESS_DB_USER}" \
        --dbpass="${WORDPRESS_DB_PASSWORD}" \
        --dbhost="${WORDPRESS_DB_HOST}" \
        --skip-check
fi

# Install WordPress if not already installed
echo "🛠 Checking if WordPress needs to be installed..."
if ! docker-compose exec -T wordpress wp core is-installed --allow-root --url="http://localhost:8080"; then
    echo "⏳ Installing WordPress (this might take a moment)..."
    docker-compose exec -T wordpress wp core install \
        --allow-root \
        --url="http://localhost:8080" \
        --title="My WordPress Site" \
        --admin_user="admin" \
        --admin_password="admin123" \
        --admin_email="admin@example.com"
else
    echo "✔ WordPress is already installed."
fi
# Install and activate essential plugins
echo "🔌 Installing essential plugins..."
docker-compose exec -T wordpress wp plugin install \
  wordpress-seo \
  w3-total-cache \
  wordfence \
  updraftplus \
  --activate --allow-root

# Adjusting permissions
# echo "🔧 Adjusting permissions..."
# docker-compose exec -T wordpress chown -R www-data:www-data /var/www/html/wp-content

echo ""
echo "✅ Setup completed successfully!"
echo "🌐 WordPress Site: http://localhost:8080"
echo "🗄️  phpMyAdmin: http://localhost:8081"
echo "📧 MailHog: http://localhost:8025"
echo ""
echo "🔑 WordPress Login:"
echo "   Username: admin"
echo "   Password: admin123"