FROM dockerfile/java
MAINTAINER mkroli
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

RUN wget http://apache.openmirror.de/servicemix/servicemix-5/5.0.0/apache-servicemix-5.0.0.zip; \
    unzip -d /opt apache-servicemix-5.0.0.zip; \
    rm apache-servicemix-5.0.0.zip; \
    ln -s /opt/apache-servicemix-5.0.0 /opt/servicemix; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/servicemix/etc/org.apache.felix.fileinstall-deploy.cfg

VOLUME ["/deploy"]
EXPOSE 1099 8101 8181 61616 36888 44444
ENTRYPOINT ["/opt/servicemix/bin/servicemix"]
