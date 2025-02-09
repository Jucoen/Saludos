FROM php:8.3-apache
# Instala extensiones de PHP necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql
# Copia el código fuente de tu aplicación al contenedor
COPY . /var/www/html/
# Establece los permisos adecuados para el directorio de la aplicación
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
# Expone el puerto 80 para que Apache pueda recibir tráfico web
EXPOSE 80
# Comando para mantener el contenedor en ejecución mientras Apache funcione
CMD ["apache2-foreground"]

RUN apt-get update
RUN apt-get -y install apt-utils
#RUN apt-get -y libapache2-mod-php
RUN apt-get -y install nano
RUN apt-get -y install zip
RUN apt-get -y install unzip
RUN apt-get -y install git
RUN apt-get -y install curl
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') \
#    { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash \
    && apt-get update && apt-get install -y symfony-cli
#ENV APACHE_DOCUMENT_ROOT /www/html
#ENV APACHE_LOG_DIR /var/log/apache2
#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
RUN apt-get update
RUN apt-get -y install apt-utils
#RUN apt-get -y libapache2-mod-php
RUN apt-get -y install nano
RUN apt-get -y install zip
RUN apt-get -y install unzip
RUN apt-get -y install git
RUN apt-get -y install curl
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') \
#    { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash \
    && apt-get update && apt-get install -y symfony-cli
#ENV APACHE_DOCUMENT_ROOT /www/html
#ENV APACHE_LOG_DIR /var/log/apache2
#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
