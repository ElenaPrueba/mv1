echo '--->Preparando entorno de aplicación...'
rm -rf ~/myproject
mkdir ~/myproject
cd ~/myproject
virtualenv venv
source venv/bin/activate
pip3.6 install django gunicorn psycopg2 psycopg2-binary

django-admin.py startproject myproject .

cat $HOME/files/local_settings_append.py >> $HOME/myproject/myproject/settings.py
mv $HOME/files/local_settings.py $HOME/myproject/myproject

# migrate the initial database schema to our PostgreSQL database
cd ~/myproject
./manage.py makemigrations
./manage.py migrate

# Create an administrative user for the project
./manage.py shell -c "from django.contrib.auth.models import User; User.objects.get(username='admin', is_superuser=True).delete()"
./manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'adminpass')"

# Collect all of the static content into the directory location we configured
./manage.py collectstatic

# ./manage.py runserver 0.0.0.0:8000
