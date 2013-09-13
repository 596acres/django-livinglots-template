#!/bin/bash

NAME="example"
DJANGODIR=$HOME/webapps/example
PORT=14708
USER=example
GROUP=example
NUM_WORKERS=3
DJANGO_PROJECT_NAME=example
DJANGO_SETTINGS_MODULE=$DJANGO_PROJECT_NAME.settings.production
DJANGO_WSGI_MODULE=$DJANGO_PROJECT_NAME.wsgi
VIRTUALENV=devllnola
LOGDIR=$HOME/webapps/example/logs

echo "Starting $NAME"

# Activate the virtual environment
source ~/bin/virtualenvwrapper.sh
workon $VIRTUALENV
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE

# Start gunicorn
exec gunicorn \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --log-level=debug \
  --bind=127.0.0.1:$PORT \
  --log-file $LOGDIR/error.log --access-logfile $LOGDIR/access.log \
  $DJANGO_WSGI_MODULE:application
