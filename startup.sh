#!/bin/bash
export CONFIG=/etc/trash/config/recyclarr.yml
cd /etc/trash

# Test if config exists. If not, create it and exit
if test ! -f "$CONFIG"; then
    ./exec create-config --path $CONFIG
    exit 0
fi
# Check if user has explicitly set RUN_* vars, if not, set to default
if test -z "$RUN_RADARR"; then
    RUN_RADARR="true"
fi
if test -z "$RUN_SONARR"; then
    RUN_SONARR="true"
fi
# Check if user has set a cron expression. If so set crontab and run cron in forground mode. If not, run onetime commands
if test -n "$CRON_EXPRESSION"; then
    echo "Building cron expressions using $CRON_EXPRESSION"
    if $RUN_RADARR = "true"; then
        echo "Setting up job for Radarr"
        echo "$CRON_EXPRESSION /etc/trash/exec radarr --config $CONFIG >/proc/1/fd/1 2>/proc/1/fd/2" | crontab
    fi
    if $RUN_SONARR = "true"; then
        echo "Setting up job for Sonarr"
        echo "$CRON_EXPRESSION /etc/trash/exec sonarr --config $CONFIG >/proc/1/fd/1 2>/proc/1/fd/2" | crontab
    fi
    echo "Starting cron"
    exec cron -f
else
    echo "No cron expression provided, running in external schedule mode"
    if $RUN_RADARR = "true"; then
        ./exec radarr --config $CONFIG
    fi
    if $RUN_SONARR = "true"; then
        ./exec sonarr --config $CONFIG
    fi
fi

