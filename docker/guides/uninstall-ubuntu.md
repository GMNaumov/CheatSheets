# Удаление Docker из Ubuntu

## Проверяем план удаления

Сначала выполняем сухой прогон: APT покажет план, но не изменит систему.

```bash
sudo apt-get purge --dry-run docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
```

## Удаляем пакеты

```bash
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo apt-get autoremove
```

`autoremove` удаляет автоматически установленные зависимости, которые больше не нужны. Перед подтверждением проверьте предложенный список.

## При необходимости удаляем данные

Следующие команды безвозвратно удалят локальные образы, контейнеры, тома и данные `containerd`. Пропустите этот шаг, если данные нужно сохранить.

```bash
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

Docker не удаляет изменённые конфигурационные файлы автоматически. Если репозиторий больше не нужен, удаляем его описание и ключ:

```bash
sudo rm -f /etc/apt/sources.list.d/docker.sources
sudo rm -f /etc/apt/keyrings/docker.asc
sudo apt-get update
```
