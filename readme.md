This docker includes the recyclarr binary (https://github.com/recyclarr/recyclarr). On startup it will check for a trash.yml config at /etc/trash/config. If it doesn't exist it will use the recyclarr create-config command to create it, then exit. You should map this to a path on your local server so that you can edit it and it persists. On subsequent startups, the container will run both recyclarr radarr and recyclarr sonarr. You should schedule the container to run on a cron schedule as needed. It will exit after processing is completed.

This is autobuilt and published on new releases from the main project. Pull requests for fixes and enhancements are welcomed.

https://hub.docker.com/r/clintkev251/recyclarr
