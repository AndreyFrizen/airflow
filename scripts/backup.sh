#!/bin/bash
# Скрипт безопасного резервного копирования бэкенда ETL
source .env
BACKUP_DIR="./backups"
mkdir -p $BACKUP_DIR

TIMESTAMP=$(date +%F_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/airflow_db_$TIMESTAMP.sql"

echo "Запуск резервного копирования базы данных Airflow..."
docker compose exec -t postgresql pg_dump -U $POSTGRES_USER $POSTGRES_DB > $BACKUP_FILE

echo "Бэкап успешно сохранен в: $BACKUP_FILE"
