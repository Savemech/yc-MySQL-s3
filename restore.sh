#!/usr/bin/env bash
set -ex
aws s3 cp s3://mysqlino-backuperino/$(aws --endpoint-url=https://storage.yandexcloud.net s3 ls  s3://mysqlino-backuperino/schemas/ --recursive | sort | tail -n 1 | awk '{print $4}') - | pbzip2 -d > fresh-schema.sql
aws s3 cp s3://mysqlino-backuperino/$(aws --endpoint-url=https://storage.yandexcloud.net s3 ls  s3://mysqlino-backuperino/data/ --recursive | sort | tail -n 1 | awk '{print $4}') - | pbzip2 -d > fresh-data.sql

mysql -e "drop database employees;"
mysql -e "DROP DATABASE IF EXISTS employees; \
CREATE DATABASE IF NOT EXISTS employees; \
USE employees;"
mysql -t <fresh-schema.sql
mysql -t <fresh-data.sql
