#Install Java
sudo apt-get update
sudo apt install openjdk-8-jdk -y
echo "JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"" >> /etc/environment
sudo source /etc/environment
echo $JAVA_HOME

#Install maven
sudo apt-get update -y
sudo apt-get upgrade -y
cd /opt/
sudo wget https://www-eu.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
sudo tar -xvzf apache-maven-3.6.1-bin.tar.gz
sudo mv apache-maven-3.6.1 maven
sudo rm apache-maven-3.6.1-bin.tar.gz
sudo vim /etc/profile.d/mavenenv.sh > export M2_HOME=/opt/maven export PATH=${M2_HOME}/bin:${PATH}
sudo chmod +x /etc/profile.d/mavenenv.sh
source /etc/profile.d/mavenenv.sh
mvn --version


#Install jenkins
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
