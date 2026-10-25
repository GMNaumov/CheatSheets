# Dockerfile
# Используем официальный образ Python без лишних понтов и библиотек.
FROM python:3.13-slim

# Устанавливаем рабочую директорию внутри контейнера.
WORKDIR /app

# Копируем файл с зависимостями и устанавливаем их.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта.
COPY . .

# Команда, которая выполнится при запуске контейнера.
CMD ["python", "app.py"]
