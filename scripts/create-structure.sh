#!/bin/bash

echo "📁 Creating WordPress project structure..."

# Create all necessary folders
mkdir -p {wp-content/{themes,plugins,uploads},mysql,scripts,.vscode}

# Create my.cnf
cat > mysql/my.cnf << 'EOF'
[mysqld]
# Optimized settings for WordPress/WooCommerce
innodb_buffer_pool_size = 256M
innodb_log_file_size = 64M
innodb_file_per_table = 1
innodb_open_files = 400

# Performance
query_cache_type = 1
query_cache_size = 64M
query_cache_limit = 2M

# Connections
max_connections = 100
max_user_connections = 80

# Timeouts
interactive_timeout = 180
wait_timeout = 180
connect_timeout = 10

# Buffer sizes
key_buffer_size = 32M
tmp_table_size = 64M
max_heap_table_size = 64M
sort_buffer_size = 2M
read_buffer_size = 2M
read_rnd_buffer_size = 4M

# Charset
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

[mysql]
default-character-set = utf8mb4

[client]
default-character-set = utf8mb4
EOF

# Create uploads.ini
cat > uploads.ini << 'EOF'
file_uploads = On
memory_limit = 256M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 300
max_input_vars = 3000
EOF

# Create .env example
cat > .env.example << 'EOF'
# Database
MYSQL_DATABASE=wordpress
MYSQL_USER=wpuser
MYSQL_PASSWORD=your_password_here
MYSQL_ROOT_PASSWORD=your_root_password_here

# WordPress
WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=wpuser
WORDPRESS_DB_PASSWORD=your_password_here
WORDPRESS_DB_NAME=wordpress

# Development
WORDPRESS_DEBUG=1
EOF

# Copy .env.example to .env
cp .env.example .env

# Set permissions
chmod -R 755 wp-content/
chmod +x scripts/*.sh

echo "✅ Structure created!"
echo ""
echo "📋 Project structure:"
echo "├── mysql/my.cnf          ✅ MySQL Configuration"
echo "├── uploads.ini           ✅ PHP Configuration" 
echo "├── .env                  ✅ Environment variables"
echo "├── .env.example          ✅ Example for git"
echo "├── wp-content/           ✅ WordPress content"
echo "└── scripts/              ✅ Automation scripts"
echo ""
echo "⚠️  REMEMBER:"
echo "1. Edit .env with your passwords"
echo "2. Run: docker-compose up -d"
echo "3. Configure VSCode: ./scripts/setup-vscode.sh"