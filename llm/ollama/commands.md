# Команды Ollama в Docker

Команды для контейнера с именем `ollama`. Команды Compose выполняются в каталоге с `compose.yaml`; в примерах управления моделями используется `phi4-mini`.

## Контейнер и окружение

### Узнать версию Ollama

```bash
docker exec ollama ollama --version
```

### Показать загруженные модели

```bash
docker exec ollama ollama list
```

### Остановить окружение Compose

Останавливает и удаляет контейнеры и сеть проекта. Данные остаются в именованном томе.

```bash
docker compose down
```

### Запустить окружение Compose

```bash
docker compose up -d
```

### Посмотреть использование ресурсов

```bash
docker stats ollama
```

### Открыть оболочку контейнера

```bash
docker exec -it ollama sh
```

## Модели

### Загрузить модель

Скачивает `phi4-mini` в контейнер. Понадобятся интернет и свободное место на диске.

```bash
docker exec ollama ollama pull phi4-mini
```

### Запустить интерактивный чат

Флаг `-it` подключает терминал для ввода сообщений.

```bash
docker exec -it ollama ollama run phi4-mini
```

### Остановить модель

Выгружает модель из памяти, сохраняя её файлы.

```bash
docker exec ollama ollama stop phi4-mini
```

### Удалить модель с диска

Удаляет файлы модели `phi4-mini` из хранилища Ollama.

```bash
docker exec ollama ollama rm phi4-mini
```
