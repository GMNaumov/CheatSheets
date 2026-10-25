Важно учесть, что подключение к DeepSeek Harness, запущенном в контейнере, зависит от хостовой системы и способа установки ollama:

- Если DeepSeek Harness работает в контейнере Docker Desktop (Windows/macOS): `http://host.docker.internal:11434/v1`;
- Если DeepSeek Harness работает в контейнере Linux: `http://172.72.0.1:11434:v1` (тут должен быть IP настроенного docker-моста);
- Если и DeepSeek Harness и Ollama запущены в контейнерах Docker - предпочтительно использовать Dockerfile;

---
```Docker
docker build -t my-dsh .
```

 Собираем контейнер с DeepSeek Harness
 
 ---
```Docker
docker run -d --name dsh -p 3000:3000 my-dsh
```

Запускаем контейнер с DeepSeek Harness