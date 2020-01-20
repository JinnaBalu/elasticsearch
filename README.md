
# Elasticsearch Components

First and foremost step is to create the network which is used in all services.

#### Create the docker network

- Create a netwrok name `stack` with the default driver `bridge`

```bash
docker network create --driver bridge stack
```

#### Create Environment 

- Create the `.env` file in the root directory with the following variables based on the current version

```bash
TAG=7.5.1
```
