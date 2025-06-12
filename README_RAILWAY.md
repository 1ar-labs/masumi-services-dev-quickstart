# Railway Setup Instructions

## Prerequisites

1. **Create PostgreSQL Database on Railway**
   - Go to your Railway project
   - Click "New" → "Database" → "Add PostgreSQL"
   - Wait for it to deploy
   - Copy the `DATABASE_URL` from the Variables tab

## Required Environment Variables

Add these in Railway's Variables tab for your service:

```bash
# From your PostgreSQL instance
DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@YOUR_HOST.railway.app:PORT/railway

# Generate a secure admin key
ADMIN_KEY=your-secure-admin-key-here

# Get from https://blockfrost.io (free tier available)
BLOCKFROST_API_KEY_PREPROD=your-blockfrost-api-key

# Keep this as TRUE for initial setup
SEED_ONLY_IF_EMPTY=TRUE

# Port (Railway usually auto-detects this)
PORT=3000
```

## Quick Setup

1. Deploy PostgreSQL first
2. Copy its DATABASE_URL
3. Deploy this service
4. Add all environment variables
5. Redeploy if needed

The service will automatically run migrations and seed data on first start.