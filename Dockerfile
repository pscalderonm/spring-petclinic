FROM chirsmerchan/alpine-java
LABEL maintainer="cmerchan@ups.edu.ec"
WORKDIR /home
COPY /target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jat ./spring-petclinic-2.3.0.jar
ENTRYPOINT ["java", "-jar", "spring-petclinic-2.3.0.jar"]
