Java()
{
	java -version
	
	if [ $? = 0 ]
		then 
		echo "=========================="
		echo "java is already installed "
		echo "=========================="
		else
		
		 echo 'Java Installation start)'
	    echo '-----------------------'
		cd /opt
		sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.rpm
		sudo yum install jdk-8u191-linux-x64.rpm -y
		echo "export JAVA_HOME=/usr/java/jdk1.8.0_191-amd64" >> /etc/profile
        text='export PATH=$PATH:$JAVA_HOME/bin'
        echo "$text" >> /etc/profile
        source /etc/profile
        echo
        echo "===================="
		echo "JAVA-VERSION"
		echo "===================="
		java -version
		echo 'Java Installation done successfully.)'
	    echo '-----------------------------------'
	fi	
}

Ant()
	{
		ant -version
		if [ $? = 0 ]
		then 
		echo "========================="
		echo "Ant is already installed "
		echo "========================="
		else 
		Java
		cd /opt
			echo "ANT Downloading"
	    	wget http://www-eu.apache.org/dist//ant/binaries/apache-ant-1.10.5-bin.zip -O apache-ant-1.10.5.zip
	    	unzip apache-ant-1.10.5.zip
	    	echo "export ANT_HOME=/opt/apache-ant-1.10.5" >> /etc/profile
	    	text='export PATH=$PATH:$ANT_HOME/bin'
            echo "$text" >> /etc/profile
            source /etc/profile
            echo
            echo "===================="
			echo "ANT-VERSION"
			echo "===================="
			ant -version
			fi
	}
	
Maven()
	{
		mvn -version
		if [ $? = 0 ]
			then 
			echo "==========================="
			echo "Maven is already installed "
			echo "==========================="
			else
			Java
			cd /opt
			echo "MAVEN Downloading"
            wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.zip -O apache-maven-3.6.0.zip
            unzip apache-maven-3.6.0.zip
	    	echo "export M2_HOME=/opt/apache-maven-3.6.0" >> /etc/profile
	    	text='export PATH=$PATH:$M2_HOME/bin'
            echo "$text" >> /etc/profile
            source /etc/profile
            echo
            echo "===================="
			echo "MAVEN-VERSION"
			echo "===================="
			mvn -version
			fi
	}	
	
	TomcatOutAccess()
	{
		cd /opt/apache-tomcat-9.0.12/webapps/host-manager/META-INF
		sed -i "19i <!-- " context.xml
		sed -i "22i --> " context.xml
		cd /opt/apache-tomcat-9.0.12/webapps/manager/META-INF
		sed -i "19i <!-- " context.xml
		sed -i "22i --> " context.xml
	}
Tomcat()
	{	
		if [ -e /opt/apache-tomcat-9.0.12 ]
			then
			echo
			echo "=========================="
			echo " tomcat already installed "
			echo "=========================="
			else
		Java
		cd /opt
		echo "Tomcat Downloading"
            wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.12/bin/apache-tomcat-9.0.12.zip
            unzip apache-tomcat-9.0.12.zip
			chmod -R 777 apache-tomcat-9.0.12
			TomcatOutAccess
		fi
	}
Wildfly()
	{	
		if [ -e /opt/wildfly-13.0.0.Final ]
			then 
			echo
			echo "============================="
			echo " Wildfly is already installed "
			echo "============================="
			else
		Java
		cd /opt
		echo "WildFly Downloading"
            wget http://download.jboss.org/wildfly/13.0.0.Final/wildfly-13.0.0.Final.tar.gz
            tar -zxvf wildfly-13.0.0.Final.tar.gz
			fi
	}
Sonarscanner()
	{
		sonar-scanner -v
		if [ $? = 0 ]
		then
		echo
		echo "===================================="
		echo " sonar-scanner is already installed "
		echo "===================================="
		else
		Java
		cd /opt
		echo "SONAR-SCANNER Downloading"
            wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip 
            unzip sonar-scanner-cli-3.2.0.1227-linux.zip
	    	echo "export SONAR_SCANNER=/opt/sonar-scanner-3.2.0.1227-linux" >> /etc/profile
	    	text='export PATH=$PATH:$SONAR_SCANNER/bin'
            echo "$text" >> /etc/profile
            source /etc/profile
            echo
            echo "===================="
			echo "SONAR-SCANNER-VERSION"
			echo "===================="
			sonar-scanner -v
		fi
	}
Sonarqube()
	{
		if [ -e /opt/sonarqube-7.4 ]
		then 
		echo
		echo "================================"
		echo " Sonarqube is already installed "
		echo "================================"
		else
		Sonarscanner
		Java
		cd /opt
		echo "Sonarqube Downloading"
            wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.4.zip
            unzip sonarqube-7.4.zip
		fi
	}
