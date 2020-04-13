#bash

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

python3 -m venv venv
pip install --upgrade pip
pip install django
pip install gunicorn

source venv/bin/activate
gunicorn --bind=0.0.0.0:8080 --workers=2 --timeout=15 --log-level=debug hello.app
