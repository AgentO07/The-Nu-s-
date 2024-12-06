#!/bin/zsh

# very rudimentary

# TODO make it robust, by getting pid's and doing it the ACTUAL way.

rm -rf "ml/queue_dir"  # Remove the persist-queue directory
cd "ml" || exit
python3 file_watcher.py &
java -jar /home/ajafri/Desktop/cowj/app/build/libs/cowj-0.1-SNAPSHOT.jar ../apis/apis.yaml

#Wait for the models to load


# BELOW CODE IS FOR APACHE DRUID INGESTION SPEC

##########################################################################################
##########################################################################################

# Make druid receive ingestion specs every minute as a background process, VERY RUDIMENTARY without a cron job

# send_ingestion_specs() {
#   curl -X POST -H 'Content-Type: application/json' -d @./ingestion-spec.json http://localhost:8081/druid/indexer/v1/task
# }

# while true; do
#   send_ingestion_specs
#   sleep 60  # sleep for a whole minute
# done
