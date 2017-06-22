FROM centos/httpd:latest
MAINTAINER Daileyo <dale13@gmail.com>

#  Update yum and other resources
RUN yum -y update
RUN yum -y install vim
RUN yum clean all

#  Add flask and python
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python35u python35u-pip
RUN pip3.5 install flask

#  aAvailable directories
WORKDIR /var/www/html

#  Make appropriate ports available
EXPOSE 80
EXPOSE 443
# test service ports
EXPOSE 8080
EXPOSE 8081

#  Add appropriate scripts and run
ADD start-httpd.sh /start-httpd.sh
ADD backend1.py /backend1.py
ADD backend2.py /backend2.py
RUN chmod -v +x /start-httpd.sh
CMD ["/run-httpd.sh"]