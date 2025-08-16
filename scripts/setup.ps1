# PowerShell script for setting up WordPress in Windows environment

Write-Host ">> Setting up WordPress project with Docker for Windows..." -ForegroundColor Cyan

# Load environment variables from .env file
Get-Content ".env" | ForEach-Object {
  # Skip comments and empty lines
  if ($_ -match '^\s*#|^\s*$' ) { return }
  
  if ($_ -match '=') {
    $name, $value = $_.Split('=', 2)
    # Correct way to set an environment variable with a dynamic name
    Set-Item -Path "env:\$name" -Value $value
  }
}

# Start containers in background
Write-Host ">> Starting containers..." -ForegroundColor Cyan
docker-compose up -d

# $? is a boolean: $true if the last command was successful (exit code 0), otherwise $false.
if (-not $?) {
Write-Host "[ERROR] Error starting containers. Check the logs with 'docker-compose logs'." -ForegroundColor Red
    exit 1
}

# Wait for the database to be ready
Write-Host ">> Waiting for the database to be ready..." -ForegroundColor Cyan
while ($true) {
    docker-compose exec -T db mysqladmin ping -h "localhost" --silent
    if ($?) {
        break # Exit the loop if the command is successful
    }
    Write-Host "." -NoNewline
    Start-Sleep -Seconds 2
}
Write-Host "`n[OK] Database is ready." -ForegroundColor Green

# Check if WordPress is already downloaded
Write-Host ">> Checking WordPress installation..." -ForegroundColor Cyan
docker-compose exec -T wordpress test -f /var/www/html/wp-includes/version.php
if (-not $?) { # If the previous command FAILED...
Write-Host ">> Downloading WordPress..." -ForegroundColor Cyan
    docker-compose exec -T wordpress wp core download --allow-root
    if (-not $?) {
Write-Host "[ERROR] Failed to download WordPress." -ForegroundColor Red
        exit 1
    }
} else {
Write-Host "[OK] WordPress is already present." -ForegroundColor Green
}

# Create wp-config.php if it doesn't exist
docker-compose exec -T wordpress test -f /var/www/html/wp-config.php
if (-not $?) {
Write-Host ">> Creating wp-config.php configuration file..." -ForegroundColor Cyan
    
    docker-compose exec -T wordpress wp config create `
        --allow-root `
        --dbname="$env:WORDPRESS_DB_NAME" `
        --dbuser="$env:WORDPRESS_DB_USER" `
        --dbpass="$env:WORDPRESS_DB_PASSWORD" `
        --dbhost="$env:WORDPRESS_DB_HOST" `
        --skip-check
}

# Install WordPress if not already installed
Write-Host ">> Checking if WordPress needs to be installed..." -ForegroundColor Cyan
docker-compose exec -T wordpress wp core is-installed --allow-root --url="http://localhost:$env:WP_PORT"
if (-not $?) {
Write-Host ">> Installing WordPress (this might take a moment)..." -ForegroundColor Cyan
    docker-compose exec -T wordpress wp core install `
        --allow-root `
        --url="http://localhost:$env:WP_PORT" `
        --title="My WordPress Site" `
        --admin_user="admin" `
        --admin_password="admin123" `
        --admin_email="admin@example.com"
} else {
Write-Host "[OK] WordPress is already installed." -ForegroundColor Green
}

# Install and activate essential plugins
Write-Host ">> Installing essential plugins..." -ForegroundColor Cyan
docker-compose exec -T wordpress wp plugin install `
  wordpress-seo `
  w3-total-cache `
  wordfence `
  updraftplus `
  --activate --allow-root

Write-Host "`n[OK] Setup completed successfully!" -ForegroundColor Green
Write-Host ">> WordPress Site: http://localhost:$env:WP_PORT" -ForegroundColor Cyan
Write-Host ">>  phpMyAdmin: http://localhost:$env:PMA_PORT" -ForegroundColor Cyan
Write-Host ">> MailHog: http://localhost:$env:MAILHOG_PORT" -ForegroundColor Cyan
Write-Host ""
Write-Host ">> WordPress Login:" -ForegroundColor Yellow
Write-Host "   Username: admin" -ForegroundColor Yellow
Write-Host "   Password: admin123" -ForegroundColor Yellow