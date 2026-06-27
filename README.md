### ПРЕДУПРЕЖДЕНИЕ

В целях теста vault опущен и все перменные в том числе секреты хранятся в открытом виде

Airflow Deployment with Ansible & Docker

Проект автоматизированного развертывания Apache Airflow с использованием PostgreSQL, LDAP, Prometheus и Grafana через Ansible и Docker Compose.

📋 Системные требования

    OS: Ubuntu 22.04+ (рекомендуется)

    Ansible: 2.10+

    Docker & Docker Compose: установлены на целевой машине.

    SSH-доступ: настроен по ключам для пользователя с правами sudo.

🚀 Быстрый старт

Запустите основной плейбук для настройки сервера и запуска контейнеров:
```bash
ansible-playbook -i inventory/hosts.ini deploy.yaml
```

📂 Структура проекта

    group_vars/ — переменные окружения и секреты.

    inventory/ — список хостов для деплоя.

    roles/ — основные роли (airflow, certificate, common).

    templates/ — шаблоны конфигурации (docker-compose.yaml.j2, airflow.cfg.j2).

    deploy.yaml — главный файл сценария развертывания.

💡 Устранение неполадок

    Веб-интерфейс недоступен: Проверьте sudo docker compose ps, запущен ли airflow-webserver. Если нет — смотрите логи logs airflow-webserver.

    Ошибка подключения к БД: Убедитесь, что пароль в vars.yml совпадает с тем, что ожидает PostgreSQL (проверьте переменные окружения через docker compose config).

    Ошибки синтаксиса YAML: Если плейбук падает, используйте sudo docker compose config для проверки валидности сгенерированного файла.

Проект готов к работе. При добавлении новых DAG, просто скопируйте их в папку dags/ на сервере (или добавьте задачу копирования в плейбук).
