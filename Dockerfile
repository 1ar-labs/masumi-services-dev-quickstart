# use the registry service as default
FROM ghcr.io/masumi-network/masumi-registry-service:0.20.0

# install curl for healthcheck
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# railway will provide DATABASE_URL and other env vars
EXPOSE 3000

# run migrations and start the service
CMD ["sh", "-c", "npm run prisma:migrate && npm run prisma:seed && npm start"]