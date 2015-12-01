armhf-docker-nginx
===================

A simple Nginx image for Docker to serve static websites from an ARMHF (armv7, etc.). It will serve anything in the directory `/var/www`.
It is based on the original work of [orchardup](https://github.com/orchardup/docker-nginx) and [the Scaleway Community](https://github.com/scaleway-community/scaleway-nginx).

You'll need to use a `Dockerfile` to build an image with your site in it. For example, if your site is in a directory called `src/`, you could create this `Dockerfile`:

    FROM msis/armhf-docker-nginx
    ADD public/ /var/www
    CMD 'nginx'

Then build and run it:

    $ docker build -t mysite .
    ...
    Successfully built ************
    $ docker run -p 80:80 -d mysite
    ************
    $ curl localhost
    ...

SSL
---

To use SSL, put your certs in `/etc/nginx/ssl` and enable the `default-ssl` site:

    ADD server.crt /etc/nginx/ssl/
    ADD server.key /etc/nginx/ssl/
    RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/default-ssl


