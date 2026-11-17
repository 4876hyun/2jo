FROM eclipse-temurin:21-jre-alpine

ARG JAR_FILE_PATH=target/*.jar

COPY ${JAR_FILE_PATH} 2jo.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "2jo.jar"]
