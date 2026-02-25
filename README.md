# formation admin IRIS

Ce projet sert de travaux pratiques à la formation administration InterSystems IRIS®

## Pré-requis

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Visual Studio Code + extensions InterSystems](https://docs.intersystems.com/components/csp/docbook/DocBook.UI.Page.cls?KEY=GVSCO)
- [Python](https://www.python.org/downloads/)
- [Compte Developer Community](https://community.intersystems.com/)
- [Login au repo Containers InterSystems](https://containers.intersystems.com/contents)

## Installation

1. Cloner ce repo:

```bash
git clone https://github.com/yourusername/formation_admin_IRIS.git
```

2. Aller dans le répertoire du repo cloné:

```bash
cd formation_admin_IRIS
```

3. Copier la licence iris.key dans le répertoire iris-prod/key

4. Démarrer les services:

```bash
docker-compose up -d
```
5. Attendre que les services soient démarrés (environ 2 minutes) et vérifier que tous les conteneurs sont en état "healthy":

```bash
docker-compose ps
```

6. Se connecter à l'interface de gestion d'IRIS (http://localhost:10000/csp/sys/%25CSP.Portal.Home.zen) avec les identifiants suivants:
- Username: _SYSTEM
- Password: SYS

7. Se connecter à l'interface de gestion d'IRIS PROD 1 (http://localhost:18880/iris-prod-1/csp/sys/%25CSP.Portal.Home.zen) avec les identifiants suivants:
- Username: _SYSTEM
- Password: SYS

8. Se connecter à l'interface de gestion d'IRIS PROD 2 (http://localhost:18880/iris-prod-2/csp/sys/%25CSP.Portal.Home.zen) avec les identifiants suivants:
- Username: _SYSTEM
- Password: SYS

9. Lancer une sauvegarde de toutes les instances IRIS en exécutant le script backup.sh:

```bash
./admin/backup.sh
```

10. Lancer le script putPatients.sh pour injecter des données de test dans les instances IRIS:

```bash
./test/putPatients.sh
```
11. Se connecter à l'interface FHIR de chaque instance IRIS pour vérifier que les données ont été injectées correctement:
- IRIS DEV: http://localhost:10000/fhir/portal/patientlist.html
- IRIS PROD 1: http://localhost:18880/iris-prod-1/fhir/portal/patientlist.html
- IRIS PROD 2: http://localhost:18880/iris-prod-2/fhir/portal/patientlist.html


## liens utiles
- [IRIS Drivers](https://intersystems-community.github.io/iris-driver-distribution/)
- [Getting Started](https://gettingstarted.intersystems.com/)
- [Developer Community](https://community.intersystems.com/)
- [FR Developer Community](https://fr.community.intersystems.com/)
- [Early Access Program](https://www.intersystems.com/early-access-program/)
- [IRIS MIRRORING](https://github.com/SylvainGuilbaud/IRIS_mirror)
- [IRIS EM CD PREVIEW](https://github.com/SylvainGuilbaud/IRIS_containers_prod)
