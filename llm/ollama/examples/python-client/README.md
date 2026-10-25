# Python-клиент Ollama

Пример запускает Ollama и одноразовый Python-клиент. При первом запуске клиент автоматически загрузит модель `qwen3:4b`, поэтому выполнение займёт больше времени и потребует подключения к интернету.

```bash
docker compose run --rm client
```

Для другой модели измените `OLLAMA_MODEL` в `compose.yaml`.

Остановить Ollama:

```bash
docker compose down
```
