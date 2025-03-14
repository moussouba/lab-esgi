# General

Les captures se trouvent sans le repertoire screenshot

# Partie: Orchestration Docker compose

## Build image docker du backend
``docker build . -t paymybuddy-backend:latest``

## Pousser image sur docker hub

Autentification sur docker hub avec identifiant et mot de passe
``docker login``

Tagguer l'image pour docker hub
``docker tag paymybuddy-backend:latest 9cvo/paymybuddy-backend:latest``

Pousser l'image sur docker hub
``docker push 9cvo/paymybuddy-backend:latest``

## Deployer nos services avec docker compose

Lancer le deploiement
``docker compose up -d``

Verifier les services deployés
``docker compose ps``


# Partie: Orchestration Kubernetes

Les manifestes kube se trouve dans le repertoire k8s

## Que faire chaque fichier

### configmap.yaml

permet au backend de connaître l'URL de connexion à la base de données MySQL. L'URL contient le nom du service paymybuddy-db et le port 3306, qui est exposé par le service MySQL dans k8s.


### secret.yaml

Contient les accès à la base de données mysql (information codé en base64).

### mysql-pv.yaml

Met à disposition du noeud un stockage persistant de 1Go en lecture et en écriture

### mysql-pvc.yaml

Permet de créer une demande de stockage pour un volume de 1Go qui sera monté dans notre container mysql.

### paymybuddy-backend-deploy.yaml

Déploie le container backend dans un pod avec 1 replica

### paymybuddy-backend-svc.yaml

Expose le service en mode NodePort accessible de l'exterieur sur le port 30008

### paymybuddy-db-deploy.yaml

Déploie le container mysql dans un pod avec 1 replica

Le repertoire (initdb) est monté sur le conteneur (/docker-entrypoint-initdb.d) permettant d'executé les script sql d'initiation dans contenu dans celui-ci au demarrage de la base de donnée

### paymybuddy-db-svc.yaml

Expose le service en mode ClusterIP accessible uniquement dans le cluster sur le port 3306

## Deploiement

Create un namespace lab qui contiendra nos ressources
``kubectl create ns lab``

Appliquer les manifestes crées
``kubectl create -f k8s/``

Verifier nos ressources créees
``kubectl get all -n lab``

# Acceder au site

Dans le navigateur: ``http://192.168.56.10:30008/``





