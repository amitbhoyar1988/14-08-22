FROM httpd
#RUN apt-get install vim -y
RUN apt-get update -y
COPY index.html /usr/local/apache2/htdocs/
EXPOSE 80
