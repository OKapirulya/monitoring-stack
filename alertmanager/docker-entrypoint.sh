#!/bin/sh
envsubst < /etc/alertmanager/alertmanager.yml.template > /tmp/alertmanager.yml
exec /bin/alertmanager --config.file=/tmp/alertmanager.yml --storage.path=/alertmanager
