FROM curlimages/curl:latest AS builder

# Download Jar File
WORKDIR /data
RUN curl -O https://blueforcer.de/awtrix/stable/awtrix.jar

FROM adoptopenjdk/openjdk8:debianslim-jre

WORKDIR /data
# Output target platform
ARG TARGETPLATFORM
RUN echo "Building for ARCH $TARGETPLATFORM"

COPY --from=builder /data/awtrix.jar awtrix.jar

# Set runtime
EXPOSE 7000 7001
CMD ["java", "-jar", "awtrix.jar"]
