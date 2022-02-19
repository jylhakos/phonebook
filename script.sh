#!/bin/sh

GITHUB_REPOSITORY=https://github.com/jylhakos/phonebook.git

DOCKER_REPOSITORY=phonebook

DIRECTORY=tmp

IMAGE=phonebook

rm -rf $DIRECTORY

mkdir $DIRECTORY

cd $DIRECTORY

git clone $GITHUB_REPOSITORY

npm install

docker login

docker build -t $IMAGE .

docker push jylhakos/$DOCKER_REPOSITORY