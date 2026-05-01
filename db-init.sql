CREATE DATABASE IF NOT EXISTS n8n_db;
USE n8n_db;

CREATE TABLE IF NOT EXISTS missions (
  step_number INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  lat DECIMAL(10, 8) NOT NULL,
  lng DECIMAL(11, 8) NOT NULL,
  base_clue TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS user_progress (
  userId VARCHAR(50) PRIMARY KEY,
  currentStep INT NOT NULL DEFAULT 0
);

INSERT IGNORE INTO missions (step_number, name, lat, lng, base_clue) VALUES
  (0, 'Grand Place', 50.8467, 4.3524, 'A central square paved with cobblestones, surrounded by gilded guildhalls and a towering city hall.'),
  (1, 'Manneken Pis', 50.8450, 4.3500, 'A small, famous bronze fountain of a rebellious boy at a street corner.'),
  (2, 'Atomium', 50.8949, 4.3415, 'A massive structure built for the 1958 World Expo, consisting of nine giant silver spheres connected by tubes.');