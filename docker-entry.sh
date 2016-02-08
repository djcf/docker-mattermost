#!/bin/bash

sed -ri "s/DB_USER/$DB_USER/" /mattermost/config/config.json
sed -ri "s/DB_PASS/$DB_PASS/" /mattermost/config/config.json
sed -ri "s/DB_NAME/$DB_NAME/" /mattermost/config/config.json
sed -ri "s/DB_PORT/$DB_PORT_5432_TCP_PORT/" /mattermost/config/config.json

cd /mattermost/bin
./platform
