# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the shaded jar file from the target folder into the container
COPY target/gs-maven-0.1.0.jar app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
