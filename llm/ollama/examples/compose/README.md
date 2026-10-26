# Ollama через Docker Compose

Пример запускает Ollama с ограничениями ресурсов и хранит загруженные модели в именованном томе.

## Запуск

Выполните команды в каталоге примера:

```bash
docker compose up -d
docker compose exec ollama ollama pull qwen3:4b
docker compose exec ollama ollama list
```

API доступен только на локальном интерфейсе по адресу `http://localhost:11434`.

## Остановка

Данные в именованном томе сохранятся после остановки.

```bash
docker compose down
```
