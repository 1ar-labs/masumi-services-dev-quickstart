#!/bin/sh

# exit on error
set -e

echo "Starting Masumi Registry Service v2..."

# check if DATABASE_URL is set
if [ -z "$DATABASE_URL" ]; then
    echo "ERROR: DATABASE_URL environment variable is not set!"
    echo "Please add a PostgreSQL database to your Railway project and set the DATABASE_URL variable."
    exit 1
fi

# check other required variables
if [ -z "$ADMIN_KEY" ]; then
    echo "ERROR: ADMIN_KEY environment variable is not set!"
    echo "Please set ADMIN_KEY to a secure random string."
    exit 1
fi

if [ -z "$BLOCKFROST_API_KEY_PREPROD" ]; then
    echo "ERROR: BLOCKFROST_API_KEY_PREPROD environment variable is not set!"
    echo "Please get an API key from https://blockfrost.io and set it."
    exit 1
fi

echo "Environment variables verified."
echo "Running database migrations..."

# run migrations - if database is not empty, push schema instead
echo "Checking database state..."
if npm run prisma:migrate 2>&1 | grep -q "P3005"; then
    echo "Database already has tables. Pushing schema instead of running migrations..."
    npx prisma db push --skip-seed --accept-data-loss
    echo "Schema push completed."
else
    echo "Running migrations..."
    npm run prisma:migrate
    echo "Migrations completed successfully."
fi

# seed database
echo "Seeding database..."
npm run prisma:seed || echo "Seeding failed or already seeded."

# start the service
echo "Starting service..."
npm start