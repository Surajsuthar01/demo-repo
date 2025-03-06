FROM httpd

# Copy the application files to the Nginx web root
COPY index.html /usr/local/apache2/htdocs

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
