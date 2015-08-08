# Update
sudo apt-get -y update

# Install git and curl
sudo apt-get -y install curl
sudo apt-get -y install git 

# Clone the repo
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
sudo scripts/install-sdk.sh

# Map the private IP to public IP
private_ip=$(hostname -i)
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to-destination $private_ip:80
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo node server.js -p 8080 -a : <&- &
