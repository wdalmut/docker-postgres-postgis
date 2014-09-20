FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget
RUN echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list
RUN wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-9.3-postgis-2.1 postgresql-contrib

ADD run /bin/run
RUN chmod +x /bin/run

RUN sed -i -e"s/data_directory =.*$/data_directory = '\/data'/" /etc/postgresql/9.3/main/postgresql.conf
RUN echo "host    all    all    0.0.0.0/0    md5" >> /etc/postgresql/9.3/main/pg_hba.conf

VOLUME ["/data"]
EXPOSE 5432

CMD ["/bin/run"]

