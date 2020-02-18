#!/bin/sh

#Paths and Folders
bkp_path=/data/backup

##Dates
DAY=$(date +"%d")
MONTH=$(date +"%m")
YEAR=$(date +"%Y")

mkdir -p $bkp_path/$YEAR/$MONTH/$DAY

#Go to path and dump all databases
cd $bkp_path/$YEAR/$MONTH/$DAY
mongodump --out $bkp_path/$YEAR/$MONTH/$DAY

#Compress all database in individual files
#for i in * ; do tar zcvf "mongo-backup-daily-${i%/}-full.tar" "$i"; done
for i in *
    do tar zcvf "mongo-backup-daily-${i%/}-full.tar" "$i" --remove-files
done




