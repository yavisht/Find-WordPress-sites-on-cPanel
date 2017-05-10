#!/bin/sh
#
#
echo
echo '--------Creating required files--------'

touch paths.txt
touch results.txt
touch usernames.txt

#spinstr='|/-\'

echo
echo '--------Detecting WordPress websites on your server.. Please be patient--------'

find /home/*/public_html -type f -name wp-config.php > paths.txt

# TODO: ADD Spinner while find is being performed
#pid=`ps ax | grep find | awk '{print $1}'`
#proc=$pid
#echo $proc
# while [kill -0 $proc > /dev/null 2>&1] do
#     printf "\r Looking for WordPress installations on your server... Please wait [%c] \b\b\b\b\b\b" "$spinstr"
#     spinstr=${spinstr#?}${spinstr%%???}
#     sleep 0.1
# done

grep '/home' paths.txt | awk '{split($0,a,"/"); print a[3]}' > usernames.txt
cat /etc/domainusers | grep -f usernames.txt > results.txt
echo
echo '--------WordPress Sites on your server--------'

echo
cat results.txt
echo

echo '-----------------------------------------------'
echo
