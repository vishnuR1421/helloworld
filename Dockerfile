FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade && \
apt-get -y install openjdk-8-jdk wget && \
mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.44/bin/apache-tomcat-9.0.44.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz && cp -Rv /tmp/apache-tomcat-9.0.44/* /usr/local/tomcat/
COPY ./SKRLogin-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

# build the image:  docker build -t skr:1 .
# run the image : docker run --name skr -p -d 8080:8080 skr:1
# access it by : <ip>:8080
