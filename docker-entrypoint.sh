#!/bin/bash
set -e

rails db:create
rails db:migrate:status
rails db:migrate

exec "$@"
