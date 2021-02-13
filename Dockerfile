# Arch will be changed while building from GitHub Actions CI Workflow
# anapsix/alpine-java:8_jdk
# armv7/armhf-java8
# arm64v8/openjdk
ARG CI_FROM=null
FROM ${CI_FROM}
RUN echo "Set FROM to $CI_FROM"

# Output target platform
ARG TARGETPLATFORM
RUN echo "Building for ARCH $TARGETPLATFORM"

# Download Jar File
WORKDIR /data
RUN curl -O https://blueforcer.de/awtrix/stable/awtrix.jar

EXPOSE 7000 7001

# Set command
CMD ["java", "awtrix.jar"]