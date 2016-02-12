#!/bin/bash

# Make sure prerequisite environment variables are set
if [ -z "$JAVA_HOME" -a -z "$JRE_HOME" ]; then
  JAVA_PATH=`which java 2>/dev/null`
  
  if [ "x$JAVA_PATH" != "x" ]; then
    JAVA_PATH=`dirname $JAVA_PATH 2>/dev/null`
    JRE_HOME=`dirname $JAVA_PATH 2>/dev/null`
  fi
  
  if [ "x$JRE_HOME" = "x" ]; then
    # XXX: Should we try other locations?
    if [ -x /usr/bin/java ]; then
      JRE_HOME=/usr
    fi
  fi

  if [ -z "$JAVA_HOME" -a -z "$JRE_HOME" ]; then
    echo "Neither the JAVA_HOME nor the JRE_HOME environment variable is defined"
    echo "At least one of these environment variable is needed to run this program"
    exit 1
  fi
fi

if [ -z "$JRE_HOME" ]; then
  JRE_HOME="$JAVA_HOME"
fi

FAST_GUI_CLASSPATH=./conf

for i in `find ./lib -name "*.jar"`; do FAST_GUI_CLASSPATH=$FAST_GUI_CLASSPATH:$i ; done;
for i in `find ./apps/apache-tomcat-8.0.30/bin -name "*.jar"`; do FAST_GUI_CLASSPATH=$FAST_GUI_CLASSPATH:$i ; done;
for i in `find ./apps/apache-tomcat-8.0.30/lib -name "*.jar"`; do FAST_GUI_CLASSPATH=$FAST_GUI_CLASSPATH:$i ; done;

$JRE_HOME/bin/java -Dcatalina.home=./apps/apache-tomcat-8.0.30 -Dcatalina.base=./apps/apache-tomcat-8.0.30 -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.util.logging.config.file=./apps/apache-tomcat-8.0.30/conf/logging.properties -classpath $FAST_GUI_CLASSPATH org.fast4foos.gui.FastGUI
