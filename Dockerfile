FROM chirsmerchan/alpine-java
LABEL maintainer="pcalderonm@est.ups.edu.ec"
WORKDIR /home
COPY /target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jat ./spring-petclinic-2.3.0.jar
ENTRYPOINT ["java", "-jar", "spring-petclinic-2.3.0.jar"]
