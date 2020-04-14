#bash

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

virtualenv -p python3 venv
source venv/bin/activate
pip install --upgrade pip
pip install django==2.0
pip install gunicorn

gunicorn --bind=0.0.0.0:8080 --workers=2 --timeout=15 --log-level=debug hello:app
