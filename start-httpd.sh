#!/bin/bash
rm -rf /run/httpd/* /tmp/httpd*
#copy conf files to apache before start... force it if needed.
#/bin/cp -af /from-host/. /etc/httpd/conf.d/
#/bin/mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.bk
exec /usr/sbin/httpd -D FOREGROUND