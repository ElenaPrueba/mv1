echo '---> Configurando posgresql...'
sudo postgresql-setup initdb
sudo cp $HOME/files/pg_hba.conf /var/lib/pgsql/data/
sudo systemctl start postgresql
sudo systemctl enable postgresql

echo '---> Creando base de datos y usuario'
sudo -u postgres psql -c "CREATE DATABASE myproject"
sudo -u postgres psql -c "CREATE USER myprojectuser WITH PASSWORD 'password'"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE myproject TO myprojectuser"

echo '--->Configurando y arrancando nginx...'
# sudo mv $HOME/files/nginx.conf /etc/nginx/nginx.conf
sudo usermod -a -G vagrant nginx
sudo chmod 710 /home/vagrant
sudo nginx -t
sudo systemctl start nginx
sudo systemctl enable nginx

echo '--->Configurando Gunicorn'
# Copiar fichero de configuración de servicio
sudo mv $HOME/files/gunicorn.service /etc/systemd/system/gunicorn.service
# Arranque de servicios
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
# Configuracion de nginx para Gunicorn


echo '---> '
