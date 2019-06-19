#Install Java
sudo apt-get update
sudo apt-get install default-jdk -y
echo "JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"" >> /etc/environment
sudo source /etc/environment
echo $JAVA_HOME

#Install maven
sudo apt-get update -y
sudo apt-get upgrade -y
cd /usr/share
sudo wget https://www-eu.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
sudo tar -xvzf apache-maven-3.6.1-bin.tar.gz
sudo mv apache-maven-3.6.1 maven
sudo rm apache-maven-3.6.1-bin.tar.gz
echo /etc/profile.d/mavenenv.sh > export M2_HOME=/usr/share/maven export PATH=${M2_HOME}/bin:${PATH}
sudo chmod 777 /etc/profile.d/mavenenv.sh
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
