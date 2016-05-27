FROM kartoza/postgis:9.3
MAINTAINER tim@kartoza.com

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get -y update
RUN apt-get -y install ca-certificates rpl pwgen

RUN apt-get install -y postgresql-client-9.5
ADD backups-cron /etc/cron.d/backups-cron
RUN touch /var/log/cron.log
ADD backups.sh /backups.sh
ADD start.sh /start.sh

CMD ["/start.sh"]
