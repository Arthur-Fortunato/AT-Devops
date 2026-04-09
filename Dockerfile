# Esse primeiro tá buildando o projeto
FROM maven:3.9.14-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY src src

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Esse segundo roda o projeto... Não sei nem pra q eu tô comentando isso :/
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]