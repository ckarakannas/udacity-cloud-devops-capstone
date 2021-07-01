#!/usr/bin/env bash

docker build -t chrisk14/currency-exchange:prod --build-arg API_ENV=Production .

docker image ls

docker run --rm -p 5000:5000 chrisk14/currency-exchange:prod gunicorn -w 4 -b 0.0.0.0:5000 run:app
