# Puzzle-finder

## N8N Workflow Automation

This repository includes a Docker Compose configuration for running N8N, an open-source workflow automation tool.

### Prerequisites

- Docker
- Docker Compose

### Getting Started

1. Clone this repository
2. Navigate to the project directory
3. Start N8N using Docker Compose:

```bash
docker-compose up -d
```

4. Access N8N at http://localhost:5678

Default credentials:
- Username: `admin@admin.be`
- Password: `Password1`

**Important:** Change these credentials in production by modifying the environment variables in `docker-compose.yml`.

### Stopping N8N

To stop the N8N service:

```bash
docker-compose down
```

To stop and remove all data (including workflows):

```bash
docker-compose down -v
```

### Configuration

The N8N service is configured with:
- Port 5678 exposed for web interface
- Persistent data storage via Docker volume
- Basic authentication enabled (change credentials in docker-compose.yml)

For more configuration options, visit the [N8N documentation](https://docs.n8n.io/).