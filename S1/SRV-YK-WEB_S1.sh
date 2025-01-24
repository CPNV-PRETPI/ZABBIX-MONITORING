#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt-get update -y

# Install Nginx
echo "Installing Nginx..."
sudo apt-get install nginx -y

# Ensure Nginx starts on boot
echo "Enabling Nginx to start on boot..."
sudo systemctl enable nginx
