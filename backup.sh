#!/usr/bin/env bash -ex
time nice -n 19 ionice -c2 -n7 nice -n19 mysqldump employees | nice -n 19 ionice -c2 -n7 nice -n19 pbzip2 --best | nice -n 19 ionice -c2 -n7 nice -n19 aws --endpoint-url=https://storage.yandexcloud.net s3 cp - s3://mysqlino-backuperino/data/data-"$(date +"%Y-%m-%dT%H-%M-%SZ")".sql.bz2
time nice -n 19 ionice -c2 -n7 nice -n19 mysqldump --no-data  employees | nice -n 19 ionice -c2 -n7 nice -n19 pbzip2 --best | nice -n 19 ionice -c2 -n7 nice -n19 aws --endpoint-url=https://storage.yandexcloud.net s3 cp - s3://mysqlino-backuperino/schemas/scheme-"$(date +"%Y-%m-%dT%H-%M-%SZ")".sql.bz2





