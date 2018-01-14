# https://www.commandprompt.com/blog/a_better_backup_with_postgresql_using_pg_dump/

echo "Backing up..."
pg_dump -h localhost -U docker --format=c --file=gisBackup.sqlc gis

echo "Backed up. Copying to ~Documents/DatabaseBackups"
cp gisBackup.sqlc ~/Documents/DatabaseBackups/gisBackup-$(date +%Y%m%d).sqlc


echo "Done!"