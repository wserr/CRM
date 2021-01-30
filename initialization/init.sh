#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "crm" --dbname "crm" <<-EOSQL
    CREATE USER crmuser with password 'crm';
    CREATE DATABASE crm;
    GRANT ALL PRIVILEGES ON DATABASE crm TO crmuser;
EOSQL
