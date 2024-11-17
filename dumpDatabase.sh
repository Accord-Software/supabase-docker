#! /bin/bash
set -e

if [ -z "$1" ]; then
  echo "Error: Database URL is required"
  echo "Usage: $0 <database-url>"
  exit 1
fi

OLD_DB_URL=$1

supabase db dump --db-url "$OLD_DB_URL" -f ./database/roles.sql --role-only
supabase db dump --db-url "$OLD_DB_URL" -f ./database/schema.sql
supabase db dump --db-url "$OLD_DB_URL" -f ./database/data.sql --use-copy --data-only
