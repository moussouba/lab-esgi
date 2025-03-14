# Choisir l'enonce en fonction de votre langue | Choosing the right advert for your language

[![English](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/ulrich-sun/projet-esgi/blob/main/enonce-en.md)
[![français](https://img.shields.io/badge/lang-fr-blue.svg)](https://github.com/ulrich-sun/projet-esgi/blob/main/enonce-fr.md)


# Conseils

- Pour travailler plus efficacement, commencez par forker ce dépôt.
- Clonez votre fork sur votre serveur.
- Créez les dossiers de travail et les fichiers nécessaires.
- Utilisez les workflows Git pour sauvegarder l’ensemble de vos travaux sur votre dépôt GitHub.
- Votre dépôt GitHub peut servir de portfolio pour certains, il est donc important de bien le structurer.
- Je vous propose une stack vagrant dans le dossier **stack**
    pour lancer cette stack vous aurez besoin de VirtualBox en version 7.0.20 et de vagrant en version 2.4.1
    vous devez vous rendre dans le dossier stack 
    en fonction de votre terminal de travail sous windows vous devez creer une variable pour le choix du script 
    si vous etes sur CMD alors c'est set SCRIPT_NAME="k3s.sh"
    si vous etes sur Powershell alors c'est $env:SCRIPT_NAME="k3s.sh"
    Une fois la variable configurer vous lancez la commande vagrant up

# Tips
- To work more efficiently, start by forking this repository.
- Clone your fork to your server.
- Create the necessary working folders and files.
- Use Git workflows to back up all your work to your GitHub repository.
- Your GitHub repository can serve as a portfolio for some, so it’s important to structure it well.
    I am providing a Vagrant stack in the stack folder. To launch this stack, you will need VirtualBox version 7.0.20 and Vagrant version 2.4.1. You should navigate to the stack folder. Depending on your working terminal in Windows, you need to create a variable for the script choice. If you are using CMD, then it's set SCRIPT_NAME="k3s.sh". If you are using PowerShell, then it's $env:SCRIPT_NAME="k3s.sh". Once the variable is configured, you run the command vagrant up.