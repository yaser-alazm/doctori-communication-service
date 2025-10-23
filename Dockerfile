FROM node:18-alpine

# Install OpenSSL for Prisma compatibility
RUN apk add --no-cache openssl

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies (including dev dependencies for hot reload)
RUN npm install

# Install NestJS CLI globally to ensure nest command is available
RUN npm install -g @nestjs/cli

# Copy source code
COPY . .

# Build the application to create the nest executable
RUN nest build

# Expose port
EXPOSE 4003

# Start in development mode with hot reload
CMD ["npm", "run", "start:dev"]
