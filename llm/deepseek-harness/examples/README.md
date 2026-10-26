# Пример DeepSeek Harness

Compose-конфигурация запускает DeepSeek Harness и Ollama в общей внутренней сети. Полная последовательность запуска и настройки описана в [руководстве](../guides/install-with-ollama.md).

## Запуск

Выполните команды в каталоге примера:

```bash
docker compose up -d ollama
docker compose exec ollama ollama pull qwen3:8b
docker compose up -d dsh
```

Интерфейс DSH будет доступен по адресу `http://localhost:3080`.

## Проверка состояния

Показывает состояние сервисов проекта и последние строки логов DSH. Для непрерывного просмотра добавьте `-f` к команде `logs`.

```bash
docker compose ps
docker compose logs --tail=100 dsh
```

## Остановка

Останавливает контейнеры и сеть проекта. Данные в именованных томах сохраняются.

```bash
docker compose down
```
