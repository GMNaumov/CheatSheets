# Скрипт для инициализации нового проекта Spring Boot

Команда загружает готовый ZIP-архив проекта из Spring Initializr и распаковывает его в текущем каталоге. Нужны `curl` и `unzip`.

`baseDir` задаёт имя папки, в которую будет распакован архив. Перед запуском замените параметры проекта на нужные значения.

## Скачать и распаковать проект

```bash
curl https://start.spring.io/starter.zip \
  -d type=maven-project \
  -d dependencies=web,data-jpa,lombok \
  -d javaVersion=25 \
  -d bootVersion=4.1.2 \
  -d groupId=com.example \
  -d artifactId=my-project \
  -d name=my-project \
  -d packageName=com.example.myproject \
  -d baseDir=my-project \
  -o my-project.zip && unzip my-project.zip && rm my-project.zip
```

После распаковки перейдите в каталог `my-project` и используйте [команды запуска, тестирования и сборки](../commands.md).
