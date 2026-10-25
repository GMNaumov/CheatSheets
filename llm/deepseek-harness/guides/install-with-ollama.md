# Установка и настройка локального DeepSeek Harness с Ollama

Установим и настроим DeepSeek Harness (далее — DSH) и подключим его к модели, запущенной с помощью Ollama.

Всё окружение будет работать в Docker. Предполагается, что Docker уже установлен в системе.

Все проекты располагаются в каталоге `Projects`.

## Шаг 1. Создаём каталог проекта

```bash
mkdir Projects/dsh-local && cd Projects/dsh-local
```

## Шаг 2. Создаём Compose-файл

```bash
touch compose.yaml
```

В созданный `compose.yaml` копируем содержимое [примера](../examples/compose.yaml). В нём нужно обратить внимание на следующие настройки:

- контейнеры взаимодействуют через внутреннюю сеть `dsh-net`;

- порт DSH опубликован как `127.0.0.1:3080:3080`, поэтому интерфейс доступен только с хостовой машины;
- порт Ollama `11434` на хост не опубликован и доступен только другим контейнерам в сети `dsh-net`;
- для доступа к DSH с других устройств необходимо изменить привязку порта и настроить `DSH_CONTAINER_KEY` и `DSH_CONTAINER_TRUSTED_HOSTS`;

- `DSH_CONTAINER_TRUSTED_HOSTS` определяет, каким именам хостов можно доверять. В примере разрешены `localhost`, `127.0.0.1` и `dsh`.

## Шаг 3. Запускаем Ollama и загружаем модель qwen3:8b

```bash
docker compose up -d ollama
docker compose exec ollama ollama pull qwen3:8b
docker compose exec ollama ollama list
```

В результате должны увидеть что-то похожее:

```text
NAME                ID              SIZE      MODIFIED
qwen3:8b            500a1f067a9f    5.2 GB    46 minutes ago
```

## Шаг 4. Запускаем контейнер DSH

```bash
docker compose up -d dsh
```

Открываем в браузере `http://localhost:3080` и проверяем работу интерфейса.

## Шаг 5. Настраиваем подключение DSH к Ollama

- В интерфейсе DSH находим раздел `Settings`.

  ![DSH Settings](../assets/dsh-settings.png)

- В настройках находим раздел `Models` и выбираем `+ Add model provider`.

  ![Add model](../assets/dsh-model-add.png)

- В открывшемся окне выбираем `Custom model API` и заполняем поля:

  - `API key`: `ollama`. DSH требует непустой API-ключ для любого провайдера, но локальный сервер Ollama его не проверяет;

  - `Provider ID`: `ollama`;
  - `Display name`: `ollama`;

  - `Base URL`: `http://ollama:11434/v1`. Адрес работает внутри сети Compose; имя `ollama` недоступно с хостовой машины;

  - `API Protocol`: `OpenAI Chat Completions`.

- Нажимаем `Fetch available models`. Если всё настроено правильно и модель загружена, появится список доступных моделей. Выбираем нужные модели и нажимаем `Add selected`.

  ![Models available](../assets/dsh-models-available.png)

- Завершаем настройку кнопкой `Create provider`.

## Шаг 6. Проверяем подключение

Создаём Workspace и сессию, выбираем модель, отправляем запрос и радуемся тому, какие мы большие молодцы.
