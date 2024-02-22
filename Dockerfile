## Используйте официальный образ OpenJDK для Java
#FROM openjdk:11-jdk-slim
#LABEL authors="s.slashchhinin"
#
## Установите рабочий каталог
#WORKDIR /app
#
## Скопируйте JAR-файл в контейнер
#COPY target/spring-boot_security-0.0.1-SNAPSHOT.jar app.jar
#
## Откройте порт, на котором работает ваше приложение
#EXPOSE 8080
#
## Скопируйте файлы Maven
#COPY mvnw .
#COPY .mvn .mvn
#COPY pom.xml .
#
### Кэшируем зависимости Maven
##RUN chmod +x mvnw && ./mvnw clean install -DskipTests
#
## Команда для запуска приложения при старте контейнера
#CMD ["java", "-jar", "app.jar"]


# Используйте официальный образ OpenJDK для Java
# Используйте официальный образ OpenJDK для Java
FROM openjdk:11-jdk-slim
LABEL authors="s.slashchhinin"

# Установите рабочий каталог
WORKDIR /app

# Создайте директорию для классов
RUN mkdir -p classes

# Скопируйте JAR-файл в контейнер
COPY target/spring-boot_security_demo-0.0.1-SNAPSHOT.jar app.jar

# Разархивируйте JAR-файл в директорию classes
RUN jar xf app.jar -C classes

# Откройте порт, на котором работает ваше приложение
EXPOSE 8080

# Команда для запуска приложения при старте контейнера
CMD ["java", "-cp", "classes:app.jar", "ru.kata.spring.boot_security.boot_security.SpringBootSecurityDemoApplication"]


