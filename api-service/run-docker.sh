sudo docker run -p 8080:8080 --net=host -e hostName=$HOSTNAME -e eureka.client.serviceUrl.defaultZone="http://$HOSTNAME:8761/eureka" api-service:v1
