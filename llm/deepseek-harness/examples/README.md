# Пример DeepSeek Harness

Compose-конфигурация запускает DeepSeek Harness и Ollama в общей внутренней сети. Полная последовательность запуска и настройки описана в [руководстве](../guides/install-with-ollama.md).

```bash
docker compose up -d ollama
docker compose exec ollama ollama pull qwen3:8b
docker compose up -d dsh
```

Интерфейс DSH будет доступен по адресу `http://localhost:3080`.

Остановить окружение:

```bash
docker compose down
```
