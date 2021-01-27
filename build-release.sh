#!/bin/bash
docker build --no-cache -t hackinglab/alpine-siab2:$1.0 -t hackinglab/alpine-siab2:$1 -t hackinglab/alpine-siab2:latest -f Dockerfile .

docker push hackinglab/alpine-siab2
docker push hackinglab/alpine-siab2:$1
docker push hackinglab/alpine-siab2:$1.0
