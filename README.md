# Puzzle Finder

An AI-powered, real-world scavenger hunt game set in Brussels. Players receive cryptic clues from an AI handler, travel to physical locations, and verify their discoveries using GPS coordinates or photo uploads analyzed by local AI vision models.

## Features

* **AI Handler ("Control"):** Interacts with players in character, generating cryptic riddles to guide them to their next target using local LLMs (llama2), strictly avoiding the exact location name.
* **Photo Verification:** Players can upload a photo of their location, which is analyzed by a local AI vision model (llava) to verify if it matches the target destination.
* **GPS Verification:** Calculates the Haversine distance between the player's transmitted coordinates and the target location, granting success if within a 100-meter radius.
* **Rich Database of Locations:** Seeded with 71 points of interest and hidden gems around Brussels (including Grand Place, Dudenpark in Forest, and secret spots like the Bois de la Cambre Secret Island).
* **Custom Authentication System:** Fully automated user registration, login, and session management (JWT-style) handled directly through N8N workflows.
* **Progress Tracking:** Saves game state and user progression persistently in a MySQL database.

## Architecture & Stack

* **Frontend (Port 3000):** A ChatGPT-style HTML/JS web interface wrapped in a Node.js server that acts as a CORS proxy for N8N webhooks.
* **Workflow Engine (Port 5678):** **N8N** orchestrates the backend logic, API endpoints, database queries, and AI prompts.
* **Database (Port 3306):** **MySQL 8.0** stores users, sessions, game progress, and the location database. Automatically seeded on startup.
* **Local AI Engine (Port 11434):** **Ollama** runs local open-source models for text generation and image recognition. An automated service pulls the required models on the first run.
* **Infrastructure:** Fully containerized using Docker and Docker Compose.

## Quick Start

## Project Structure

Top-level layout (both repositories should be siblings in the same parent folder):

```
Puzzle-finder/                # this repository (backend + workflows)
  docker-compose.yml
  Dockerfile
  server.js
  index.html
  package.json
  flows/
  db-init.sql
  places-seeder.js
  README.md

puzzlefinder-frontend/        # frontend repository (must be cloned as a sibling)
  public/
  src/
  package.json
  Dockerfile
```

Important: The frontend repository `puzzlefinder-frontend` must be cloned into the same parent folder as this repository so that Docker Compose can build and run both services together. Example:

```bash
# from the parent directory where you want both repos
git clone https://github.com/JDW-ehb/puzzlefinder-frontend.git
```

You can use your fork or a local copy; ensure the folder name is `puzzlefinder-frontend`.

### 1. Start the Stack

```bash
docker compose up -d
```

Note: On the very first run, an initialization container (`ollama-pull-models`) will automatically start downloading the required AI models (`llama2` and `llava`) in the background. This may take a few minutes depending on your internet connection. You can check the progress by running `docker logs -f ollama-pull-models`.

### 2. Access the Applications

- Chat Interface: http://localhost:3000

- N8N Dashboard: http://localhost:5678

- Default Login: admin@local.test

- Default Password: admin

### 3. Set Up N8N Workflows

The backend logic is entirely driven by N8N. You must import the workflows to make the game function:

1. Open N8N at http://localhost:5678

2. Go to Credentials and set up your MySQL connection using the details from your `docker-compose.yml`:

  - Database: n8n_db
  - User: n8n_user
  - Password: n8n_password

3. Go to Workflows → Click "Add Workflow" → Select "Import from File" from the ... menu.

4. Import all workflows located in the `flows` directory:

  - PuzzleFinder - Auth Register.json
  - PuzzleFinder - Auth Login.json
  - PuzzleFinder - Auth Me.json
  - PuzzleFinder - Game State.json
  - PuzzleFinder - Game Locations.json
  - PuzzleFinder - Game Progress.json
  - Puzzle Finder - Test Webhook.json (GPS/Text Handler)
  - PuzzleFinder - Verify Photo.json (AI Vision Verification)

5. Activate all imported workflows using the toggle switch in the top right corner.

### 4. Configure the Frontend

1. Open the web interface at http://localhost:3000

2. Click ⚙️ Settings

3. Paste your primary N8N webhook URL (e.g., http://localhost:5678/webhook/game-state-webhook-001 or your specific entry point).

4. Click Save and start interacting with Control!

## Database Structure

The MySQL database is automatically initialized and seeded via `db-init.sql` and `places-seeder.js`.

- `users`: Stores player accounts (name, email, hashed password).
- `sessions`: Manages active login tokens for N8N webhook authentication.
- `Locations`: The master list of 71 playable areas in Brussels, including coordinates, hints, and difficulty levels.
- `user_progress`: Tracks the current location step of each user ID.

## Stopping the Stack

To gracefully stop the containers:

```bash
docker compose down
```

To completely wipe all data (including the database, N8N configurations, and downloaded AI models), remove the volumes:

```bash
docker compose down -v
```

## Troubleshooting

Frontend shows "Failed to fetch" or CORS errors: Ensure your N8N workflows are set to Active and the Webhook nodes have Options -> Allowed Origins set to *.

AI is not responding: Ensure the models have finished downloading. You can verify this by checking `docker logs ollama-pull-models`. If you are running out of memory, check the memory limits in your `docker-compose.yml` for the Ollama container.

Database missing locations: Check the logs of the db-seed container (`docker logs db-seed`). It ensures the Locations table is populated dynamically when the MySQL instance is ready.