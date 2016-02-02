FROM registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat8-openshift
ADD . /tmp/src
RUN mkdir -p ${HOME}/source && \
    cp -ad /tmp/src/* ${HOME}/source && \
    pushd ${HOME}/source &> /dev/null && \
    if [ -d ${HOME}/source/configuration ]; then cp -v ${HOME}/source/configuration/* $JWS_HOME/conf/; fi && \
    if [ -f "${HOME}/source/pom.xml" ]; then mvn -e -Popenshift -DskipTests -Dcom.redhat.xpaas.repo.redhatga package -Djava.net.preferIPv4Stack=true; fi &&  \
    if [ -d ${HOME}/source/target ]; then cp -v ${HOME}/source/target/*.war $JWS_HOME/webapps 2> /dev/null; fi && \
    if [ -d ${HOME}/source/deployments ]; then cp -v ${HOME}/source/deployments/*.war $JWS_HOME/webapps 2> /dev/null; fi &&  \
    rm -rf ${HOME}/.m2
    
ENTRYPOINT ["/opt/webserver/bin/launch.sh"]
