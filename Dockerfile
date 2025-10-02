# Use official Java image as base
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven build file
COPY pom.xml .

# Copy project source
COPY src ./src

# Package the application (skip tests for faster build)
RUN ./mvnw -B -DskipTests clean package

# Copy the built jar from target folder
COPY target/*.jar app.jar

# Expose the port (Render will map dynamically)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","/app/app.jar"]
