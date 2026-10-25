```bash
sudo apt remove docker docker-engine docker.io containerd runc -y
```

Удаляем Docker "нагорячую" (на рабочей станции может привести к неработоспособности контейнеров)

---
```bash
sudo snap remove docker 2>/dev/null || true
```

Пытаемся удалить snap-пакет docker от имени суперпользователя. В случае, если удаление не удалось - не показываем ошибку, считаем команду успешно выполненной.

---
Безопасное удаление Docker с "сухим" прогоном

1. "Сухой" прогон (покажет план, но не выполнит удаление):

```bash
sudo apt autoremove --dry-run docker docker-engine docker.io containerd runc
```

2. Остановка служб:

```bash
sudo systemctl stop docker.service docker.socket containerd.service
```

3. Удаление пакетов:

```bash
sudo apt remove docker docker-engine docker.io containerd runc -y
```

4. Очищаем конфиги (`purge` удалит пакеты вместе с зависимостями):

```bash
sudo apt purge docker docker-engine docker.io containerd runc -y
```

5. Удаляем ненужные зависимости:

```bash
sudo apt autoremove -y
```

6. Чистим данные Docker (NB: удалит все образы, контейнеры и тома):

```bash
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf /etc/containerd
```

---
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg -dearmor -o /etc/apt/keyrings/docker.gpg
```

Скачиваем (в тихом режиме, с обработкой ошибок HTTP и редиректов) публичный GPG-ключ официального репозитория Docker и сохраняем его в систему как файл ключа в формате `keyring`, чтобы APT мог проверять подписи пакетов из этого репозитория.

---
```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Даём всем пользователям системы право на **чтение** файла GPG-ключа Docker

---
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list

```

Добавялем официальный APT-репозиторий Docker в систему. В процессе будет создан файл `/etc/apt/sources.list.d/docker.list`

---
```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Устанавливаем пакеты:

- Docker Engine (Community Edition)
- CLI-клиент Docker
- Контейнерный runtime `containerd`
- Плагины `Buildx` и `Compose V2`

---
```bash
sudo docker run hello-world
```

Проверяем работоспособность установленного Docker

---
```bash
sudo usermod -aG docker $USER
```

Добавляем текущего пользователя в дополнительную группу `docker` для запуска команд `docker` без sudo. Достигается за счёт того, что пользователь получает доступ к сокету `/var/run/docker.sock`, который принадлежит группе `docker`.

---
```bash
mkdir ~/ollama-docker && cd ~/ollama-docker
```

Создаём каталог `ollama-docker` и переходим в него

---

