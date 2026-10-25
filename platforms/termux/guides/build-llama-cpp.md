# Сборка llama.cpp в Ubuntu через Termux

Почти каждому 40-летнему мужику иногда приходит в голову мысль: «А что, если телефон на Android превратить в Linux-сервер и запустить внутри него локальную LLM?»

Инструкция предполагает, что на телефоне установлен Termux — терминальное окружение для Android.

---
```bash
pkg update -y && pkg upgrade -y
```

Обновляем пакеты. Всё просто и понятно.

---
```bash
pkg install -y proot-distro git curl wget termux-exec
```

Почти всё понятно, за исключением `proot-distro`. Этот пакет создаёт изолированное окружение, например Ubuntu, которое будет выступать заменой Docker: установить обычный Docker внутрь Android не получится.

---
```bash
proot-distro install ubuntu:24.04
```

Устанавливаем Ubuntu, внутри которой будем выполнять все дальнейшие действия.

---
```bash
proot-distro login ubuntu --isolated
```

Входим в установленное окружение. Флаг `--isolated` отключает стандартные привязки каталогов Termux, включая общую память Android, чтобы окружение было изолировано от файлов хоста.

---
Дальнейшие действия выполняются внутри созданного окружения — это обычные команды терминала Ubuntu.

---
```bash
apt update -y && apt upgrade -y
apt install -y build-essential git cmake
```

Обновляем пакеты, устанавливаем Git и инструменты сборки — да, собирать будем из исходников, только хардкор.

---
```bash
git clone https://github.com/ggml-org/llama.cpp.git
cd llama.cpp
cmake -B build -DGGML_NATIVE=ON
cmake --build build --config Release --target llama-server -j$(nproc)
```

Клонируем репозиторий и собираем только сервер. Технически, можно подключить дополнительные оптимизации, но базовой конфигурации достаточно для проверки сборки.

Исполняемый файл будет создан по пути `build/bin/llama-server`.
