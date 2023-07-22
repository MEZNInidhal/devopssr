FROM openjdk:8

RUN curl -u admin:nexus -o /ExamThourayaS2.jar "http://192.168.56.20:8081/#browse/browse:maven-releases:tn%Fesprit%FExamThourayaS2%FExamThourayaS2-0.0.1-SNAPSHOT.jar"

EXPOSE 8089

CMD ["java", "-jar", "/achat.jar"]
