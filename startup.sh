#!/bin/bash

cd /etc/trash

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

CONFIG=./config/trash.yml
if test ! -f "$CONFIG"; then
    ./trash create-config --path ./config/trash.yml
else
    ./trash radarr --config ./config/trash.yml
    ./trash sonarr --config ./config/trash.yml
fi
# tail -f /dev/null