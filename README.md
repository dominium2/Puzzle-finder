# Puzzle-finder

A ChatGPT-style chat interface integrated with N8N workflow automation for processing messages and links.

## Stack

- **Web Interface** (Port 3000) - ChatGPT-style chat UI with CORS proxy
- **N8N** (Port 5678) - Workflow automation platform
- **MySQL** (Port 3306) - Optional database service for your workflows

## Quick Start

### 1. Start the Stack

```bash
docker compose up -d
```

### 2. Access the Applications

- **Chat Interface**: http://localhost:3000
- **N8N Dashboard**: http://localhost:5678 (Login: `admin@example.com` / `Admin@1234`)

### 3. Set Up N8N Workflow

1. Open N8N at http://localhost:5678
2. Import the test workflow: `test-workflow.json`
   - Click "..." menu → "Import from File"
   - Select `test-workflow.json`
3. **Activate** the workflow (toggle switch)
4. Click the Webhook node and copy the Production URL

### 4. Configure Chat Interface

1. Open http://localhost:3000
2. Click ⚙️ **Settings**
3. Paste the webhook URL (e.g., `http://localhost:5678/webhook/puzzle-finder`)
4. Click **Save**

### 5. Start Chatting

Send any message or link - it will be forwarded to N8N for processing!

## How It Works

1. User sends a message in the chat interface
2. The message is proxied through the Node.js server (avoiding CORS issues)
3. The server forwards it to the N8N webhook
4. N8N processes the data and responds
5. The response is displayed in the chat

## Stopping the Stack

```bash
docker compose down
```

To remove all data including volumes:

```bash
docker compose down -v
```

## Project Structure

```
.
├── docker-compose.yml      # Docker stack configuration
├── Dockerfile              # Web container image
├── server.js               # Node.js server with CORS proxy
├── index.html              # ChatGPT-style chat interface
├── package.json            # Node.js dependencies
├── test-workflow.json      # Sample N8N workflow
└── README.md              # This file
```

## Data Payload

Messages sent to N8N have this structure:

```json
{
  "message": "User's message or link",
  "timestamp": "2025-12-21T12:00:00.000Z",
  "source": "puzzle-finder-chat"
}
```

## Configuration

### N8N Credentials

Default credentials (change in `docker-compose.yml`):
- Username: `admin@example.com`
- Password: `Admin@1234`

### MySQL Configuration

- Database: `n8n_db`
- User: `n8n_user`
- Password: `n8n_password`
- Root Password: `rootpassword`

## Troubleshooting

**Chat shows "Failed to fetch":**
- Ensure the workflow is activated in N8N
- Use the Production URL, not Test URL
- Check that all containers are running: `docker compose ps`

**N8N not accessible:**
- Wait 10-15 seconds after starting for initialization
- Check logs: `docker logs n8n`

**Database connection issues:**
- Restart the stack: `docker compose restart`

For more configuration options, visit the [N8N documentation](https://docs.n8n.io/).