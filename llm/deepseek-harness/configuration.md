# Подключение DeepSeek Harness к Ollama

Подключение DeepSeek Harness, запущенного в контейнере, зависит от хостовой системы и способа запуска Ollama:

- если DeepSeek Harness работает в Docker Desktop, а Ollama — на хосте Windows или macOS: `http://host.docker.internal:11434/v1`;
- если DeepSeek Harness работает в Docker на Linux, а Ollama — на хосте: `http://172.17.0.1:11434/v1`, где IP-адрес должен соответствовать настроенному Docker-мосту;
- если DeepSeek Harness и Ollama запущены в одной сети Docker Compose: `http://ollama:11434/v1`.
