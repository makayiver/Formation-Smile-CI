#!/bin/bash

### Script pour effectuer la sauvegarde journalière des bases de données mariadb contenu sur un serveur ####

#Definir la date de sauvegarde e.g. YYYY_MM_DD

Date=$(date +"%y_%m_%d")

#Définir le dossier dans lequel nous allons  sauvegarder les backup

BACKUP_DIR="/backup/mariadb"

#Créer chaque jour dans BACKUP_DIR un nouveau dossier qui contiendra les sauvegardes journalières de toutes les bases de données du serveur 

mkdir $BACKUP_DIR/$Date

#Bases de données a ignorer (les bases de données par defaut de mariadb) lors de la sauvegarde

SkipDatabases="Database|information_schema|performance_schema|mysql"

#Extraire la liste des bases de données utiles

Databases=`mysql -uroot -p2SCA1994 -e "SHOW DATABASES;" | grep -Ev "($SkipDatabases)"`

#Sauvegarder les bases de données utiles avec la commande mysqldump

for db in $Databases; do
echo $db
mysqldump -uroot -p2SCA1994  --databases $db > "$BACKUP_DIR/$Date/$db.sql"
done


#Pour effectuer une sauvegade automatique chaque jour a 00H01min, il faut modifier le crontab du serveur en ajoutant le code suivant 

#Ouvrir d'abord le crontab avec la commande vim /etc/crontab

##Code à copier   01 00 ***root /backup/mariadb/test2.sh  ##

