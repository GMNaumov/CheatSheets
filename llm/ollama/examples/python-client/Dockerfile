FROM python:3.13-slim

# Устанавливаем рабочую директорию внутри контейнера.
WORKDIR /app

# Копируем файл с зависимостями и устанавливаем их.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Создаём непривилегированного пользователя и копируем приложение.
RUN useradd --create-home --uid 10001 app
COPY app.py .
USER app

# Команда, которая выполнится при запуске контейнера.
CMD ["python", "app.py"]
