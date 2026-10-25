# Скрипт для инициализации нового проекта Spring Boot

Запрос принимает параметры проекта и возвращает готовый ZIP-архив.

`baseDir` содержит имя папки, в котору будет распакован архив с проектом.

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