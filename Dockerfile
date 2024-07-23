FROM openjdk:17-slim
ARG APP_NAME=hello-world

ARG SRC_DIR=/opt/hello-world
ARG BUILD_DIR=build/libs
ARG JAR_FILE=hello-world.jar

# memory
ENV JAVA_TOOL_OPTIONS "${JAVA_TOOL_OPTIONS} -XX:InitialRAMPercentage=75.0 -XX:MaxRAMPercentage=75.0"
# gc
ENV JAVA_TOOL_OPTIONS "${JAVA_TOOL_OPTIONS} -XX:+UseG1GC"
# encoding
ENV JAVA_TOOL_OPTIONS "${JAVA_TOOL_OPTIONS} -Dfile.encoding=UTF-8 -Dfile.client.encoding=UTF-8 -Dclient.encoding.override=UTF-8"

COPY ${BUILD_DIR}/${JAR_FILE} ${SRC_DIR}/${JAR_FILE}

WORKDIR ${SRC_DIR}
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "hello-world.jar"]