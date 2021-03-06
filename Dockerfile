FROM centos:latest AS revprox
LABEL maintainer="Daileyo <dale13@gmail.com>"
#  Stage 1
#  Update yum and other resources
RUN yum -y update
RUN yum -y install vim
RUN yum -y install httpd
RUN yum -y install mod_ssl
RUN yum clean all
#############################################################################################################
FROM revprox
#  Stage 2
# where to work from. Helpful for docker exec use
WORKDIR /etc/httpd/conf.d
COPY ./custom-errors/* /var/www/html/errors/
COPY ./config/dev-*.conf /etc/httpd/conf.d/ 
COPY ./config/ssl.conf /etc/httpd/conf.d/
COPY ./index.html /var/www/html/
EXPOSE 80
EXPOSE 443
ADD start-httpd.sh /start-httpd.sh
RUN chmod -v +x /start-httpd.sh
CMD ["/start-httpd.sh"]