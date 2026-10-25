# Сборка llama.cpp в Ubuntu через Termux

Почти каждому 40-летнему мужику иногда приходит в голову мысль: «А что, если телефон на Android превратить в Linux-сервер и запустить внутри него локальную LLM?»

Инструкция предполагает, что на телефоне установлен Termux — терминальное окружение для Android.

---
```bash
termux-setup-storage
```

Даём Termux доступ к файловой системе телефона. Android запросит соответствующее разрешение.

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
proot-distro install ubuntu
```

Устанавливаем Ubuntu, внутри которой будем выполнять все дальнейшие действия.

---
```bash
proot-distro login ubuntu --isolated
```

Входим в установленное окружение. Используем `--isolated`, чтобы избежать конфликтов с окружением Termux.

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
cmake --build build --config Release -j$(nproc)
```

Клонируем репозиторий и собираем его. Технически, можно подключить оптимизации, но сработает и так.

Исполняемый файл будет создан по пути `build/bin/llama-server`.
