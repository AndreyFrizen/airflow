Airflow Deployment with Ansible & Docker

Проект автоматизированного развертывания Apache Airflow с использованием PostgreSQL, LDAP, Prometheus и Grafana через Ansible и Docker Compose.
📋 Системные требования

Перед запуском убедитесь, что на целевом сервере установлены:

    OS: Ubuntu 22.04+ (рекомендуется)

    Ansible: 2.10+

    Docker & Docker Compose: установлены на целевой машине.

    SSH-доступ: настроен по ключам для пользователя с правами sudo.

🚀 Быстрый старт
1. Подготовка

Клонируйте репозиторий и настройте переменные:
Bash

git clone <url-вашего-репозитория>
cd airflow-project

2. Конфигурация

    Отредактируйте inventory/hosts.ini — укажите IP-адрес вашего сервера.

    Проверьте переменные в group_vars/all/vars.yml (пароли, настройки БД).

    При необходимости обновите сертификаты в certificate/certs/.

3. Запуск развертывания

Запустите основной плейбук для настройки сервера и запуска контейнеров:
Bash

ansible-playbook -i inventory/hosts.ini deploy.yaml

🛠 Полезные команды
Управление контейнерами (на сервере)

Перейдите в директорию проекта: cd /opt/airflow

    Статус сервисов:
    Bash

    sudo docker compose ps

    Просмотр логов:
    Bash

    # Для всех контейнеров
    sudo docker compose logs -f
    # Для конкретного сервиса (например, webserver)
    sudo docker compose logs -f airflow-webserver

    Перезапуск стека:
    Bash

    sudo docker compose down
    sudo docker compose up -d

Обслуживание Airflow

    Создание пользователя-админа:
    Bash

    sudo docker compose exec airflow-webserver airflow users create \
      --username admin --firstname Admin --lastname Admin \
      --role Admin --email admin@example.com --password admin

    Проверка миграций БД:
    Bash

    sudo docker compose run --rm airflow-init airflow db migrate

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
