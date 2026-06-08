# Use the official Eclipse Temurin image for Java 17
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the shaded jar file from the target folder into the container
COPY target/gs-maven-0.1.0.jar app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
