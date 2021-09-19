FROM maven:2.22.1-jdk-8 as BUILD

COPY . /usr/src/
#COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/pom.xml clean package

FROM tomcat
COPY --from=BUILD /usr/src/target/petclinic.war /usr/local/tomcat/webapps