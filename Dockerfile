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

ADD supervisor/supervisord.conf /etc/supervisord.conf
COPY docker-entrypoint.sh /usr/local/bin/

ENV BUNDLE_PATH /bundle

COPY app/Gemfile .
COPY app/Gemfile.lock .

ARG bundle_on_build
RUN if [ "$bundle_on_build" != "false" ]; then bundle install; fi

COPY ./app /app

EXPOSE 3000
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
