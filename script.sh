#!/bin/sh

GITHUB_USER="jylhakos"

GITHUB_TOKEN=""

GITHUB_REPOSITORY="github.com/jylhakos/phonebook.git"

REPOSITORY_DIRECTORY="phonebook"

GITHUB_REPOSITORY_URL="https://"$GITHUB_REPOSITORY

DOCKER_USER="jylhakos"

DOCKER_TOKEN=""

DOCKER_IMAGE="phonebook"

DIRECTORY="exercise"

HAS_DOCKER_IMAGE=$( docker images -q $DOCKER_IMAGE )

echo "HAS_DOCKER_IMAGE" $HAS_DOCKER_IMAGE

if [[ -n "$HAS_DOCKER_IMAGE" ]] 
then
	echo "remove $DOCKER_IMAGE"

	docker rmi -f DOCKER_IMAGE
fi

if [[ -n "$DIRECTORY" ]]
then
	echo "remove $DIRECTORY"

	rm -rf $DIRECTORY
fi

mkdir $DIRECTORY

cd $DIRECTORY"/"$REPOSITORY_DIRECTORY

pwd

git clone $GITHUB_REPOSITORY_URL

npm install

ls -l

docker build -t $DOCKER_USER"/"$DOCKER_IMAGE .

docker login --username DOCKER_USER --password DOCKER_TOKEN

docker push $DOCKER_USER"/"$DOCKER_IMAGE