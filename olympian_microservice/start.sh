#!/usr/bin/env bash

echo "BUILD DOCKER"
docker-compose run web python manage.py migrate
docker-compose build
docker-compose up -d

echo "IMAGE UP AND RUNNING"
echo "OPENING URL IN DEFAULT BROWSER"


if which xdg-open > /dev/null
then
  xdg-open http://127.0.0.1:8000/
elif which gnome-open > /dev/null
then
  gnome-open http://127.0.0.1:8000/
else
  open http://127.0.0.1:8000/
fi
