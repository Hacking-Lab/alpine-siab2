docker build --no-cache -t hackinglab/alpine-siab2:3.2.0 -t hackinglab/alpine-siab2:3.2 -t hackinglab/alpine-siab2:latest -f Dockerfile .
docker build --no-cache -t hackinglab/alpine-siab:3.2.0 -t hackinglab/alpine-siab:3.2 -t hackinglab/alpine-siab:latest -f Dockerfile .

docker push hackinglab/alpine-siab2
docker push hackinglab/alpine-siab

