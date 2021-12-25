# cardano-es-backend


# Introduction
Project provides a simple docker wrapper around: https://github.com/txpipe/oura/
It came out of need to simplify exploration of oura and provide a ready made docker-compose script to integrate: oura, elasticsearch and kibana

# Build docker oura image
```
sudo docker build -t oura:latest .
```

# Running all docker images
```
docker-compose up
```

# Exploring
- Elastic Search -> http://localhost:9200
- Kibana -> http://localhost:5601
