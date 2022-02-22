#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
    CREATE USER kong with password 'kong';
    CREATE DATABASE kong owner kong;
EOSQL

