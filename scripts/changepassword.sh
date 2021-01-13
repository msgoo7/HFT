#!/usr/bin/env bash
echo "Enter the UserName to be updated/inserted : "
read username

echo "Enter the new Password of above user : "
read password

echo "Enter DB User:"
read DBUSER

echo "Enter DB Name:"
read DBNAME

echo "Enter HOST or IP:"
read HOST

echo "Enter DB PORT"
read PORT

SALT="da39a3ee5e6b4b0d3255bfef95601890afd80709"

HASHSTD=`echo -n "$SALT$password" | openssl sha1`

HASH=`echo "$HASHSTD" | awk -F' ' '{print $2}'`

psql -U $DBUSER $DBNAME -h $HOST -p $PORT -c "update appmaster.user_password set password = '$HASH' , salt = '$SALT' , effective_timestamp = now() , passwords_already_attempted = 0, user_password_state = 'A' where id = '$username'" ;
