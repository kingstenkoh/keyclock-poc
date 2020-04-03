# keyclock-poc
This is the POC building keycloak authorization with spring eureka, zuul.

***
- ZUUL for Proxy/API gateway
- EUREKA for Load balancing
- KEYCLOACK for Identity and Access Management
***

- ZUUL Server (http://localhost:8762) -- startup - mvn install && mvn spring-boot:run

- EUREKA Server (http://localhost:8761) -- startup - mvn install && mvn spring-boot:run

- KEYCLOAK Server (http://localhost:8180) -- startup - ./start-keycloak.sh (require docker installation)

- API-SERVICE (http://localhost:8080) -- startup - mvn install && mvn spring-boot:run



***Setup Keycloak*** 

- Start Keycloak server by executing ./start-keycloak.sh
- Once started up, launch your browser go to http://localhost:8180/auth/admin, login with admin/admin
- Visit http://localhost:8180/auth/admin/master/console/#/create/realm and create realm by import file which you find at zuul-server/config/realm-export.json
- Once realm created, select the select app-authz-rest-springboot realm from top left corner (the dropdown below keycloak logo)
- Click clients, click “app-authz-rest-springboot”->”Credentials”-> Regenerate secret, copy the secret into and change the keycloak.credentials.secret properties in zuul-server/src/main/resources/application.properties
- Follow the previous step to regenerate the secret for pre-login, quick-login-client and full-login-client, copy out the secret key and save it into notepad for later use.
- Create following user for testing

| username  | Role | credentials |
| ------------- | ------------- | ------------- |
| kingsten  | public, user  | password | 
| public  | public  | password |

***Start your Eureka Server***

- Netflix Eureka is a service registry and service discovery component. It will ease our work by registering each micro-service to centralized location and it provides easier way for inter process communication.
Build and run using maven, execute below command withing the project location.

```
cd eureka-server
mvn install && mvn spring-boot:run
```

- This will start your Eureka server on port 8761
- Start your Micro-service
```
cd api-service
mvn install && mvn spring-boot:run
```
- This will start your API service on port 8080
Start your Zuul API Gateway
Netflix Zuul is a API gateway. It will provide easy routing towards your microservices.
```
cd zuul-server
mvn install && mvn spring-boot:run
```
- This will start your ZUUL server on port 8762

***Launch your postman***
- Import the postman collection json keycloak-test.postman_collection.json and environment configuration local.postman_environment.json
Update the environment value pre-login-password, quick-login-password and full-login-password with respective’s client credentials

***Testing Pre-login***
- Fire the pre-login script.
- Fire test-pre-login-resource, expect response “Access Granted”
- Fire test-quick-login-resource, expect http status 403
- Fire test-full-login-resource, expect http status 403

***Testing Quick-Login***
- Fire the quick-login script.
- Fire test-pre-login-resource, expect http status 403
- Fire test-quick-login-resource, expect response “Access Granted” 
- Fire test-full-login-resource, expect http status 403

***Testing Full-Login***
- Fire the full-login script.
- Fire test-pre-login-resource, expect http status 403
- Fire test-quick-login-resource, expect http status 403
- Fire test-full-login-resource, expect response “Access Granted”
