This docker includes the trash-updater binary (https://github.com/rcdailey/trash-updater). On startup it will check for a trash.yml config at /etc/trash/config. If it doesn't exist it will use the trash create-config command to create it, then exit. You should map this to a path on your local server so that you can edit it and it persists. On subsequent startups, the container will run both trash radarr and trash sonarr. You should schedule the container to run on a cron schedule as needed. It will exit after processing is completed.

This is autobuilt and published on new releases from the main project

https://hub.docker.com/repository/docker/clintkev251/trash-updater
