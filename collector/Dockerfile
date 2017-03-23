FROM frolvlad/alpine-oraclejdk8:slim

ENV SCALA_VERSION=2.12.1
ENV SCALA_HOME=/usr/share/scala

ENV SBT_VERSION 0.13.13
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN apk update && apk add ca-certificates wget && update-ca-certificates
RUN apk add --no-cache bash jq curl
RUN apk update
RUN apk add ca-certificates
RUN update-ca-certificates

WORKDIR /tmp

RUN wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz"
RUN tar xzf "scala-${SCALA_VERSION}.tgz"
RUN mkdir "${SCALA_HOME}"
RUN rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat
RUN mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}"
RUN ln -s "${SCALA_HOME}/bin/"* "/usr/bin/"

RUN wget -q -O - "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x
RUN cp -a sbt-launcher-packaging-$SBT_VERSION/* /usr/local && rm -rf sbt-launcher-packaging-$SBT_VERSION

WORKDIR /

ADD get-artifact.sh get-artifact.sh
RUN sh get-artifact.sh

EXPOSE 80

CMD ["java", "-jar", "/collector.jar"]