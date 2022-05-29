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
```
### Usage
On first run, the script will look for a config file in your mapped config directory. If one does not exist it will create one and exit. You can edit this file to point to your radarr and sonarr instances and use the desired profiles. On subsequent starts, dependent on the enviornment vars you have set `recyclarr radarr` and `recyclarr sonarr` will be run and the container will exit. You can write a simple script to start the container at your desired interval to update profiles.

This is autobuilt and published on new releases from the main project. Pull requests for fixes and enhancements are welcomed.

https://hub.docker.com/r/clintkev251/recyclarr
