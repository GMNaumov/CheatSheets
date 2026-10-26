# Первичная настройка Git

Команды для создания локального репозитория, настройки автора коммитов и подключения GitHub.

## Создать репозиторий и первый коммит

Выполните команды в каталоге проекта:

```bash
cd my-project
git init
git add .
git commit -m "Initial commit"
```

## Настроить автора коммитов

Git сохраняет имя и адрес электронной почты автора в новых коммитах. При настройке другого пользователя замените значения:

```bash
git config --global user.name "Georgii Naumov"
git config --global user.email "gmnaumov@yandex.ru"
```

## Подключить удалённый репозиторий

Замените URL на адрес своего репозитория. `git remote -v` позволяет проверить сохранённый адрес перед отправкой:

```bash
git remote add origin https://github.com/username/my-project.git
git remote -v
git push -u origin main
```
