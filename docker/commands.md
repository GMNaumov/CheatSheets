# Основные команды Docker

```bash
docker compose up -d
```

Запускает все сервисы, описанные в compose-файле (`compose.yaml`, `compose.yml`, `docker-compose.yaml` или `docker-compose.yml`).

Флаг `-d` (сокр. от `detach`) означает отсоединённый режим, контейнеры запускаются в фоне.

---
```bash
docker ps -a
```

Выводим список всех контейнеров. То же самое в новом синтаксисе:

```bash
docker container ls -a
```

---
```bash
docker ps -f "status=exited"
```

Фильтруем контейнеры по параметру, например `status`, и выводим результат на экран.

---
```bash
docker rm <имя_или_id_контейнера>
```

Удаляет контейнер по его имени или ID.

---
```bash
docker compose up -d --force-recreate dsh
```

Принудительно пересоздаёт контейнер сервиса `dsh` из конфигурации Compose, не пересобирая образ.

---
```bash
docker volume ls
```

Показывает список томов Docker.

---
```bash
docker volume rm <volume-name>
```

Удаляет том по имени `volume-name`. Можно последовательно указать несколько томов.
