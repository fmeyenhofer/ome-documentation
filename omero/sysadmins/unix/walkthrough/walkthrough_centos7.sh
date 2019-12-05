#!/bin/bash
set -e -u -x
source settings.env
source settings-web.env

#start-step01: As root, install dependencies
yum -y install epel-release

yum -y install unzip wget bc

# install Java
yum -y install java-11-openjdk

# install dependencies

yum -y install python3
#end-step01
# install Ice
#start-recommended-ice
curl -sL https://zeroc.com/download/Ice/3.6/el7/zeroc-ice3.6.repo > \
/etc/yum.repos.d/zeroc-ice3.6.repo

yum -y install ice-all-runtime
#end-recommended-ice


# install Postgres
yum -y install https://yum.postgresql.org/11/redhat/rhel-7-x86_64/pgdg-redhat11-11-2.noarch.rpm
yum -y install postgresql11-server postgresql11

PGSETUP_INITDB_OPTIONS=--encoding=UTF8 /usr/pgsql-11/bin/postgresql-11-setup initdb

sed -i.bak -re 's/^(host.*)ident/\1md5/' /var/lib/pgsql/11/data/pg_hba.conf
systemctl start postgresql-11.service

systemctl enable postgresql-11.service
#end-step01

#start-step02: As root, create an omero system user and directory for the OMERO repository
useradd -mr omero
# Give a password to the omero user
# e.g. passwd omero
chmod a+X ~omero

mkdir -p "$OMERO_DATA_DIR"
chown omero "$OMERO_DATA_DIR"
#end-step02
#start-step03: As root, create a database user and a database
echo "CREATE USER $OMERO_DB_USER PASSWORD '$OMERO_DB_PASS'" | su - postgres -c psql
su - postgres -c "createdb -E UTF8 -O '$OMERO_DB_USER' '$OMERO_DB_NAME'"

psql -P pager=off -h localhost -U "$OMERO_DB_USER" -l
#end-step03

#start-step03bis: As root, create a virtual env and install dependencies
# Create a virtual env and activate it
python3 -mvenv $VENV_SERVER

# Install the Ice Python binding
$VENV_SERVER/bin/pip install https://github.com/ome/zeroc-ice-py-centos7/releases/download/0.2.1/zeroc_ice-3.6.5-cp36-cp36m-linux_x86_64.whl
#end-step03bis

#start-step04-pre: As root, install omero-py, download the OMERO.server
# Install omero-py
$VENV_SERVER/bin/pip install "omero-py>=5.6.dev4"
#start-release-ice36
cd /opt/omero/server
SERVER=https://downloads.openmicroscopy.org/omero/5.6/server-ice36.zip
wget -q $SERVER -O OMERO.server-ice36.zip
unzip -q OMERO.server*
#end-release-ice36
# change ownership of the folder
chown -R omero OMERO.server-*
ln -s OMERO.server-*/ OMERO.server
#end-step04-pre

#start-step04: As the omero user, configure it
#start-copy-omeroscript
cp settings.env settings-web.env step04_all_omero.sh setup_omero_db.sh ~omero 
#end-copy-omeroscript
omero config set omero.data.dir "$OMERO_DATA_DIR"
omero config set omero.db.name "$OMERO_DB_NAME"
omero config set omero.db.user "$OMERO_DB_USER"
omero config set omero.db.pass "$OMERO_DB_PASS"
omero db script -f $OMERODIR/db.sql --password "$OMERO_ROOT_PASS"
psql -h localhost -U "$OMERO_DB_USER" "$OMERO_DB_NAME" < $OMERODIR/db.sql
#end-step04

#start-step05: As omero, install OMERO.web dependencies

#start-configure-nginx: As the omero system user, configure OMERO.web
omero config set omero.web.application_server wsgi-tcp
omero web config nginx --http "$WEBPORT" > $OMERODIR/nginx.conf.tmp
#end-configure-nginx
# As root, install nginx
#start-nginx-install
yum -y install nginx
#end-nginx-install
#start-nginx-admin
sed -i.bak -re 's/( default_server.*)/; #\1/' /etc/nginx/nginx.conf

cp $OMERODIR/nginx.conf.tmp /etc/nginx/conf.d/omero-web.conf

systemctl enable nginx

systemctl start nginx

#end-nginx-admin

#end-step05

#start-step06: As root, run the scripts to start OMERO and OMERO.web automatically
cp omero-systemd.service /etc/systemd/system/omero.service
cp omero-web-systemd.service /etc/systemd/system/omero-web.service

systemctl daemon-reload

systemctl enable omero.service
systemctl enable omero-web.service
#end-step06

#start-step07: As root, secure OMERO
chmod go-rwx $OMERODIR/etc $OMERODIR/var

# Optionally restrict access to the OMERO data directory
# chmod go-rwx "$OMERO_DATA_DIR"
#end-step07

#start-step08: As root, perform regular tasks
#start-omeroweb-cron

OMERO_USER=omero
OMERO_SERVER=/opt/omero/server/OMERO.server
SETTINGS=/home/omero/settings.env
su - ${OMERO_USER} -c ". ${SETTINGS} omero web clearsessions"
#end-omeroweb-cron
#Copy omero-web-cron into the appropriate location
#start-copy-omeroweb-cron

cp omero-web-cron /etc/cron.daily/omero-web
chmod a+x /etc/cron.daily/omero-web
#end-copy-omeroweb-cron
#end-step08
#start-selinux

if [ $(getenforce) != Disabled ]; then
    yum -y install policycoreutils-python
    setsebool -P httpd_read_user_content 1
    setsebool -P httpd_enable_homedirs 1
    semanage port -a -t http_port_t -p tcp 4080
fi
#end-selinux
