#!/bin/bash

# Экспорт переменных окружения
export MASTER_DATA_DIRECTORY=/home/greenplum/gpdata/master/gpseg-1

# Проверяем запуск от root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Подготовка перед переключением пользователя
echo "Setting up environment variables for Greenplum..."
source /usr/local/greenplum-db-6.19.1/greenplum_path.sh

# Запуск от имени gpadmin
echo "Switching to gpadmin user and starting Greenplum..."
su - gpadmin -c "
    export MASTER_DATA_DIRECTORY=/home/greenplum/gpdata/master/gpseg-1 &&
    source /usr/local/greenplum-db-6.19.1/greenplum_path.sh &&
    source /home/gpadmin/.bashrc &&
    gpstart &&
    echo 'Greenplum started successfully.'
    # pg_ctl reload -D /home/greenplum/gpdata/master/gpseg-1 &&
    # gpstop -a &&  # Остановка Greenplum с подтверждением
    # echo 'y' | gpstart       # Запуск Greenplum с подтверждением
"

# Если переданы аргументы, выполняем их
exec "$@"


