#!/bin/bash

set -euo pipefail

if [[ "$1" == "up" ]]; then
    docker compose -f /home/leg/git/git-practice/docker-compose.yml up -d --build
    curl http://localhost:8001/health
elif [[ "$1" == "down" ]]; then
    curr_time=$(date "+%Y-%m-%d %H:%M")
    clean () {
        local exit_code=$?
        if [[  "$exit_code" -ne 0 ]]; then  
            rm -rf ./tmpdir_"$curr_time"
        fi
    }
    trap clean EXIT
    mkdir ./tmpdir_"$curr_time"
    cp /home/leg/git/git-practice/docker-compose.yml ./tmpdir_"$curr_time"
    docker compose -f /home/leg/git/git-practice/docker-compose.yml down
elif [[ "$1" == "status" ]]; then
    docker ps 
    curl  http://localhost/health 
else
    echo "Некорректная команда. Доступны up - поднять yml, down - остановить контейнеры, запущенные yml, status - просмотр информации о запущенных контейнарх"
fi
