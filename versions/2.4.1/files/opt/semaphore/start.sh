#!/usr/bin/env bash

until mysql -h"${MYSQL_PORT_3306_TCP_ADDR}" -u"root" &> /dev/null
do
        >$2 echo -n "."
        sleep 1
done

# If this is the first time we have run this container, update place holder to env vars in config files
if [ -e /firstrun ]; then
  echo "Starting first run actions"
  sed -i s/MYSQL_IP_ADDR/${MYSQL_PORT_3306_TCP_ADDR}/ /opt/semaphore/semaphore_config.*
  semaphore -setup < /opt/semaphore/semaphore_config.stdin
  # Remove first run so that subsequent runs within the same container instance don't invoke first_run logic again
  rm /firstrun
fi

# Start the container
semaphore -config /opt/semaphore/semaphore_config.json
