# Multi-stage build for optimized production image
FROM node:20-alpine AS dependencies

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install all dependencies (including dev dependencies for build)
RUN npm ci

# Copy source code
COPY . .

# Build Next.js app
RUN npm run build

# Production stage
FROM node:20-alpine AS runtime

WORKDIR /app

# Set environment to production
ENV NODE_ENV=production

# Copy package files
COPY package*.json ./

# Copy dependencies from dependencies stage
COPY --from=dependencies /app/node_modules ./node_modules

# Copy built app from builder stage
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

# Expose port 3000
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
	CMD node -e "require('http').get('http://localhost:3000', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Start Next.js in production mode
CMD ["npm", "start"]
