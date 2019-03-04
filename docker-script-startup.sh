#!/bin/bash
service cron start
sh -c "/usr/local/bin/docker-entrypoint.sh mongod"
