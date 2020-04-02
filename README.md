# keyclock-poc
This is the POC building keycloak authorization with spring eureka, zuul.

***
- ZUUL for Proxy/API gateway
- EUREKA for Load balancing
- KEYCLOACK for Identity and Access Management
***

- ZUUL Server (http://localhost:8762) -- startup - mvn install && mvn spring-boot:run

- EUREKA Server (http://localhost:8761) -- startup - mvn install && mvn spring-boot:run

- KEYCLOACK Server (http://localhost:8180) -- startup - ./start-keycloak.sh (require docker installation)

- API-SERVICE (http://localhost:8080) -- startup - mvn install && mvn spring-boot:run
