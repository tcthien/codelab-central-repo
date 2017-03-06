# Codelab
* Open source system for training 


### Setup
- Installing docker & docker compose
- Adding following user & password to environment variable:
```
    export CODELAB_USER=codelab
    export CODELAB_PASS=codelab
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

