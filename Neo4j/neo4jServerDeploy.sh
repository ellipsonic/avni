# Update system files
sudo apt-get update
sudo apt-get install -y sudo

# Stop apache2
sudo service apache2 stop

# Install dependencies
sudo apt-get install -y git
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y curl

# Git all files
git clone https://github.com/ellipsonic/neo4j.git
cd neo4j
pubilc_ip=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
sudo sed -i ''s/org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=$pubilc_ip/g'' conf/neo4j-server.properties
bin/neo4j start
clear
echo "Check your browser, username neo4j and password is admin"
