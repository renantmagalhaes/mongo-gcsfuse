FROM docker.io/mongo:4.0.6-xenial

RUN apt-get update \
&& apt-get -y install curl vim lsb-release cron  \
&& export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` \
&& echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list \
&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
&& apt-get update \
&& apt-get install -y gcsfuse \
&& mkdir -p /data/backup \
&& service cron start

#Add backup script
ADD backup-daily-all.sh /root/
ADD docker-script-startup.sh /usr/local/bin/

#Add crontab to run backup script at 1AM Local Machine Time
RUN (crontab -l 2>/dev/null; echo "0 1 * * * sh -c /root/backup-daily-all.sh") | crontab -

WORKDIR /usr/local/bin/

EXPOSE 27017

ENTRYPOINT [ "docker-script-startup.sh" ]

CMD [ "mongod" ]



