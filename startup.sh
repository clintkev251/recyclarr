#!/bin/bash

cd /etc/trash

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

CONFIG=./config/trash.yml
if test ! -f "$CONFIG"; then
    ./recyclarr create-config --path ./config/trash.yml
else
    ./recyclarr radarr --config ./config/trash.yml
    ./recyclarr sonarr --config ./config/trash.yml
fi
# tail -f /dev/null
