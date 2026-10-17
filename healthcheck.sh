#!/bin/bash
set -euo pipefail


if [[ -z "${1:-}" ]]; then 
    echo "Порт не передан!"
elif ss -tunlp | grep -wq ":$1"; then 
    if curl -s http://localhost:"$1"/health | grep status 1>/dev/null; then
        echo "Все корректно, статус выводится"
    else
        echo "Статус не выводится, возможно следует использовать другой порт"
    fi
else
    echo "Порт свободен"
fi 
