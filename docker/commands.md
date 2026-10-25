```docker
docker compose up -d
```
Запускает все сервисы, описанные в compose-файле (`compose.yaml`, `compose.yml`, `docker-compose.yaml` или `docker-compose.yml`).

Флаг `-d` (сокр. от `detach`) означает отсоединённый режим, контейнеры запускаются в фоне.

---
```Docker
docker ps -a
```

Выводим список всех контейнеров. То же самое в новом синтаксисе:

```Docker
docker container ls -a
```

---
```Docker
docker ps -f "status=exited"
```

Фильтруем контейнеры по какому-либо параметру (например, status) и отображаем на экране

---
```Docker
docker rm <имя_или_id_контейнера>
```

Удолить контейнер по его имени или ID

---
```Docker
docker compose up -d --force-recreate dsh
```

Принудительно пересобрать контейнер с именем `dsh` из данных в файле docker-compose.yml

---
```Docker
docker volume ls
```

Показать список всех volume-ов, используемых контейнерами Docker

---
```Docker
docker volume rm <volume-name>
```

Удалить том по его имени `volume-name`. Поддерживает возможность последовательного указания нескольких томов.