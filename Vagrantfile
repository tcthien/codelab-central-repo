Vagrant.configure("2") do |config|
    config.vm.box = "tcthien/java-dev-server"


    config.vm.synced_folder "C:/Users/admin/.m2/repository", "/share/mavenRepo"
    config.vm.synced_folder "", "/share/source"

    config.vm.network "private_network", ip: "192.168.100.100"
    
    
    # DBL: MySQL Port, Cassandra Port
    config.vm.network "forwarded_port", guest: 3306, host: 3306
    config.vm.network "forwarded_port", guest: 9042, host: 9042
    
    # HTTP: Common
    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.network "forwarded_port", guest: 443, host: 443
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    
    # codelab port
    for i in 20080..20088
        config.vm.network :forwarded_port, guest: i, host: i
    end
    for i in 20182..20184
        config.vm.network :forwarded_port, guest: i, host: i
    end 
    
    # CI Tools: Jenkins, SonarQube, Nexus, GitLab, SeleniumGrid
    config.vm.network "forwarded_port", guest: 18080, host: 18080
    config.vm.network "forwarded_port", guest: 19000, host: 19000
    config.vm.network "forwarded_port", guest: 18081, host: 18081
    config.vm.network "forwarded_port", guest: 10080, host: 10080
    config.vm.network "forwarded_port", guest: 4444, host: 4444
    
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

