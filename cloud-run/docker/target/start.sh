#!/bin/sh

java -Xms512m -Xmx512m -javaagent:/dd-java-agent.jar -Duser.timezone=UTC -jar app.jar