sudo docker run -p 8180:8180 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e JAVA_OPTS=-Djboss.socket.binding.port-offset=100 quay.io/keycloak/keycloak:9.0.2
