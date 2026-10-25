import os

from ollama import Client

# Получаем адрес Ollama из переменной окружения
# Если переменная не задана, используем localhost для локального запуска.
ollama_host = os.getenv('OLLAMA_HOST', 'http://localhost:11434')
ollama_model = os.getenv('OLLAMA_MODEL', 'qwen3:4b')

print(f"Подключение к Ollama: {ollama_host}")
print(f"Модель: {ollama_model}")

# Создаём клиент для подключения к нашему серверу Ollama.
# Важно: в новых версиях библиотеки ollama используется конструктор Client()
client = Client(host=ollama_host)

print("Проверка модели...")
client.pull(ollama_model)

messages = [
    {
        'role': 'user',
        'content': 'Расскажи о параметрах своей модели',
    },
]

print("Отправка запроса к модели...")

# Отправляем запрос в выбранную модель.
# Параметр stream=False означает, что мы ждём полный ответ целиком.
response = client.chat(model=ollama_model, messages=messages, stream=False)

print("\n--- Ответ модели ---")
print(response['message']['content'])
