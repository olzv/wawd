FROM ruby:2.6

RUN mkdir /app
WORKDIR /app

# Install Supervisor
RUN apt-get update && \
    apt-get install -y supervisor

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

ENV BUNDLE_PATH /bundle

ADD supervisor/supervisord.conf /etc/supervisord.conf
COPY docker-entrypoint.sh /usr/local/bin/

COPY ./app /app

EXPOSE 3000
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
