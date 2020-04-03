FROM openjdk:8-jre-alpine
ADD target/zuul-proxy-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8762
CMD ["/usr/bin/java", "-jar", "/app.jar"]



