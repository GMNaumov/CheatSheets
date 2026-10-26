# Удаление Docker из Ubuntu

Руководство по удалению пакетов Docker Engine, установленных из официального APT-репозитория. Данные и настройки можно удалить отдельными шагами.

## Перед началом

Убедитесь, что нужные данные в томах и контейнерах сохранены. Для команд потребуется доступ к `sudo`.

## Шаг 1. Проверить план удаления

Сначала выполняем сухой прогон: APT покажет план, но не изменит систему.

```bash
sudo apt-get purge --dry-run docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
```

## Шаг 2. Удалить пакеты

`autoremove` удаляет автоматически установленные зависимости, которые больше не нужны. Перед подтверждением проверьте предложенный список.

```bash
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo apt-get autoremove
```

## Необязательно: удалить данные

Следующие команды безвозвратно удалят локальные образы, контейнеры, тома и данные `containerd`. Пропустите этот шаг, если данные нужно сохранить.

```bash
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

## Необязательно: удалить APT-репозиторий

Docker не удаляет изменённые конфигурационные файлы автоматически. Если репозиторий больше не нужен, удаляем его описание и ключ:

```bash
sudo rm -f /etc/apt/sources.list.d/docker.sources
sudo rm -f /etc/apt/keyrings/docker.asc
sudo apt-get update
```
