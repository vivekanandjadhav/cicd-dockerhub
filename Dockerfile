FROM tomcat:latest

LABEL maintainer="Rutuja Pawal"

ADD ./target/webapp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
