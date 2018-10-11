#!/bin/bash

### Script pour effectuer la sauvegarde journalière d'une base de données mariadb ####

#Definir la date de sauvegarde e.g. YYYY_MM_DD

Date=$(date +"%y_%m_%d")

#Définir le dossier dans lequel nous allons  sauvegarder les backup

BACKUP_DIR="/backup/mariadb"

#Sauvegarder la base de données SmsVote_MASNDI avec la commande mysqldump

mysqldump -uroot -p2SCA1994 --databases SmsVote_MASNDI > $BACKUP_DIR/SmsVote_MASNDI$Date.sql


#Pour effectuer une sauvegade automatique chaque jour a 00H01min, il faut modifier le crontab du serveur en ajoutant la ligne de code suivante

#Ouvrir d'abord le crontab avec la commande crontab -e

##Code à copier   01      00      *       *        *       /backup/mariadb/test1.sh  ##
