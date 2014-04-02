FROM dockerfile/java
MAINTAINER mkroli
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

RUN wget http://apache.openmirror.de/servicemix/servicemix-5/5.0.0/apache-servicemix-5.0.0.zip
RUN unzip -d /opt apache-servicemix-5.0.0.zip
RUN rm apache-servicemix-5.0.0.zip
RUN ln -s /opt/apache-servicemix-5.0.0 /opt/servicemix
RUN mkdir /deploy
RUN rm -rf /opt/servicemix/deploy

VOLUME ["/deploy"]
EXPOSE 1099 8101 8181 61616 36888 44444
ENTRYPOINT ["/opt/servicemix/bin/servicemix", "console"]
