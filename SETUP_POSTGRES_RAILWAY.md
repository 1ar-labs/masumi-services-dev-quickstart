# How to Add PostgreSQL to Railway

## Method 1: Via Railway Dashboard (Recommended)

1. Go to your Railway project dashboard
2. Click the **"+ New"** button
3. Select **"Database"**
4. Choose **"Add PostgreSQL"**
5. Wait for PostgreSQL to deploy (takes ~30 seconds)
6. Click on the PostgreSQL service
7. Go to the **"Variables"** tab
8. Copy the `DATABASE_URL` value
9. Go back to your app service
10. Click **"Variables"** tab
11. Add the PostgreSQL's `DATABASE_URL` to your app

## Method 2: Via Railway CLI

```bash
# Install Railway CLI if you haven't
npm install -g @railway/cli

# Login to Railway
railway login

# Link to your project
railway link

# Add PostgreSQL
railway add postgresql

# Get the database URL
railway variables
```

## After Adding PostgreSQL

Your app service needs these environment variables:

1. Click on your app service in Railway
2. Go to "Variables" tab
3. Add these:
   - `DATABASE_URL` - Copy from PostgreSQL service
   - `ADMIN_KEY` - Any secure string (e.g., `my-secure-admin-key-123`)
   - `BLOCKFROST_API_KEY_PREPROD` - Get free key from https://blockfrost.io
   - `SEED_ONLY_IF_EMPTY` - Set to `TRUE`

## Alternative: Use Railway Template

You can also use Railway's PostgreSQL template:
https://railway.app/template/postgres

Then connect it to your service by copying the DATABASE_URL.