# PowerShell script for creating WordPress project structure in Windows environment

Write-Host ">> Creating WordPress project structure..." -ForegroundColor Cyan

# Create all necessary folders
$folders = @(
    "wp-content",
    "wp-content\themes",
    "wp-content\plugins",
    "wp-content\uploads",
    "mysql",
    "scripts",
    ".vscode"
)

foreach ($folder in $folders) {
    if (-not (Test-Path -Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
}

# Create my.cnf
$myCnfContent = @"
[mysqld]
# Optimized settings for WordPress
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
"@

Set-Content -Path "mysql\my.cnf" -Value $myCnfContent

# Create uploads.ini
$uploadsIniContent = @"
file_uploads = On
memory_limit = 256M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 300
max_input_vars = 3000
"@

Set-Content -Path "uploads.ini" -Value $uploadsIniContent

# Create .env.example
$envExampleContent = @"
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

# Port Configuration (Windows)
WP_PORT=8080
PMA_PORT=8081
MAILHOG_PORT=8025
"@

Set-Content -Path ".env.example" -Value $envExampleContent

# Copy .env.example to .env if it doesn't exist
if (-not (Test-Path -Path ".env")) {
    Copy-Item -Path ".env.example" -Destination ".env"
}

Write-Host "[OK] Structure created!" -ForegroundColor Green
Write-Host ""
Write-Host ">> Project structure:" -ForegroundColor Cyan
Write-Host "|-- mysql/my.cnf          [OK] MySQL Configuration" -ForegroundColor White
Write-Host "|-- uploads.ini           [OK] PHP Configuration" -ForegroundColor White
Write-Host "|-- .env                  [OK] Environment variables" -ForegroundColor White
Write-Host "|-- .env.example          [OK] Example for git" -ForegroundColor White
Write-Host "|-- wp-content/           [OK] WordPress content" -ForegroundColor White
Write-Host "'-- scripts/              [OK] Automation scripts" -ForegroundColor White
Write-Host ""
Write-Host "[!] REMEMBER:" -ForegroundColor Yellow
Write-Host "1. Edit .env with your passwords" -ForegroundColor Yellow
Write-Host "2. Run: docker-compose up -d" -ForegroundColor Yellow
Write-Host "3. Run the setup script: ./scripts/setup.ps1" -ForegroundColor Yellow