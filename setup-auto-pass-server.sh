# This script sets up the system to run auto-pass-server

# Check if we are root
if [[ $EUID -ne 0 ]]; then
   echo "You must run setup as root."
   exit 1
fi

# Make our folders
mkdir /etc/nhscs
mkdir /etc/nhscs/auto-pass-server

# Pull files
curl -k https://raw.githubusercontent.com/NHSCS-ORG/auto-pass-server/master/genpass.sh -o /etc/nhscs/auto-pass-server/genpass.sh
curl -k <curl url> -o /etc/cron.d/auto-pass-server
curl -k <curl url> -o /var/www/htmlnew/index.html

# Setup the system
apt update
apt install nginx -y
rm -rf /var/www/html
mv /var/www/htmlnew /var/www/html
systemctl restart nginx
touch
