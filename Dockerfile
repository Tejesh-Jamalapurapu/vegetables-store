FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY target/vegetables-store.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
