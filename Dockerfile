FROM php:8.1-fpm

# Install Nginx and Supervisor
RUN apt-get update && apt-get install -y nginx supervisor curl

# Copy PHP app files only
COPY php-app/ /var/www/html/

# Nginx config
COPY default.conf /etc/nginx/sites-available/default

# Supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
