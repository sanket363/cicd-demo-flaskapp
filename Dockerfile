FROM python:3.8

# Install Apache HTTP Server
RUN apt-get update && apt-get install -y apache2 libapache2-mod-wsgi-py3

# Enable required Apache modules
RUN a2enmod rewrite && a2enmod headers && a2enmod proxy && a2enmod proxy_http

# Create a directory for the Flask app
WORKDIR /var/www/html/flask_app

# Copy the Flask app files into the container
COPY . /var/www/html/flask_app

# Install Flask and other dependencies
RUN pip install flask

# Configure Apache to serve the Flask app
COPY apache-flask.conf /etc/apache2/sites-available/flask.conf
RUN a2ensite flask

# Expose port 80 to make the app accessible
EXPOSE 80

# Start Apache HTTP Server
CMD ["apachectl", "-D", "FOREGROUND"]

