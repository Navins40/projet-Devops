FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Installer Apache + outils
RUN apt-get update && \
    apt-get install -y apache2 net-tools iproute2 iputils-ping nano ssh && \
    apt-get clean

# Copier tous les fichiers du repo dans /var/www/html
COPY . /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
