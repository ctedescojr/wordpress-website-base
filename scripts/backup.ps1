# PowerShell script for backing up WordPress in Windows environment

Write-Host "📦 Starting WordPress backup..." -ForegroundColor Cyan

# Create backup directory if it doesn't exist
$backupDir = "./backups"
if (-not (Test-Path -Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
    Write-Host "✅ Backup directory created." -ForegroundColor Green
}

# Get current date for backup filename
$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$backupFilename = "wordpress_backup_$date"

# Load environment variables from .env file
if (Test-Path -Path ".env") {
    Get-Content ".env" | ForEach-Object {
      # Skip comments and empty lines
      if ($_ -match '^\s*#|^\s*$' ) { return }

      if ($_ -match '=') {
        $name, $value = $_.Split('=', 2)
        # Correct way to set an environment variable with a dynamic name
        Set-Item -Path "env:\$name" -Value $value
      }
    }
} else {
    Write-Host "❌ .env file not found." -ForegroundColor Red
    exit 1
}


# Backup database
Write-Host "💾 Backing up the database..." -ForegroundColor Cyan
# Note: Using cmd /c to handle the redirection correctly with docker-compose
cmd /c "docker-compose exec -T db mysqldump --no-tablespaces -u root -p$($env:MYSQL_ROOT_PASSWORD) $($env:MYSQL_DATABASE) > `"$backupDir/$backupFilename.sql`""

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Database backup completed: $backupDir/$backupFilename.sql" -ForegroundColor Green
} else {
    Write-Host "❌ Error backing up the database." -ForegroundColor Red
}

# Backup wp-content directory
Write-Host "📁 Backing up wp-content files..." -ForegroundColor Cyan

if (Test-Path -Path "./wp-content") {
    Compress-Archive -Path "./wp-content" -DestinationPath "$backupDir/$backupFilename-wp-content.zip" -Force
    Write-Host "✅ wp-content files backup completed: $backupDir/$backupFilename-wp-content.zip" -ForegroundColor Green
} else {
    Write-Host "❌ wp-content directory not found." -ForegroundColor Red
}

Write-Host "`n🎉 Backup complete!" -ForegroundColor Green
Write-Host "📂 Backup files:" -ForegroundColor Cyan
Write-Host "   - $backupDir/$backupFilename.sql" -ForegroundColor Cyan
Write-Host "   - $backupDir/$backupFilename-wp-content.zip" -ForegroundColor Cyan