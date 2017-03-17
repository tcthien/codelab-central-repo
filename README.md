# Codelab
* Open source system for training 


### Setup
- Installing docker & docker compose
- Adding following user & password to environment variable:
```
    export CODELAB_USER=codelab
    export CODELAB_PASS=codelab
```
- Adding following entry to host file:
```
#Define for software service
<IP of your service>       codelab
<IP of your service>       codelab-config
<IP of your service>       codelab-monitor
<IP of your service>       codelab-registry
<IP of your service>       codelab-auth-service
<IP of your service>       codelab-gateway
<IP of your service>       rabbitmq
<IP of your service>       codelab-auth-mongodb
<IP of your service>       codelab-article-mongodb
<IP of your service>       codelab-account-mongodb
```
- Checking out following guide to setup Vagrant effectively https://github.com/tcthien/vagrant-java-server

### Components
- codelab-config-service: Spring Cloud Configuration Service running on port 20088
- codelab-gateway-service: Central Gateway Service running on port 20080
- codelab-registry-service
- codelab-monitoring-service
- codelab-auth-service
- codelab-account-service
- codelab-article-service

