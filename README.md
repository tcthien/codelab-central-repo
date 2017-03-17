# Codelab
* Open source system for training 


### Setup
- Checking out following guide to setup Vagrant effectively https://github.com/tcthien/vagrant-java-server
- Adding following user & password to environment variable:
```
    #Add PASSWORD TO ENV
    echo 'export CODELAB_USER="codelab"' >> ~/.bashrc
    echo 'export CODELAB_PASS="codelab"' >> ~/.bashrc
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

### Components
- codelab-config-service: Spring Cloud Configuration Service running on port 20088
- codelab-gateway-service: Central Gateway Service running on port 20080
- codelab-registry-service
- codelab-monitoring-service
- codelab-auth-service
- codelab-account-service
- codelab-article-service

