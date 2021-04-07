
##########################################################################
#### Script to confgure WP Project for Starter Pack
##########################################################################

#### Instructions


### Run the script in the terminal window by typing

###        bash wpconfig.sh 

#### End of Instructions
##########################################################################


echo
echo "     START OF AUTOMATED CONFIGURATION"
echo

# set the hostname variable
CODIO_HOST=`cat /etc/hostname`  
WORKSPACE="$HOME/workspace" 

echo -e '\E[1;33;44m' "Creating the MySQL database that WP will use"; tput sgr0
# This script uses the default password 'password' - IT IS NOT SECURE!
echo "CREATE DATABASE wordpress;" > msqlcmds.txt
echo "USE wordpress;" >> msqlcmds.txt
echo "CREATE USER wordpressuser@localhost;" >> msqlcmds.txt
# note escaped quotes on line below
echo "SET PASSWORD FOR wordpressuser@localhost= PASSWORD(\"password\");" >> msqlcmds.txt
########################                  wordpressuser    ########
 
echo "GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'password';" >> msqlcmds.txt
########################                                         wordpressuser      ########
echo "FLUSH PRIVILEGES;" >> msqlcmds.txt
echo "exit" >> msqlcmds.txt
 
echo -e '\E[1;33;44m' "The password for the MySQL server is 'codio'"; tput sgr0
echo -e '\E[1;33;44m' "You should change it after instalation."; tput sgr0
echo - 
echo -e '\E[1;33;44m' "For now - Just to type the password 'codio' and press enter"; tput sgr0
mysql -u root -p < msqlcmds.txt -v

echo -e '\E[1;33;44m' "Creating a wp-config file from the sample - Done"; tput sgr0
cp ./wordpress/wp-config-sample.php  ./wordpress/wp-config.php

echo -e '\E[1;33;44m' "Editing the wp-config file with username and password - Done"; tput sgr0
sed -i "s/define( 'DB_NAME', 'database_name_here' );/define('DB_NAME', 'wordpress');/g" $WORKSPACE/wordpress/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define('DB_USER', 'wordpressuser');/g" $WORKSPACE/wordpress/wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define('DB_PASSWORD', 'password');/g" $WORKSPACE/wordpress/wp-config.php
###########################                             wordpressuser    ########   


echo -e '\E[1;33;44m' "Set up WP for codio domain names - Done"; tput sgr0  
sed -i "36i define('WP_HOME','https://WORD1-WORD2-3000.codio.io/wordpress');" $WORKSPACE/wordpress/wp-config.php
sed -i "37i define('WP_SITEURL','https://WORD1-WORD2-3000.codio.io/wordpress');" $WORKSPACE/wordpress/wp-config.php
sed -i s_WORD1-WORD2_"$CODIO_HOST"_g  $WORKSPACE/wordpress/wp-config.php


rm wpconfig.sh
rm msqlcmds.txt
