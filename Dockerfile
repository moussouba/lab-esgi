
FROM amazoncorretto:17-alpine

# Définir un répertoire de travail
WORKDIR /app

# Copier le fichier JAR du backend
COPY target/paymybuddy.jar /app

# Exposer le port 8080
EXPOSE 8080

# Exécuter le service backend
CMD ["java", "-jar", "paymybuddy.jar"]