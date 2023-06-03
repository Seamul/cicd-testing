#!/bin/sh

ssh seam@192.168.0.82 <<EOF
  cd cicd_test
  git pull
  source /opt/envs/cicd_test/bin/activate
  pip install -r requirements.txt
  ./manage.py makemigrations
  ./manage.py migrate  --run-syncdb
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF