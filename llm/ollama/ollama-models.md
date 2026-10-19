### Список моделей, доступных в ollama. Актуально на октябрь 2026 г.

Имя каждой модели можно подставлять в команды из файла [c командами терминала ollama](ollama-common.md). Т.е. для модели `megachad:228b` команда скачивания модели будет выглядеть как:

```Docker
docker exec -it ollama ollama pull megachad:228b
```
В скобках указан примерный размер модели.

Собственно, список моделей:

#### llama3.1:

- `llama3.1:8b` (4.9GB)
- `llama3.1:70b` (43GB)
- `llama3.1:405b` (243GB)

#### llama3.2:

- `llama3.2:1b` (1.3GB)
- `llama3.2:3b` (2qwGB)

#### qwen3:

- `qwen3:0.6b` (0.5GB)
- `qwen3:1.7b` (1.4GB)
- `qwen3:4b` (2.5GB)
- `qwen3:8b` (5.2GB)
- `qwen3:14b` (9.3GB)
- `qwen3:30b` (19GB)
- `qwen3:32b` (20GB)
- `qwen3:235b` (142GB)

#### phi4-mini:

- `phi4-mini:3.8b` (2.5GB)