#!/bin/bash
#execute all script in specified directory
MYDATE=`date +%F'-'%T'-'%w`
MYSQL_PATH=/opt/sql/common #指定的目录
#mysql -h127.0.0.1 -uroot -proot#LC < /opt/sql/init.sql
for file in ${MYSQL_PATH}/*
do
if [ -f "$file" ] ; then
postfix=`echo $file | awk -F'.' '{print  "."$NF}'`
  if [ $postfix = ".sql" ] ; then
        mysql -h${MYSQL_HOST} -P${MYSQL_PORT} -uroot -p${MY_PWD}  -D${DB_NAME} < $file 
  fi
fi
done
