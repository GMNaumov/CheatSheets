# Команды Ollama в Docker

```bash
docker exec ollama ollama --version
```

Получаем версию Ollama, запущенной в контейнере Docker.

---
```bash
docker exec ollama ollama list
```

Выводим список скачанных моделей Ollama.

---
```bash
docker compose down
```

Останавливаем и удаляем контейнеры и сеть проекта. Данные сохраняются в томе.

---
```bash
docker compose up -d
```

Запускаем контейнер снова. Команда должна выполняться в каталоге с `compose.yaml`.

---

```bash
docker exec -it ollama ollama pull phi4-mini
```

Внутри ранее созданного контейнера `ollama` выполняем команду `ollama pull phi4-mini` для скачивания модели `phi4-mini`.

---
```bash
docker exec -it ollama ollama run phi4-mini
```

Внутри контейнера `ollama` запускаем интерактивный чат.

---
```bash
docker exec -it ollama ollama stop phi4-mini
```
Останавливаем и выгружаем из памяти модель (на примере `phi4-mini`), не удаляя файлы.

---
```bash
docker stats ollama
```

Мониторинг ресурсов контейнера `ollama`.

---
```bash
docker exec -it ollama sh
```

Открываем оболочку `sh` внутри контейнера Ollama.

---
```bash
docker exec -it ollama ollama rm phi4-mini
```

Удаляем модель с диска (на примере `phi4-mini`).
