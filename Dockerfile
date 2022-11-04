FROM tomcat:latest

LABEL maintainer="Nidhi Gupta"

ADD .//var/lib/jenkins/workspace/CI-CD-using-Docker/webapp/target/webapp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
