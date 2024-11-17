#! /bin/bash
set -e

if [ -z "$1" ]; then
  echo "Error: Database URL is required"
  echo "Usage: $0 <database-url>"
  exit 1
fi

NEW_DB_URL=$1

psql \
  --single-transaction \
  --variable ON_ERROR_STOP=1 \
  --file roles.sql \
  --file schema.sql \
  --command 'SET session_replication_role = replica' \
  --file data.sql \
  --dbname "$NEW_DB_URL"