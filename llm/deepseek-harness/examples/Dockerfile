# Dockerfile для обособленного экземпляра DeepSeek Harness

FROM node:22-slim

# Устанавливаем внутри контейнера DeepSeek Harness
RUN npm install -g @deepseek-ai/dsh@latest

# Создаём рабочий каталог
WORKDIR /app

# Открываем порт, который использует dsn по умолчанию
EXPOSE 3080

# Запускаем web-морду, который будет доступен снаружи контейнера. Параметры `--host 0.0.0.0` обязательны, иначе доступ будет только внутри контейнера
CMD [ "dsh", "web", "--host", "0.0.0.0" ]