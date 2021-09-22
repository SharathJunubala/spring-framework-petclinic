FROM maven:3.6.3-jdk-8 as BUILD

COPY . /usr/src/
#COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/pom.xml clean package

FROM tomcat
COPY --from=BUILD /usr/src/target/petclinic.war /usr/local/tomcat/webapps
RUN cd /usr/local/tomcat/bin
ENTRYPOINT [ "./startup.sh" ]