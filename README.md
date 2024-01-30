# filelist-api

### Introduction

This is a simple python script which uses a headless browser to update your public IP in FL profile.

### How to build

1. Install Docker on Raspberry Pi
2. Clone this repository && change directory
3. Build the docker image by running the commands:

```shell
chmod +x build.sh
./build.sh
```

## How to run

The recommended way using docker-compose.yml requires docker swarm to create secrets. For a more crude and slightly insecure method, use the Quick and dirty instructions.

### docker-compose.yml

1. Create secrets:

``` shell
echo "myUsername" | docker secret create my_username -
echo "myPassword" | docker secret create my_password -
```

2. docker-compose.yml

```
version: '2.1'
services:
    changedetection:
      image: raspberry-pi-filelist-api-whitelist
      container_name: filelist-api-whitelist
      environment:
        - FL_USERNAME=/run/secrets/my_username
        - FL_PASSWORD=/run/secrets/my_password
        - CHECK_INTERVAL=10 #in minutes I suggest putting more than 5 minutes.
      restart: unless-stopped
```

### Quick and dirty (NOT RECOMMENDED)

Compose file
```
version: '2.1'
services:
    changedetection:
      image: raspberry-pi-filelist-api-whitelist
      container_name: filelist-api-whitelist
      environment:
        - FL_USERNAME=your_username
        - FL_PASSWORD=your_password
        - CHECK_INTERVAL=10 #in minutes I suggest putting more than 5 minutes.
      restart: unless-stopped
```

## Contributing

Feel free to contribute or report bugs.

## Original Authors

I only streamlined the docker build process.

https://github.com/ihatethecloud/filelist-api-whitelist
https://github.com/cristacheda/filelist-api-whitelist
