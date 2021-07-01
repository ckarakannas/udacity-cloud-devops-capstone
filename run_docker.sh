#!/usr/bin/env bash

docker build -t chrisk14/currency-exchange:prod --build-arg API_ENV=Production .

docker image ls

CONTAINER_ID=$(docker run -d --rm -p 5000:5000 chrisk14/currency-exchange:prod gunicorn -w 4 -b 0.0.0.0:5000 run:app)

echo $CONTAINER_ID
echo $CONTAINER_ID > container_id.log
