# yc-mysql-s3

Simple backup for small MySQL instances, tested with
```
ii  libdbd-mysql-perl:amd64              4.050-3                           amd64        Perl5 database interface to the MariaDB/MySQL database
ii  libmysqlclient21:amd64               8.0.22-0ubuntu0.20.04.3           amd64        MySQL database client library
ii  mysql-client-8.0                     8.0.22-0ubuntu0.20.04.3           amd64        MySQL database client binaries
ii  mysql-client-core-8.0                8.0.22-0ubuntu0.20.04.3           amd64        MySQL database core client binaries
ii  mysql-common                         5.8+1.0.5ubuntu2                  all          MySQL database common files, e.g. /etc/mysql/my.cnf
ii  mysql-server                         8.0.22-0ubuntu0.20.04.3           all          MySQL database server (metapackage depending on the latest version)
ii  mysql-server-8.0                     8.0.22-0ubuntu0.20.04.3           amd64        MySQL database server binaries and system database setup
ii  mysql-server-core-8.0                8.0.22-0ubuntu0.20.04.3           amd64        MySQL database server binaries
```

# There are some caveats
- s3 cp does not able to handle while piping files large than 5GB
- Better use WAL-G for production environments
- There is no cron/scheduling included, you may use it as sidecar for your MySQL in K8s




init database at first time:
```
$ cd test-db
$ mysql -t <employees.sql
```
