#  https://stackoverflow.com/a/33474729

# create random password
#PASSWDDB="$(DATABASE_PASS)"

# replace "-" with "_" for database username
MAINDB=${DATABASE_NAME}

# If /root/.my.cnf exists then it won't ask for root password
if [ -f /root/.my.cnf ]; then

    mysql -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8mb4 */;"
    mysql -e "CREATE USER ${DATABASE_USER}@localhost IDENTIFIED BY '${DATABASE_PASS}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"

# If /root/.my.cnf doesn't exist then it'll ask for root password   
else
    echo "Please enter root user MySQL password!"
    echo "Note: password will be hidden when typing"
   # read -sp rootpasswd
    mysql -uroot -p${DATABASE_PASS} -e "CREATE DATABASE ${DATABASE_NAME} /*\!40100 DEFAULT CHARACTER SET utf8mb4 */;"
    mysql -uroot -p${DATABASE_PASS} -e "CREATE USER ${DATABASE_USER}@localhost IDENTIFIED BY '${DATABASE_PASS}';"
    mysql -uroot -p${DATABASE_PASS} -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'localhost';"
    mysql -uroot -p${DATABASE_PASS} -e "FLUSH PRIVILEGES;"
fi