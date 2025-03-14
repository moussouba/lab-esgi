# ESGI Project

## Kubernetes - Part 1
### SRC Class

---

## Context

The company **SUN Data Consulting** is an IT services company specializing in Cloud and DevSecOps.

One of its clients is looking for a consultant with practical skills in DevOps and integration of various tools. You have been recruited to meet this need. The company presents you with an internally developed application. However, the developers are not familiar with microservices concepts and cannot provide pre-built images for direct deployment in a test environment or a POC.

Nevertheless, all the necessary information will be provided to you to allow the construction of the images and the setup of a POC.

---

## Application Overview

**PayMyBuddy** is an application that manages financial transactions between friends.

The current infrastructure is monolithic, manually deployed, which leads to inefficiencies. The goal is to improve scalability and simplify the deployment process by using **Docker** and container orchestration with **Kubernetes**.
**![PayMyBuddy Overview](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf0fGeMjotdY0KzJL13cmGhXad3GM_kn7OSXZJ4CCSQ89zZTlrhBVVi91QjRMgVeszmUMAMAgyavzr4VyQ9YOAUiWmL2sF6aVQYiJPLZfztxv7ERNsIra2O_2SYIX5ZFY5eOARMeI2qnOwrIymuyJnvtuYs?key=mLqAl_ccMoG4hHcRzSYKpw)**

---

## Objectives

Your mission consists of:

- Building the Docker image of the application.
- Deploying the application in a **Kubernetes** cluster.
- Improving deployment processes.
- Managing infrastructure versions.
- Implementing best practices with **Docker**.
- Using **Infrastructure as Code (IaC)**.
- Managing secrets and configurations.
- Versioning Kubernetes manifests.
- Ensuring data persistence.
- Using fundamental **Kubernetes** concepts.

---

## Infrastructure

The infrastructure will run on an **Ubuntu 20.04** server compatible with **Docker**. The POC will include containerization of the **Spring Boot backend** and the **MySQL database**, as well as deployment automation via **Docker Compose** and **Kubernetes**.

### Components:

- **Backend (Spring Boot)**: Manages users and transactions.
- **Database (MySQL)**: Stores users, transactions, and account information.
- **Docker Orchestration**: Managed via `docker-compose.yml`.
- **Kubernetes Orchestration**: Deployment with Kubernetes manifests.

---

## Application

The **PayMyBuddy** application is divided into two main services:

### 1. Backend Service (Spring Boot):
- Exposes an API to manage transactions and user interactions.
- Connects to a **MySQL** database for persistent storage.

### 2. Database Service (MySQL):
- Stores user and transaction data.
- Exposed on **port 3306** for connection with the backend.

---

## Build and Tests (5 Points)

You will need to **build and deploy** the backend and MySQL database in Docker containers.

### Database Initialization

The database schema is initialized using the **`initdb`** directory, containing SQL scripts to create tables and load initial data. These scripts are executed automatically when the MySQL container starts.

### Backend Dockerfile:

- **Base image**: `amazoncorretto:17-alpine`
- **Copy the JAR file** of the backend and expose port **8080**
- **CMD**: Execution of the backend service

### Database Configuration:

- Use of **MySQL** as a Docker service with data mounted in a persistent volume.
- Exposed on **port 3306**.

---

## Orchestration with Docker Compose (5 Points)

The `docker-compose.yml` file will allow the deployment of both services:

- **paymybuddy-backend**: Runs the Spring Boot application.
Example environment variables for the backend:
```bash
    ENV SPRING_DATASOURCE_USERNAME=root
    ENV SPRING_DATASOURCE_PASSWORD=password
    ENV SPRING_DATASOURCE_URL=jdbc:mysql://172.17.0.1:3306/db_paymybuddy
```
paymybuddy-db: MySQL database.

---

## Main Features:
- Management of dependencies between services.

- Use of volumes for persistent storage.

- Secure configuration via environment variables.

---

## Docker Registry
You will need to push your images to a Docker registry and use them in docker-compose.yml.

Steps:
- Build the backend and MySQL images.

- Connect to a Docker registry.

- Push the images to the registry and reference them in docker-compose.yml.

---

## Kubernetes Orchestration (8 Points)
Based on the Docker Compose configuration, you must adapt the deployment of the PayMyBuddy application on a Kubernetes cluster.

Steps:
- Create Kubernetes objects for each component.

- Use ConfigMaps and Secrets for variable management.

- Ensure data persistence for the MySQL database.

- Externalize the application configuration.

💡 Note: This part involves the creation of Kubernetes manifests (Deployment, Service, ConfigMap, Secret, PersistentVolumeClaim...).

---

## Delivery (2 Points)
For delivery, provide the following in your Git repository:

- A README with screenshots and explanations.

- The Dockerfile, docker-compose.yml, and Kubernetes manifest files.

- Screenshots of the running application.

Evaluation Criteria:
✔️ Quality of explanations and screenshots.

✔️ Clarity and structure of the repository.

✔️ Best practices applied.

🚀 Good luck!