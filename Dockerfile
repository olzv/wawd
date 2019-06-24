FROM ruby:2.6

RUN mkdir /app
WORKDIR /app

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

RUN gem install bundler

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . /app

EXPOSE 3000
CMD rails s -b 0.0.0.0
