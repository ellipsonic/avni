# Update
sudo apt-get -y update

# Install git and curl
sudo apt-get -y install curl
sudo apt-get -y install git 
sudo apt-get -y install mongodb

# Install meteor
sudo curl https://install.meteor.com/ | sh

# Set Locale
export LANG=C
export LC_ALL=C

# Clone the repo
git clone https://github.com/RocketChat/Rocket.Chat.git
cd Rocket.Chat

# Map the private IP to public IP
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to-destination $(hostname -i):3000
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo meteor <&- &
