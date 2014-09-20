# Dockerfile postgres postgis

Just an image with postgres and postgis

## Run it

```shell
docker run -rm \
           -v /tmp/data:/data \
           -d \
           -p 5432:5432 \
           -e POSTGRESQL_DB="dbname" \
           -e POSTGRESQL_USER="myuser" \
           -e POSTGRESQL_PASS="mypwd" \
           -t wdalmut/postgres-postgis:9.3
```

In order to connect

```shell
psql -h 127.0.0.1 -p 5432 -U myuser -W
```

