#!/bin/bash

sudo systemctl start postgresql

#The database initialization could be done using following command. 
#It creates the configuration files postgresql.conf and pg_hba.conf
#sudo postgresql-setup initdb

#The data are located at:
# /var/lib/pgsql/data
# /var/lib/pgsql/data-old

# sudo on as postgres role
#$ sudo -i -u postgres
#$ psql


# sudo on as postgres
#$ sudo -i -u postgres
#$ cd /var/lib/pgsql


### Setup authenication ###
#$ sudo -i -u postgres
#$ vim /var/lib/pgsql/data/pg_hba.conf
# ... //make changes
#$ pg_ctl reload


