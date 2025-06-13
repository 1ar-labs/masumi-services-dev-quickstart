# Fully Automated Railway Deployment

This repository is now configured for **fully automatic deployment** on Railway with zero manual setup required.

## 🚀 One-Click Deploy

### Option 1: Deploy on Railway Button (Recommended)

Click this button to automatically deploy the entire Masumi stack:

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template?template=https://github.com/1ar-labs/masumi-services-dev-quickstart)

### Option 2: Template URL

Use this template URL in Railway:
```
https://railway.com/new/template?template=https://github.com/1ar-labs/masumi-services-dev-quickstart
```

## What Gets Deployed Automatically

When you click the deploy button, Railway will automatically provision:

### 🗄️ Databases
- **PostgreSQL (Registry)** - For registry service data
- **PostgreSQL (Payment)** - For payment service data

### 🚀 Services
- **Masumi Registry Service** - Port 3000
- **Masumi Payment Service** - Port 3001

### 🔐 Environment Variables
- **Auto-generated secure keys** for ADMIN_KEY and ENCRYPTION_KEY
- **Auto-connected database URLs** between services and databases
- **Prompted for Blockfrost API key** (get free at https://blockfrost.io)

### ✅ Health Checks
- Automatic health monitoring on `/api/v1/health`
- Restart policies on failure
- Proper dependency management

## Required Input

The only thing you need to provide during deployment:
- **Blockfrost Preprod API Key** - Get one free at https://blockfrost.io

## Post-Deployment

After deployment completes:
1. **Registry Service** will be available at `https://your-registry-url.railway.app`
2. **Payment Service** will be available at `https://your-payment-url.railway.app`
3. Both services will have their databases automatically migrated and seeded
4. Health checks will confirm everything is running

## API Endpoints

### Registry Service
- Health: `GET /api/v1/health`
- Full API documentation: Available at the deployed URL

### Payment Service  
- Health: `GET /api/v1/health`
- Full API documentation: Available at the deployed URL

## Manual Alternative

If you prefer manual setup, you can still:
1. Fork this repository
2. Connect it to Railway
3. Add the PostgreSQL databases manually
4. Set environment variables manually

But the template above is much easier! 🎉

## Development

For local development, see the original README.md or use the Docker Compose setup:
```bash
docker-compose up -d
```