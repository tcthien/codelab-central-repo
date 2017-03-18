# Codelab
Open source system for online training 


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
<IP of your service>       codelab-config-service
<IP of your service>       codelab-monitor-service
<IP of your service>       codelab-registry-service
<IP of your service>       codelab-auth-service
<IP of your service>       codelab-gateway-service
<IP of your service>       rabbitmq
<IP of your service>       codelab-auth-mongodb
<IP of your service>       codelab-article-mongodb
<IP of your service>       codelab-account-mongodb
```

### Build the code
- Navigate to folder contains this repository
- Start Vagrant Box
```
    vagrant up
```
- SSH to this vagrant box (account: vagrant/vagrant)
- Build:
```
    cd /share/source
    mvn clean install -Dtest -DfailIfNoTests=false
```

### Run the code
- How to run:
```
    cd /share/source
    mvn clean install -Dtest -DfailIfNoTests=false
    docker-compose up --build
```
- If you couldn't connect to docker host, please add current user to docker group:
```
    # Add the docker group if it doesn't already exist:
    sudo groupadd docker
    # Add the connected user "${USER}" to the docker group. Change the user name to match your preferred user:
    sudo gpasswd -a ${USER} docker
    # Restart the Docker daemon:
    sudo service docker restart
```
- Restart your shell and try again

### Components
- codelab-config-service: Spring Cloud Configuration Service running on port 20088
- codelab-gateway-service: Central Gateway Service running on port 20080. Instead of using separated service like: codelab-auth-service:20084, codelab-account-service:20082, we can use gateway: codelab-gateway-service:20080/auth/..., or codelab-gateway-service:20080/account/...
- codelab-registry-service: Service registry running on port 20087
- codelab-monitoring-service: Service monitor running on port 20086(turbine: 20085)
- codelab-auth-service: Authentication service running on port 20084
- codelab-account-service: User Account Management running on port 20082
- codelab-article-service: tutorial service running on port 20083

### REST Endpoints
- UserController
```
    codelab-auth-service:20084/uaa/users/current
        - Method: GET
        - Authorization: Bearer <token>
        - Description: returns current principle
    
    codelab-auth-service:20084/uaa/users
        - Method: POST
        - Authorize: hasScope('server')
        - Description: create new user
    
    codelab-auth-service:20084/uaa/oauth/token?grant_type=password&username=thien&password=tcthien
        - Method: POST
        - Description: request new token
```

- AccountController
```
   codelab-account-service:20082/account/<account name>
        - Method: GET
        - Authorization: Bearer <token>
        - Authorize: hasScope('server')
        - Description: returns specific account
    
    codelab-account-service:20082/account/
        - Method: POST
        - Description: Create new account
    
    codelab-account-service:20082/account/current
        - Method: GET
        - Authorization: Bearer <token>
        - Description: returns current account
    
    codelab-account-service:20082/account/current
        - Method: PUT
        - Authorization: Bearer <token>
        - Description: modify current account
```