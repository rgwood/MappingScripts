# https://www.commandprompt.com/blog/a_better_backup_with_postgresql_using_pg_dump/

BACKUPFILENAME=${1:-gisBackup.sqlc}

if [ ! -f "$BACKUPFILENAME" ]; then
    echo "Backup file not found!"
    exit 1
fi

psql -h localhost postgres docker \
--command="select pg_terminate_backend(pid) from pg_stat_activity where datname = 'gis' and pid <> pg_backend_pid()"

psql -h localhost postgres docker --command="DROP DATABASE GIS"

echo "Starting restore..."
pg_restore -h localhost -U docker -C -d postgres gisBackup.sqlc
echo "Finished DB restore"