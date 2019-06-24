#!/bin/bash
set -e

# Ensure local DB is created if external DB is not provided
if [ -z "$DATABASE_URL" ]; then
    rails db:create
fi

rails db:migrate:status
rails db:migrate

exec "$@"
