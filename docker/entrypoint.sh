#!/bin/bash
set -e

echo "Creating database"
rails db:create db:migrate

exec "$@"
