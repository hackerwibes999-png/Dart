FROM alpine:latest

# Install Tor, Nginx, and Supervisor
RUN apk add --no-cache tor nginx supervisor

# Copy the website files (bot will overwrite these)
COPY ./var/www/mysite /var/www/mysite

# Copy config files
COPY torrc /etc/tor/torrc
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080

# Start both Nginx and Tor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
