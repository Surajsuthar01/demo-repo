# Use the official httpd image as the base image
FROM httpd:2.4

# Copy the index.html file to the Apache document root
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["httpd-foreground"]
