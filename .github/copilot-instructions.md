# GitHub Copilot Configuration for terraform-provider-smartprompt

## Project Context
This repository is part of the tf-smart-prompt project.

## Technology Stack

### Infrastructure Tools
- terraform
- terraform-provider
- gcp
- deployment
- infrastructure

## Service Architecture

The project consists of several interconnected services:
1. FastAPI Service - Main API for prompt refinement
2. Redis - For caching and rate limiting
3. Elasticsearch - For advanced prompt search and storage
4. Terraform Provider - Infrastructure integration
5. Client Library - For programmatic access

## Development Environment Setup

### Prerequisites
- Docker Desktop with Compose V2
- Python 3.8+
- Go 1.19+
- OpenAI API key
- GCP credentials (for deployment)

### Local Development
1. Environment Setup:
```
export OPENAI_API_KEY=your_key_here
```

2. Starting Services:
- Use `docker compose` (not docker-compose) for all commands
- Services must be started in this order:
  1. Redis
  2. Elasticsearch
  3. API

3. Health Checks:
- Redis: http://localhost:6379 (use redis-cli ping)
- Elasticsearch: http://localhost:9200/_cluster/health
- API: http://localhost:8000/health

### Startup Sequence
1. First Time Setup:
```bash
# Clean any existing containers
docker compose down -v

# Start fresh
docker compose up -d redis
# Wait for redis health check to pass
docker compose up -d elasticsearch
# Wait for elasticsearch health check to pass
docker compose up -d api
```

2. Verification Steps:
- Check Redis: `docker compose exec redis redis-cli ping`
- Check Elasticsearch: `curl http://localhost:9200/_cluster/health`
- Check API: `curl http://localhost:8000/health`

3. Common Issues and Solutions:
- If Elasticsearch fails with memory errors:
  1. Stop all containers
  2. Increase Docker memory limit to at least 4GB
  3. Reset Elasticsearch volume: `docker compose down -v`
  4. Start services again
- If Redis shows connection refused:
  1. Check if Redis container is running
  2. Verify port 6379 is not in use
  3. Try restarting the Redis container
- If API fails to start:
  1. Check both Redis and Elasticsearch are healthy
  2. Verify OPENAI_API_KEY is set
  3. Check logs: `docker compose logs api`

### Service States

Always check these states when starting development:

1. Redis Status:
- Should be running on port 6379
- Health check should pass
- Memory usage should be stable

2. Elasticsearch Status:
- Should be running on port 9200
- Cluster health should be green
- Memory usage should be under allocated limit

3. API Status:
- Should be running on port 8000
- All dependencies should be healthy
- OpenAPI docs should be accessible

### Development Workflow

1. Making Changes:
- API changes will auto-reload with --reload flag
- Frontend changes require manual restart
- Database schema changes need migration

2. Testing:
- Use test-specific docker-compose file for integration tests:
  `docker compose -f docker-compose.test.yml up`
- Test containers use different ports to avoid conflicts:
  - Redis Test: 6380
  - Elasticsearch Test: 9201
  - API Test: Random port

### Debugging Tips

1. Service Logs:
```bash
# View all logs
docker compose logs

# View specific service logs
docker compose logs redis
docker compose logs elasticsearch
docker compose logs api

# Follow logs in real-time
docker compose logs -f api
```

2. Container Status:
```bash
# Check all services
docker compose ps

# Check specific service
docker compose ps redis
```

3. Resource Usage:
```bash
# Monitor container stats
docker stats
```

### Clean Reset Procedure

If you need to completely reset the environment:

1. Stop all services:
```bash
docker compose down
```

2. Remove volumes:
```bash
docker compose down -v
```

3. Clean Docker system:
```bash
docker system prune -f
```

4. Restart services in order:
```bash
docker compose up -d redis
docker compose up -d elasticsearch
docker compose up -d api
```

## Custom Instructions
Follow project coding standards and best practices.

## Important Notes
- All code suggestions must work without GitHub Pro features
- Follow project coding standards and conventions
- Consider security best practices
- Ensure proper error handling
- Add appropriate documentation