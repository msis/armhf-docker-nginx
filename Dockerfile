## based on the original work https://github.com/orchardup/docker-nginx and https://github.com/scaleway-community/scaleway-nginx
FROM scaleway/ubuntu:trusty
MAINTAINER Mohamed Saad IBN SEDDIK <ms.ibnseddik@gmail.com> (@msibnseddik)

# install packages
RUN apt-get update -qq \
    && apt-get -qq upgrade \
    && apt-get -qq install \
            nginx-full \
    && apt-get clean

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl
ADD default /etc/nginx/sites-available/default
ADD default-ssl /etc/nginx/sites-available/default-ssl

EXPOSE 80

CMD ["nginx"]

