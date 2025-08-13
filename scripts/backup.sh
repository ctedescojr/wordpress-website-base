#!/bin/bash

echo "📦 Starting WordPress backup..."

# Create backup directory if it doesn't exist
backupDir="./backups"
if [ ! -d "$backupDir" ]; then
    mkdir -p "$backupDir"
    echo "✅ Backup directory created."
fi

# Get current date for backup filename
date=$(date +"%Y-%m-%d_%H-%M")
backupFilename="wordpress_backup_$date"

# Load environment variables
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "❌ .env file not found."
    exit 1
fi

# Backup database
echo "💾 Backing up the database..."
docker-compose exec -T db mysqldump --no-tablespaces -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" > "$backupDir/$backupFilename.sql"

if [ $? -eq 0 ]; then
    echo "✅ Database backup completed: $backupDir/$backupFilename.sql"
else
    echo "❌ Error backing up the database."
fi

# Backup wp-content directory
echo "📁 Backing up wp-content files..."

if [ -d "./wp-content" ]; then
    tar -czf "$backupDir/$backupFilename-wp-content.tar.gz" -C ./ wp-content
    echo "✅ wp-content files backup completed: $backupDir/$backupFilename-wp-content.tar.gz"
else
    echo "❌ wp-content directory not found."
fi

echo ""
echo "🎉 Backup complete!"
echo "📂 Backup files:"
echo "   - $backupDir/$backupFilename.sql"
echo "   - $backupDir/$backupFilename-wp-content.tar.gz"