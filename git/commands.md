# Первичная настройка Git

"Git init и первый коммит", - инициализируем Git в каталоге и делаем первый коммит:

```bash
cd my-project
git init
git add .
git commit -m "Initial commit"
```

Задаём имя и адрес электронной почты автора, которые Git сохраняет в создаваемых коммитах:

```bash
git config --global user.name "Georgii Naumov"
git config --global user.email "gmnaumov@yandex.ru"
```

Связываем локальный и удалённый репозитории

```bash
git remote add origin *ссылка на репозиторий на GitHub* (прим. https://github.com/ваш-username/my-project.git)

git remote -v

git push -u origin main
```