# Docker Setup Guide

This project includes Docker support for both development and production environments.

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) installed
- Docker Compose installed (comes with Docker Desktop)

## Files Explained

| File                     | Purpose                                        |
| ------------------------ | ---------------------------------------------- |
| `Dockerfile`             | Production-optimized multi-stage build         |
| `Dockerfile.dev`         | Development image with hot reload              |
| `docker-compose.yml`     | Production configuration (with optional Nginx) |
| `docker-compose.dev.yml` | Development configuration                      |
| `nginx.conf`             | Nginx reverse proxy configuration              |
| `.dockerignore`          | Files to exclude from Docker image             |

## Quick Start

### Development Mode (Hot Reload)

```bash
# Start development container
docker-compose -f docker-compose.dev.yml up

# Or in detached mode
docker-compose -f docker-compose.dev.yml up -d

# View logs
docker-compose -f docker-compose.dev.yml logs -f

# Stop containers
docker-compose -f docker-compose.dev.yml down
```

Access the app at: [http://localhost:3000](http://localhost:3000)

Changes to your code will automatically reload!

### Production Mode

```bash
# Build and start production container
docker-compose up

# Or in detached mode
docker-compose up -d

# View logs
docker-compose logs -f

# Stop containers
docker-compose down
```

Access the app at: [http://localhost:3000](http://localhost:3000)

## Production with Nginx Reverse Proxy

Nginx adds performance and load balancing:

```bash
# Start with Nginx (production profile)
docker-compose --profile production up -d

# Access through Nginx
# http://localhost:80
```

## Manual Docker Commands

### Build Image

```bash
# Production image
docker build -t nextjs-boilerplate:latest .

# Development image
docker build -t nextjs-boilerplate:dev -f Dockerfile.dev .
```

### Run Container

```bash
# Production
docker run -p 3000:3000 \
  -e NODE_ENV=production \
  -e NEXT_PUBLIC_API_URL=http://localhost:3000 \
  nextjs-boilerplate:latest

# Development
docker run -p 3000:3000 \
  -v "$(pwd):/app" \
  -v /app/node_modules \
  -e NODE_ENV=development \
  nextjs-boilerplate:dev
```

## Useful Commands

```bash
# See running containers
docker ps

# See all containers
docker ps -a

# View container logs
docker logs <container-id>

# Follow logs in real-time
docker logs -f <container-id>

# Execute command in running container
docker exec -it <container-id> /bin/sh

# Remove container
docker rm <container-id>

# Remove image
docker rmi <image-id>

# Clean up unused resources
docker system prune
```

## Environment Variables

Create `.env.local` for local variables:

```env
NODE_ENV=production
NEXT_PUBLIC_API_URL=http://localhost:3000
# Add other variables as needed
```

Docker will load this file automatically.

## Multi-Stage Build Explanation

The production `Dockerfile` uses 3 stages:

1. **dependencies** - Install production dependencies only
2. **builder** - Install all deps + build Next.js app
3. **runtime** - Copy built app + run (minimal size)

This approach:

- ✅ Reduces final image size (smaller)
- ✅ Improves security (dev deps excluded)
- ✅ Faster deployments (smaller download)

## Health Checks

Both configurations include health checks:

```bash
# Check container health
docker ps

# Should show: (healthy) or (starting) or (unhealthy)
```

## Docker Compose Services

**Production:**

- `app` - Next.js application (port 3000)
- `nginx` - Reverse proxy (port 80) - optional profile

**Development:**

- `app` - Next.js dev server with hot reload (port 3000)

## Troubleshooting

### Port already in use

```bash
# Find process on port 3000
lsof -i :3000

# Kill process
kill -9 <PID>
```

### Container won't start

```bash
# Check logs
docker-compose logs app

# Rebuild without cache
docker-compose build --no-cache
docker-compose up
```

### Hot reload not working in development

```bash
# Ensure volume is mounted correctly
docker-compose -f docker-compose.dev.yml exec app ls -la /app

# Restart container
docker-compose -f docker-compose.dev.yml restart app
```

### Need to install new package in development

```bash
# Install and restart
docker-compose -f docker-compose.dev.yml exec app npm install package-name
docker-compose -f docker-compose.dev.yml restart app
```

## Production Checklist

- [ ] Update `NEXT_PUBLIC_API_URL` in environment
- [ ] Configure secrets in `.env.local` (not committed)
- [ ] Test image locally: `docker build -t app . && docker run -p 3000:3000 app`
- [ ] Push to registry: `docker push your-registry/app:latest`
- [ ] Deploy to hosting (AWS, GCP, Azure, etc.)

## Performance Tips

1. **Use Alpine images** - Already configured (smaller size)
2. **Multi-stage builds** - Already configured (optimized)
3. **Cache dependencies** - Already configured (.dockerignore)
4. **Nginx caching** - Already configured (optional)

---

Happy containerizing! 🐳
