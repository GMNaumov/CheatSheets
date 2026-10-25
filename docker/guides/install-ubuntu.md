# Установка Docker в Ubuntu

Инструкция использует официальный APT-репозиторий Docker.

## Удаляем конфликтующие пакеты

Перед установкой Docker Engine удаляем пакеты, которые могут конфликтовать с официальными пакетами Docker:

```bash
for package in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
  sudo apt-get remove "$package"
done
```

## Добавляем официальный репозиторий

```bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

Создаём описание репозитория в формате deb822:

```bash
echo "Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc" | \
  sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null

sudo apt-get update
```

## Устанавливаем Docker Engine

```bash
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Проверяем состояние службы и запускаем тестовый контейнер:

```bash
sudo systemctl status docker --no-pager
sudo docker run --rm hello-world
```

## Настраиваем запуск без sudo

Группа `docker` предоставляет привилегии уровня `root`. Добавляйте в неё только доверенных пользователей.

```bash
sudo usermod -aG docker "$USER"
```

Чтобы применить членство в группе, выйдите из пользовательского сеанса и войдите снова. Для текущего терминала можно выполнить:

```bash
newgrp docker
docker run --rm hello-world
```
