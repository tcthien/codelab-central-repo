Vagrant.configure("2") do |config|
    config.vm.box = "tcthien/java-dev-server"


    config.vm.synced_folder "C:/Users/admin/.m2/repository", "/share/mavenRepo"
    config.vm.synced_folder "", "/share/source"

    config.vm.network "private_network", ip: "192.168.100.100"
    # MySQL Port
    config.vm.network "forwarded_port", guest: 3306, host: 3306
    # Cassandra Port
    config.vm.network "forwarded_port", guest: 9042, host: 9042
    # Gateway
    config.vm.network "forwarded_port", guest: 80, host: 80
    # Eureka Dashboard
    config.vm.network "forwarded_port", guest: 8761, host: 8761
    # Hystrix Dashboard
    config.vm.network "forwarded_port", guest: 9000, host: 9000
    # Turbin Stream Source for Hystrix Dashboard
    config.vm.network "forwarded_port", guest: 8989, host: 8989 
    # RabbitMq
    config.vm.network "forwarded_port", guest: 15672, host: 15672
    # Jenkins
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.network "forwarded_port", guest: 50000, host: 50000
    
    # codelab port
    for i in 20080..20088
        config.vm.network :forwarded_port, guest: i, host: i
    end
    for i in 20182..20184
        config.vm.network :forwarded_port, guest: i, host: i
    end 
    
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.name = "codelab-server"
    end

    config.vm.provision "shell", inline: <<-SHELL
        #Add PASSWORD TO ENV
        echo 'export CODELAB_USER="codelab"' >> ~/.bashrc
        echo 'export CODELAB_PASS="codelab"' >> ~/.bashrc
    SHELL

end