Nexus()
 {
	if [ -e /opt/nexus-nexus ]
	then 
	echo
	echo "==========================="
	echo " Nexus is already installed "
	echo "==========================="
	else
	Java
	cd /opt
	echo "Nexus Downloading"
			wget https://github.com/Yphanikumar5/nexus/archive/nexus.zip
			unzip nexus.zip
	fi
 }
Jfrog()
 {
	if [ -e /opt/jfrog-jfrog ]
	then 
	echo
	echo "==========================="
	echo " jfrog is already installed "
	echo "==========================="
	else
	Java
	cd /opt
	echo "JFrog Downloading"
			wget https://github.com/Yphanikumar5/jfrog/archive/jfrog.zip
			unzip jfrog.zip
	fi
 }
Jenkins()
	{
		service jenkins status
		if [ $? = 0 ]
		then
		echo
		echo "============================="
		echo " Jenkins is already installed "
		echo "============================="
		else
		echo " installing the jenkins "
		Java
		wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
		rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
		yum install jenkins -y
		systemctl start jenkins
		systemctl enable jenkins
		firewall-cmd --zone=public --add-port=8080/tcp --permanent
		firewall-cmd --zone=public --add-service=http --permanent
		firewall-cmd --reload
		fi
	}
Docker()
	{
		service docker status
		if [ $? = 0 ]
		then 
		echo
		echo "============================"
		echo " Docker is already installed "
		echo "============================"
		else
		echo 'Docker Installation started.)'
        echo '-----------------------------'
            cd / 

            sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

			sudo yum install -y ftp://bo.mirror.garr.it/1/slc/centos/7.1.1503/extras/x86_64/Packages/container-selinux-2.9-4.el7.noarch.rpm
			sudo yum install -y yum-utils \
			device-mapper-persistent-data \
			lvm2
			sudo yum-config-manager \
			--add-repo \
			https://download.docker.com/linux/centos/docker-ce.repo
			sudo yum-config-manager --enable docker-ce-edge
			sudo yum-config-manager --enable docker-ce-test
			sudo yum install -y docker-ce
			docker --version

			sudo systemctl status docker
			sudo systemctl start docker

			echo 'Docker Installation done successfully.)'
			echo '---------------------------------------'
			echo
			echo "===================="
			echo "DOCKER-VERSION"
			echo "===================="
			docker --version
			fi
	}
Ansible()
	{
		ansible --version
		if [ $? = 0 ]
		then
		echo
		echo "============================="
		echo " Ansible is already installed "
		echo "============================="
		else
		echo 'Ansible Installation started.)'
		echo '------------------------------'
			cd /

			rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

			yum install ansible -y

			ansible --version

		echo 'Ansible Installation done successfully.)'
		echo '----------------------------------------'
        echo
		echo "===================="
		echo "ANSIBLE-VERSION"
		echo "===================="
		ansible --version
		fi
		
	}
Git()
	{
		git --version
		if [ $? = 0 ]
		then
		echo
		echo "========================="
		echo " Git is already installed "
		echo "========================="
		else
		 echo 'Git Installation started.)'
		echo '-------------------------'

		cd /opt
		yum groupinstall "Development Tools" -y
		yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel curl-devel -y
		yum install wget -y
		wget https://github.com/git/git/archive/v2.18.0.tar.gz -O git-bash.tar.gz
		tar -zxf git-bash.tar.gz
		cd git-2.18.0
		make configure
		./configure --prefix=/usr/local
		make install
		git --version
		git config --global user.name "yphanikumar"
		git config --global user.email "yphanikumar111@gmail.com"
		git config --list	    
		echo
		echo "===================="
		echo "GIT-VERSION"
		echo "===================="
		git --version

        echo 'Git Installation done successfully.)'
        echo '-----------------------------------'
		fi
	}
	Gradle()
		{
			gradle -v
			if [ $? = 0 ]
		then
		echo
		echo "========================="
		echo " Git is already installed "
		echo "========================="
		else
		 echo 'Git Installation started.)'
		echo '-------------------------'
		Java
		cd /opt
			echo "Gradle is Downloading"
			wget https://services.gradle.org/distributions/gradle-4.10.2-all.zip
			unzip gradle-4.10.2-all.zip
			echo "export GRADLE_HOME=/opt/gradle-4.10.2" >> /etc/profile
	    	text='export PATH=$PATH:$GRADLE_HOME/bin'
            echo "$text" >> /etc/profile
            source /etc/profile
            echo
            echo "===================="
			echo "GRADLE-VERSION"
			echo "===================="
			gradle -v
			fi	
		}
		
	Java
	Ant
	Maven
	Gradle
	Tomcat
	Wildfly
	Sonarqube
	Nexus
	Jfrog
	Jenkins
	Docker
	Ansible
	Git
		
