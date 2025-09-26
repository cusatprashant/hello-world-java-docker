FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5

# Metadata
LABEL org.opencontainers.image.authors="cusatprashant18@gmail.com" \
      base.image="registry.access.redhat.com/ubi8/ubi-minimal:8.5" \
      java.version="11"

# Install OpenJDK 11 (headless)
RUN microdnf install --nodocs java-11-openjdk-headless && microdnf clean all

# Create working directory
RUN mkdir -p /work

# Set working directory
WORKDIR /work

# Copy application JAR
# Use build argument to specify JAR name
ARG JAR_FILE=target/hello-world-java-docker-1.0.0.jar
COPY ${JAR_FILE} application.jar

# Expose application port
# The application listens on port 8080. Please use this port to access the service.
EXPOSE 8080

# Healthcheck to ensure the app is running
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Run the application
CMD ["java", "-jar", "application.jar"]