
### template8
The `template8` docker example 

* runs `script.sh` file as a cron job,
* have a mounting point to a host directory,
* belongs to bridge network and has a static ip

### Purpose
* run bash scripts (`script.sh`) in cron
* read, store, process data on a host directory via a mounting point,
* communicate with other container via IP addresses

### Commands
Use the following commands to install, start, or uninstall the images or container.

| command | description |
|:-------:|:-----------:|
| `./config uninstall` | Cleanup previous installations |
| `vi config.conf` | Increment the version |
| `./config.sh build run` | Build the Image and instantiate the Container |
| `./config.sh start` | Start the Container again |

Requires execution rights for `config.sh`.
For example, run `chmod u+x config.sh` to call `./config.sh ...`.
Otherwise call `bash config.sh ...`.

### script.sh
Is executed as cron job.
Edit the file `script.sh` for the stuff you want to do.

## crontab
Edit in `crontab` the schedule when to execute `script.sh`. 

## network settings
Requires a bridge network, e.g.

```
docker network create \
    --subnet=172.64.0.0/16 \
    --driver=bridge \
    mynet
```

what is specified in `config.conf` as 

```
netname=mynet
ipaddr4=172.64.0.123  # pick an IP within the subnet of mynet
```

### Dockerfile
Nothing to say about it.


### Links
* [template8](https://github.com/waalfisk/template8)
* [Run a cron job with Docker](https://www.ekito.fr/people/run-a-cron-job-with-docker/)