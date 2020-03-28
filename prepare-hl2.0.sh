#!/bin/bash

echo "What is the resource UUID? This is required! Please enter the UUID, followed by [ENTER]:"
read id


if [ -d ./deploy ]; then
    echo "deploy folder available - will delete the folder"
    rm -rf ./deploy
else
    echo "deploy not available - this is ok"
fi

if [ -d ./tmp ]; then
    echo "tmp folder available - will delete the folder"
    rm -rf ./tmp
else
    echo "tmp not available - this is ok"
fi

mkdir ./deploy
cp -rf ./root/ ./deploy/
cp ./Dockerfile ./deploy
cp ./UUID.env ./deploy/$id.env
cp ./UUID.gn ./deploy/$id.gn
cd ./deploy
tar -cvzf dockerfiles.tar.gz *
rm Dockerfile
rm -rf root
rm $id.env
rm $id.gn
cd ..
ls -al ./deploy
mkdir ./tmp 
cat docker-compose.yml | sed "s/UUID/$id/g" | tee ./tmp/docker-compose-$id.yml 
