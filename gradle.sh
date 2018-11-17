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
    Gradle
