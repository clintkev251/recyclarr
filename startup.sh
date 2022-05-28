#!/bin/bash

cd /etc/trash

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

if test -z "$RUN_RADARR"; then
    RUN_RADARR="true"
fi
if test -z "$RUN_SONARR"; then
    RUN_SONARR="true"
fi

CONFIG=./config/recyclarr.yml

if test ! -f "$CONFIG"; then
    ./recyclarr-exec create-config --path $CONFIG
else
    if $RUN_RADARR = "true"; then
        ./recyclarr-exec radarr --config $CONFIG
    fi
    if $RUN_SONARR = "true"; then
    ./recyclarr-exec sonarr --config $CONFIG
    fi
fi

# tail -f /dev/null
