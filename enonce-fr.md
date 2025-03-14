# Projet ESGI

## Kubernetes - Partie 1
### Class SRC

---

## Contexte

L'entreprise **SUN Data Consulting** est une société de prestation de services informatiques spécialisée dans le Cloud et le DevSecOps. 

Un de ses clients recherche un consultant ayant des compétences pratiques en DevOps et en intégration d'outils divers. Vous avez été recruté pour répondre à ce besoin. L'entreprise vous présente une application développée en interne. Cependant, les développeurs ne maîtrisent pas les concepts de microservices et ne peuvent pas fournir d’images préconstruites pour un déploiement direct dans un environnement de test ou un POC.

Néanmoins, toutes les informations nécessaires vous seront fournies afin de permettre la construction des images et la mise en place d’un POC.

---

## Présentation de l'application

**PayMyBuddy** est une application permettant de gérer des transactions financières entre amis. 

L’infrastructure actuelle est monolithique, déployée manuellement, ce qui entraîne des inefficacités. L’objectif est d’améliorer l’évolutivité et de simplifier le processus de déploiement en utilisant **Docker** et l’orchestration de conteneurs avec **Kubernetes**.
**![PayMyBuddy Overview](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf0fGeMjotdY0KzJL13cmGhXad3GM_kn7OSXZJ4CCSQ89zZTlrhBVVi91QjRMgVeszmUMAMAgyavzr4VyQ9YOAUiWmL2sF6aVQYiJPLZfztxv7ERNsIra2O_2SYIX5ZFY5eOARMeI2qnOwrIymuyJnvtuYs?key=mLqAl_ccMoG4hHcRzSYKpw)**

---

## Objectifs

Votre mission consiste à :

- Construire l’image Docker de l’application.
- Déployer l’application dans un cluster **Kubernetes**.
- Améliorer les processus de déploiement.
- Gérer les versions des infrastructures.
- Implémenter les bonnes pratiques avec **Docker**.
- Utiliser **Infrastructure as Code (IaC)**.
- Gérer les secrets et les configurations.
- Versionner les manifests Kubernetes.
- Assurer la persistance des données.
- Utiliser les concepts fondamentaux de **Kubernetes**.

---

## Infrastructure

L’infrastructure s’exécutera sur un serveur **Ubuntu 20.04** compatible avec **Docker**. Le POC inclura la conteneurisation du **backend Spring Boot** et de la **base de données MySQL**, ainsi que l’automatisation du déploiement via **Docker Compose** et **Kubernetes**.

### Composants :

- **Backend (Spring Boot)** : Gère les utilisateurs et les transactions.
- **Base de données (MySQL)** : Stocke les utilisateurs, transactions et informations de compte.
- **Orchestration Docker** : Gestion via `docker-compose.yml`.
- **Orchestration Kubernetes** : Déploiement avec des manifests Kubernetes.

---

## Application

L’application **PayMyBuddy** est divisée en deux services principaux :

### 1. Service Backend (Spring Boot) :
- Expose une API pour gérer les transactions et les interactions des utilisateurs.
- Se connecte à une base de données **MySQL** pour un stockage persistant.

### 2. Service Base de données (MySQL) :
- Stocke les données des utilisateurs et des transactions.
- Exposé sur le **port 3306** pour la connexion avec le backend.

---

## Construction et Tests (5 Points)

Vous devrez **construire et déployer** le backend et la base de données MySQL dans des conteneurs Docker.

### Initialisation de la base de données

Le schéma de la base de données est initialisé à l’aide du répertoire **`initdb`**, contenant des scripts SQL permettant de créer les tables et de charger des données initiales. Ces scripts s’exécutent automatiquement au démarrage du conteneur MySQL.

### Dockerfile du Backend :

- **Image de base** : `amazoncorretto:17-alpine`
- **Definir un repertoire de travail** pour recevoir le fichier jar
- **Copie du fichier JAR** du backend et exposition du port **8080**
- **CMD** : Exécution du service backend (java -jar paymybuddy.jar)

### Configuration de la base de données :

- Utilisation de **MySQL** comme service Docker avec montage des données dans un volume persistant.
- Exposition sur le **port 3306**.

---

## Orchestration avec Docker Compose (5 Points)

Le fichier `docker-compose.yml` permettra de déployer les deux services :

- **paymybuddy-backend** : Exécute l’application Spring Boot.
exemple de variable pour le backend:
```bash
    ENV SPRING_DATASOURCE_USERNAME=root
    ENV SPRING_DATASOURCE_PASSWORD=password
    ENV SPRING_DATASOURCE_URL=jdbc:mysql://172.17.0.1:3306/db_paymybuddy
```
- **paymybuddy-db** : Base de données MySQL.


### Fonctionnalités principales :

- Gestion des dépendances entre services.
- Utilisation de volumes pour le stockage persistant.
- Configuration sécurisée via des variables d’environnement.

---

## Registre Docker 

Vous devrez **pousser vos images** dans un registre Docker et les utiliser dans `docker-compose.yml`.

### Étapes :

1. Construire les images du **backend** et de **MySQL**.
2. Se connecter à un registre Docker.
3. Pousser les images dans le registre et les référencer dans `docker-compose.yml`.

---

## Orchestration Kubernetes (8 Points)

À partir de la configuration de **Docker Compose**, vous devez adapter le déploiement de l’application **PayMyBuddy** sur un cluster Kubernetes.

### Étapes :

1. Créer les objets Kubernetes pour chaque composant.
2. Utiliser des **ConfigMaps et Secrets** pour la gestion des variables.
3. Assurer la **persistance des données** pour la base MySQL.
4. Externaliser la configuration de l’application.

💡 **Remarque** : Cette partie implique la création de **manifests Kubernetes** (`Deployment`, `Service`, `ConfigMap`, `Secret`, `PersistentVolumeClaim`...).

---

## Livraison (2 Points)

Pour la livraison, fournissez les éléments suivants dans votre **dépôt Git** :

- Un **README** avec des captures d’écran et explications.
- Les fichiers **Dockerfile** et **docker-compose.yml** et **manifest Kubernetes**.
- Des **captures d’écran** de l’application en cours d’exécution.

### Critères d’évaluation :

✔️ **Qualité** des explications et des captures d’écran.

✔️ **Clarté et structure** du dépôt.

✔️ **Bonnes pratiques** appliquées.


🚀 **Bonne chance !**
