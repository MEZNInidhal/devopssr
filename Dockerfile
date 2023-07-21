FROM openjdk:8

RUN curl -u admin:nexus -o /ExamThourayaS2.jar "http://192.168.56.20:8081/#browse/browse:maven-releases:ExamThourayaS2.jar"

EXPOSE 8089

CMD ["java", "-jar", "/achat.jar"]
