# Подключение DeepSeek Harness к Ollama

Подключение DeepSeek Harness, запущенного в контейнере, зависит от хостовой системы и способа запуска Ollama:

| Где работает Ollama | Адрес API для DSH | Условие |
| --- | --- | --- |
| На хосте Windows или macOS, DSH в Docker Desktop | `http://host.docker.internal:11434/v1` | Ollama принимает подключения от контейнера. |
| На хосте Linux, DSH в Docker | `http://172.17.0.1:11434/v1` | IP-адрес соответствует настроенному Docker-мосту; Ollama принимает подключения по нему. |
| В одной сети Docker Compose с DSH | `http://ollama:11434/v1` | Имя сервиса Ollama в Compose — `ollama`. |
