FROM centos/httpd:latest
LABEL maintainer="Daileyo <dale13@gmail.com>"

#  Update yum and other resources
#RUN yum -y update
#RUN yum -y install vim
#RUN yum -y install httpd
#RUN yum clean all

# where to work from (i use it to default where docker exec starts)
WORKDIR /etc/httpd/conf.d

# pre-emptive volume for data to come from host volume
# intention is for *.conf files for apache.config to be put here
VOLUME /from-host

#  Make appropriate ports available
EXPOSE 80
EXPOSE 443

#  Add appropriate scripts and run
ADD start-httpd.sh /start-httpd.sh
RUN chmod -v +x /start-httpd.sh
CMD ["/start-httpd.sh"]