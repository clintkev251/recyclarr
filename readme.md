## NOTICE: This image is now depricated. Recyclarr now maintains an official image which you should use instead. 

This docker includes the recyclarr binary (https://github.com/recyclarr/recyclarr). 

### Instalation
You can see the below docker compose file for a minimal example on how to deploy this:
```
version: "3.9"
services:
  recyclarr:
    image: clintkev251/recyclarr:latest
    volumes:
      - /path/to/config/on/host:/etc/trash/config
    environment:
      RUN_RADARR: true  # Optional - If unset, defaults to true
      RUN_SONARR: true  # Optional - If unset, defaults to true
      CRON_EXPRESSION: "0 15 * * *" # Optional - The cron expression that determines when the script will be run. If unset, scripts will be run at startup of container
```
### Usage
On first run, the script will look for a config file in your mapped config directory. If one does not exist it will create one and exit. You can edit this file to point to your radarr and sonarr instances and use the desired profiles. 

On subsequent starts, the behavior will be dependent on whether or not you've defined a cron expression in your environment varriables. If a cron expression is defined, the approprate commands will be run on the schedule that you've defined. If not, they will be run once and the container will exit. Using this mode you can write a simple script to start the container at your desired interval from your host.

This is autobuilt and published on new releases from the main project. Pull requests for fixes and enhancements are welcomed.

https://hub.docker.com/r/clintkev251/recyclarr
