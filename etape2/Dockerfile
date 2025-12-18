FROM php:8.2-fpm

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install mysqli

# Vérifier l'installation
RUN php -m | grep mysqli

CMD ["php-fpm"]

