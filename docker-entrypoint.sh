#!/bin/bash
set -e

bundle check || bundle install

chmod -R a+rwX $BUNDLE_PATH

# Ensure local DB is created if external DB is not provided
if [ -z "$DATABASE_URL" ]; then
    bundle exec rails db:create
fi

bundle exec rails db:migrate

exec "$@"
