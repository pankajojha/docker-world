FROM mysql:5.6
RUN usermod -u 1000 mysql
RUN usermod -G staff mysql

# Create data directory
RUN mkdir -p /data /var/lib/mysql /install
RUN chmod -R 777 /data /var/lib/mysql /install /install
RUN chown -R root:root /data /var/lib/mysql /install

# Create /data volume
VOLUME /data
VOLUME /var/lib/mysql

ADD https://github.com/DbMaintain/dbmaintain/releases/download/v2.6.0/dbmaintain-2.6.0.tar.gz  /install/dbmaintain.tar.gz

#RUN dpkg --configure -a
RUN apt-get update -y --fix-missing && apt-get install -y alien debhelper build-essential openjdk-7-jre tar
RUN tar -zxvf /install/dbmaintain.tar.gz

ADD ./config .



RUN chown mysql /var/run/mysqld
EXPOSE 3306
