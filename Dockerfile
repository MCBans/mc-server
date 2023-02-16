FROM openjdk:17-slim

ENV test=s

RUN apt update -y && apt install -y git curl

RUN curl https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -o BuildTools.jar

RUN java -jar /BuildTools.jar -o /srv/

WORKDIR /running

CMD java -Xmx1G -jar /srv/*.jar
