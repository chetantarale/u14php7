#!/bin/bash -e
# Begin service ENV variables
export SHIPPABLE_ES_CLUSTER_NAME=shippabletest;
export SHIPPABLE_ES_PORT=9200;
export SHIPPABLE_ES_BINARY="/usr/local/bin/elasticsearch";
export SHIPPABLE_ES_CMD="$SHIPPABLE_ES_BINARY --cluster.name=$SHIPPABLE_ES_CLUSTER_NAME";
# End service ENV variables

#
# Function to START
#
start_service() {
  start_generic_service "elasticsearch" "$SHIPPABLE_ES_BINARY" "$SHIPPABLE_ES_CMD" "$SHIPPABLE_ES_PORT";
}

# Function to stop
stop_service() {
  curl -s -X POST "http://localhost:9200/_shutdown" 2>&1;
}

CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_FILE_DIR/function_start_generic.sh
#
# Call to start service
#
echo "================= Starting elasticsearch ==================="
printf "\n"
start_service
printf "\n\n"
echo "================= Stopping elasticsearch ==================="
printf "\n"
stop_service
printf "\n\n"
