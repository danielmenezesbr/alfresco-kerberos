# Load Tomcat Native Library
LD_LIBRARY_PATH=/home/vagrant/common/lib:$LD_LIBRARY_PATH

#JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
JAVA_HOME=/home/vagrant/alfresco/java
JRE_HOME=$JAVA_HOME
JAVA_OPTS="-XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -Djava.awt.headless=true -Dalfresco.home=/home/vagrant/alfresco -XX:ReservedCodeCacheSize=128m $JAVA_OPTS "
JAVA_OPTS="-Xms512M -Xmx2048M -Dsun.security.krb5.debug=true -Djava.security.auth.login.config=/home/vagrant/alfresco/java.login.config -Dsun.security.jgss.debug=true $JAVA_OPTS " # java-memory-settings
export JAVA_HOME
export JRE_HOME
export JAVA_OPTS
export LD_LIBRARY_PATH
                
