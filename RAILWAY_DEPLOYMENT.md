# Railway Deployment Guide

This Docker Compose setup needs to be split into individual services for Railway deployment.

## Services to Deploy

1. **PostgreSQL Database (Registry)** - Use Railway's PostgreSQL template
2. **PostgreSQL Database (Payment)** - Use Railway's PostgreSQL template  
3. **Registry Service** - Deploy using this repo
4. **Payment Service** - Deploy using separate repo/instance

## Deployment Steps

### 1. Deploy PostgreSQL Databases
- Create two PostgreSQL instances on Railway
- Note down the `DATABASE_URL` for each

### 2. Deploy Registry Service
- Fork this repo for registry service
- Update `Dockerfile` to use registry image (already set)
- Set environment variables:
  - `DATABASE_URL` - From PostgreSQL (Registry)
  - `ADMIN_KEY` - Generate a secure key
  - `BLOCKFROST_API_KEY_PREPROD` - Your Blockfrost API key
  - `SEED_ONLY_IF_EMPTY` - TRUE
  - `PORT` - 3000

### 3. Deploy Payment Service
- Create another repo/branch for payment service
- Update `Dockerfile` to use payment image:
  ```dockerfile
  FROM ghcr.io/masumi-network/masumi-payment-service:0.18.0
  ```
- Change port to 3001 in Dockerfile
- Set environment variables:
  - `DATABASE_URL` - From PostgreSQL (Payment)
  - `ENCRYPTION_KEY` - Generate a secure key
  - `ADMIN_KEY` - Same as registry service
  - `BLOCKFROST_API_KEY_PREPROD` - Your Blockfrost API key
  - `SEED_ONLY_IF_EMPTY` - TRUE
  - `PORT` - 3001

## Alternative: Single Service Deployment

If you want to test with just one service, the current Dockerfile is set up for the registry service. Just:

1. Create a PostgreSQL database on Railway
2. Deploy this repo
3. Set the required environment variables listed above