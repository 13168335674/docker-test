#!/bin/sh
git pull origin master
docker container stop github_app
docker container rm github_app
docker build -t github_app .
docker run -p 80:80 -d --name  github_app github_app
