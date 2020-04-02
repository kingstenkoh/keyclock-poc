FROM openjdk:8-jre-alpine
ADD target/api-service-0.0.1-SNAPSHOT.jar app.jar
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=test", "/app.jar"]



