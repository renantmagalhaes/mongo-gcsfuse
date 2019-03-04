# mongo-gcsfuse
This docker Image is based on mongo:4.0.6-xenial and contains:

* mongo:4.0.6
* Latest gcsfuse
* cron
* backup script

- This was build mainly to be used in a Kubernetes environment inside GCP.


### To build this mongo environment with backup to a bucket in Google Cloud Storage follow this steps:

* Build the  Dockerfile and upload to your own repo, with the changes for your environment.
* Create a service account in GCP and attach it to bucket.
* Create volume vol-mongo.yaml
* Execute the script secret 0-create-secret-key.sh (modify the key.json with your own)
* Apply mongo.yaml


## Importart infos

To set your bucket alter the line in mongo.yaml (YOUR-BUCKET-NAME)
The backup is set to 1AM (local machine time) to alter this modify the Dockerfile

 * Mongo paths
    * DB - /data/db
    * Backup - /data/backup



