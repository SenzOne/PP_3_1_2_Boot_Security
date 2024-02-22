# Используйте официальный образ OpenJDK для Java с компилятором
FROM openjdk:11-jdk-slim


ENV JAVA_HOME /usr/local/openjdk-11
ENV PATH $JAVA_HOME/bin:$PATH

# Установите рабочий каталог
WORKDIR /app

# Копируйте файлы Maven POM и mvnw для ускорения сборки
COPY mvnw .
COPY .mvn .mvn

# Копируйте файлы проекта для выполнения сборки
COPY pom.xml .
COPY src src

## Выполните сборку проекта Maven
#RUN ./mvnw clean install -DskipTests

# Копируйте JAR-файл в контейнер
COPY target/spring-boot_security-demo-0.0.1-SNAPSHOT.jar app.jar

# Откройте порт, на котором работает ваше приложение
EXPOSE 8080

# Команда для запуска приложения при старте контейнера
CMD ["java", "-jar", "app.jar"]
#
#FROM openjdk:11-jdk-slim
#
#
#ENV JAVA_HOME /usr/local/openjdk-11
#ENV PATH $JAVA_HOME/bin:$PATH
#
## Установите рабочий каталог
#WORKDIR /app
#
## Копируйте файлы Maven POM и mvnw для ускорения сборки
#COPY mvnw .
#COPY .mvn .mvn
#
## Копируйте файлы проекта для выполнения сборки
#COPY pom.xml .
#COPY src src
#
## Выполните сборку проекта Maven
#RUN ./mvnw clean install -DskipTests
#
## Копируйте JAR-файл в контейнер
#COPY target/spring-boot_security-0.0.1-SNAPSHOT.jar app.jar
#
## Откройте порт, на котором работает ваше приложение
#EXPOSE 8080
#
## Команда для запуска приложения при старте контейнера
#CMD ["java", "-jar", "app.jar"]
