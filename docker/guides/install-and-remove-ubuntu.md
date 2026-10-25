# Установка и удаление Docker в Ubuntu

## Быстрое удаление

```bash
sudo apt remove docker docker-engine docker.io containerd runc -y
```

Удаляем Docker «нагорячую». На рабочей станции это приведёт к остановке и неработоспособности контейнеров.

---
```bash
sudo snap remove docker 2>/dev/null || true
```

Пытаемся удалить snap-пакет Docker от имени суперпользователя. Если удалить пакет не удалось, не показываем ошибку и считаем команду успешно выполненной.

## Последовательное удаление с сухим прогоном

1. Сухой прогон — показывает план, но не выполняет удаление:

```bash
sudo apt remove --dry-run docker docker-engine docker.io containerd runc
```

2. Остановка служб:

```bash
sudo systemctl stop docker.service docker.socket containerd.service
```

3. Удаление пакетов:

```bash
sudo apt remove docker docker-engine docker.io containerd runc -y
```

4. Удаляем пакеты вместе с их конфигурационными файлами:

```bash
sudo apt purge docker docker-engine docker.io containerd runc -y
```

5. Удаляем ненужные зависимости:

```bash
sudo apt autoremove -y
```

6. Очищаем данные Docker. Команды удалят все образы, контейнеры и тома:

```bash
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf /etc/containerd
```

## Установка

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg -dearmor -o /etc/apt/keyrings/docker.gpg
```

Скачиваем (в тихом режиме, с обработкой ошибок HTTP и редиректов) публичный GPG-ключ официального репозитория Docker и сохраняем его в систему как файл ключа в формате `keyring`, чтобы APT мог проверять подписи пакетов из этого репозитория.

---
```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Даём всем пользователям системы право на **чтение** файла GPG-ключа Docker.

---
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list

```

Добавляем официальный APT-репозиторий Docker в систему. В процессе будет создан файл `/etc/apt/sources.list.d/docker.list`.

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

Проверяем работоспособность установленного Docker.

---
```bash
sudo usermod -aG docker $USER
```

Добавляем текущего пользователя в дополнительную группу `docker` для запуска команд `docker` без sudo. Достигается за счёт того, что пользователь получает доступ к сокету `/var/run/docker.sock`, который принадлежит группе `docker`.

---
```bash
mkdir ~/ollama-docker && cd ~/ollama-docker
```

Создаём каталог `ollama-docker` и переходим в него.

