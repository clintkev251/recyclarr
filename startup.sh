#!/bin/bash

cd /etc/trash

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

CONFIG=./config/recyclarr.yml
if test ! -f "$CONFIG"; then
    ./recyclarr-exec create-config --path ./config/recyclarr.yml
else
    ./recyclarr-exec radarr --config ./config/recyclarr.yml
    ./recyclarr-exec sonarr --config ./config/recyclarr.yml
fi
# tail -f /dev/null
