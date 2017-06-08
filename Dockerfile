FROM centos/httpd:latest
MAINTAINER Daileyo <dale13@gmail.com>

#  Update yum and other resources
RUN yum -y update
RUN yum -y install vim
RUN yum clean all

#  aAvailable directories
WORKDIR /var/www/html

#  Make appropriate ports available
EXPOSE 80
EXPOSE 443

#  Add appropriate scripts and run
ADD start-httpd.sh /start-httpd.sh
RUN chmod -v +x /start-httpd.sh
CMD ["/run-httpd.sh"]