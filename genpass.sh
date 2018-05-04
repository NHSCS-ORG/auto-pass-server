# This script automatically generates passwords.
# It then saves them to a file that is readable by curl, to allow a varable to be set.
# It also saves them to a file in the event that an older password needs to be recovered.

# First we will generate the password and save it to a varable.
passwdvar=$(dd if=/dev/urandom bs=1 count=20 2>/dev/null | base64 -w 0 | rev | cut -b 10- | rev)
# Then we'll remove the existing password and add our new one.
echo $passwdvar > /var/www/html/dailpass.txt
# Finally save the password and the current date to a file in the event we need to recover it for some reason.
passdatevar=$(echo "$(date | cut -c -10) | $passwdvar")
echo $passdatevar >> /etc/nhscs/apps/dailypass/passlog.txt
