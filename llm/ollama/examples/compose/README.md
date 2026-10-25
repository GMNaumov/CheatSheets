# Ollama через Docker Compose

Пример запускает Ollama с ограничениями ресурсов и хранит загруженные модели в именованном томе.

```bash
docker compose up -d
docker compose exec ollama ollama pull qwen3:4b
docker compose exec ollama ollama list
```

API доступен только на локальном интерфейсе по адресу `http://localhost:11434`.

Остановить окружение:

```bash
docker compose down
```
