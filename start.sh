#!/bin/sh

# exit on error
set -e

echo "Starting Masumi Registry Service..."

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

# run migrations with retries
RETRY_COUNT=0
MAX_RETRIES=5

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    if npm run prisma:migrate; then
        echo "Migrations completed successfully."
        break
    else
        RETRY_COUNT=$((RETRY_COUNT + 1))
        echo "Migration failed. Retry $RETRY_COUNT of $MAX_RETRIES..."
        sleep 5
    fi
done

if [ $RETRY_COUNT -eq $MAX_RETRIES ]; then
    echo "ERROR: Failed to run migrations after $MAX_RETRIES attempts."
    exit 1
fi

# seed database
echo "Seeding database..."
npm run prisma:seed || echo "Seeding failed or already seeded."

# start the service
echo "Starting service..."
npm start