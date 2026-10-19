```Docker
docker exec ollama ollama --version
```

Получаем версию ollama, запущенную в контейнере Docker.

---
```Docker
docker exec ollama ollama list
```

Список скачанных моделей в ollama

---
```Docker
docker compose down
```

Остановка контейнера (данные сохраняются в томе)

---
```Docker
docker compose up -d
```

Запустить контейнер снова. Команда должна выполняться в каталоге с docker-compose.yml

---

```Docker
docker exec -it ollama ollama pull phi4-mini
```

Внутри ранее созданного контейнера `ollama` выполняем команду `ollama pull phi4-mini` для скачивания модели `phi4-mini`.

---
```Docker
docker exec -it ollama ollama run phi4-mini
```

Внутри контейнера `ollama` запускаем интерактивный чат

---
```Docker
docker exec -it ollama ollama stop phi4-mini
```
Останавливаем и выгружаем из памяти модель (на примере `phi4-mini`), не удаляя файлы.

---
```Docker
docker stats ollama
```

Мониторинг ресурсов контейнера `ollama`.

---
```Docker
docker exec -it ollama sh
```

...что эквивалентно

```Docker
docker exec -it ollama bash
```

"Проваливаемся" внутрь контейнера ollama для выполнения команд внутри него.

---
```Docker
docker exec -it ollama ollama rm phi4-mini
```

Удаляем модель с диска (на примере `phi4-mini`).