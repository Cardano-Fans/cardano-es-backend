# cardano-es-backend


# Introduction
Project provides a simple docker-compose wrapper around: https://github.com/txpipe/oura/  + elastic search + kibana

It came out of need to simplify exploration of oura and provide a ready made docker-compose script to integrate: oura, elasticsearch and kibana

# Build docker oura image
```
sudo docker build -t oura:0.3.7 .
```

# Running all docker images
```
docker-compose up
```

# Exploring
- Elastic Search -> http://localhost:9200
- Kibana -> http://localhost:5601
