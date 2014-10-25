FROM java:openjdk-7
MAINTAINER mkroli
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN wget http://apache.openmirror.de/servicemix/servicemix-5/5.0.5/apache-servicemix-5.0.5.zip; \
    unzip -d /opt apache-servicemix-5.0.5.zip; \
    rm -f apache-servicemix-5.0.5.zip; \
    ln -s /opt/apache-servicemix-5.0.5 /opt/servicemix; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/servicemix/etc/org.apache.felix.fileinstall-deploy.cfg

VOLUME ["/deploy"]
EXPOSE 1099 8101 8181 61616 44444
ENTRYPOINT ["/opt/servicemix/bin/servicemix"]
