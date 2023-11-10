FROM eclipse-temurin:17

WORKDIR  /app

COPY employee-management-api/target/employee-management-api-0.0.1-SNAPSHOT.jar /app/emi.jar

EXPOSE 8082

CMD ["java", "-jar", "emi.jar"]