# Update core
sudo apt-get update

# Install dependencies
sudo apt-get install python-pip python-dev build-essential 

# Install Wagtail
pip install wagtail

# Start your site
wagtail start mysite

# Set up the database
cd mysite
python manage.py migrate

# Manual  intervention needed, answer to questions and create user ubuntu, password admin, email can be left blank
python manage.py createsuperuser

# Run the site in the background "done by adding & symbol at the end of the statement" 
sudo python manage.py runserver 0.0.0.0:80 &
