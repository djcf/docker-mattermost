#!/bin/bash

sed -ri "s/POSTGRES_USER/$POSTGRES_USER/" /mattermost/config/config.json
sed -ri "s/POSTGRES_PASSWORD/$POSTGRES_PASSWORD/" /mattermost/config/config.json
sed -ri "s/POSTGRES_DB/$POSTGRES_DB/" /mattermost/config/config.json

cd /mattermost/bin
./platform
