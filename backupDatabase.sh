# https://www.commandprompt.com/blog/a_better_backup_with_postgresql_using_pg_dump/
pg_dump -h localhost -U docker --format=c --file=gisBackup.sqlc gis