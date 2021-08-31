FROM openjdk:8u212-jre-slim-stretch
MAINTAINER Fuuqiu (Fuuqiu@163.com)

COPY ./target/generator-web-3.0.jar /app/generator-code.jar

WORKDIR /app
VOLUME ["/app/logs"]


CMD ["--server.port=1234"]

EXPOSE 1234

ENV JAVA_OPTS="-XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=128m -Xms256m -Xmx512m -Xmn256m -Xss256k -XX:SurvivorRatio=8 -XX:+UseConcMarkSweepGC"
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS  -jar generator-code.jar"]




