#!/bin/bash

# Define MySQL root password
MYSQL_ROOT_PASSWORD=" " # Your password

# Update system packages
echo "Updating system packages..."
sudo apt-get update -y

# Install Apache2
echo "Installing Apache2..."
sudo apt-get install apache2 -y

# Install PHP and required modules
echo "Installing PHP and required modules..."
sudo apt-get install php php-{cgi,common,mbstring,net-socket,gd,xml-util,mysql,bcmath,imap,snmp,ldap} -y

# Install MySQL server
echo "Installing MySQL server..."
sudo apt-get install mysql-server -y

# Enable and check MySQL service
echo "Enabling and starting MySQL service..."
sudo systemctl enable mysql
sudo service mysql start

# Secure MySQL installation
echo "Securing MySQL installation..."
sudo mysql_secure_installation <<EOF

y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
EOF

# Set MySQL root password with native authentication
echo "Configuring MySQL root user..."
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EXIT;
EOF

echo "Installation and configuration complete."
