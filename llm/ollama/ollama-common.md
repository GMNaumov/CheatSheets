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
docker stats ollama
```

Мониторинг ресурсов контейнера `ollama`.