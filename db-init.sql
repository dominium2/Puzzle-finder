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
  userId INT PRIMARY KEY,
  currentStep INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userId INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Locations (
  locationID INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  latitude DECIMAL(10,8),
  longitude DECIMAL(11,8),
  difficulty_level INT,
  hints TEXT,
  puzzle_text TEXT,
  next_location_id INT,
  is_active BOOLEAN DEFAULT TRUE,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT IGNORE INTO missions (step_number, name, lat, lng, base_clue) VALUES
  (0, 'Grand Place', 50.8467, 4.3524, 'A central square paved with cobblestones, surrounded by gilded guildhalls and a towering city hall.'),
  (1, 'Manneken Pis', 50.8450, 4.3500, 'A small, famous bronze fountain of a rebellious boy at a street corner.'),
  (2, 'Atomium', 50.8949, 4.3415, 'A massive structure built for the 1958 World Expo, consisting of nine giant silver spheres connected by tubes.');

-- Populate Locations from places-seeder.js
INSERT IGNORE INTO Locations (locationID, name, description, latitude, longitude, difficulty_level, hints, puzzle_text, next_location_id, is_active, createdAt, updatedAt) VALUES
  (1, 'Grote Markt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (2, 'Galeries Royales Saint-Hubert', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (3, 'Manneken Pis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (4, 'Mont des Arts / Kunstberg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (5, 'Triomfboog van het Jubelpark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (6, 'Parc du Cinquantenaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (7, 'Koninklijke Musea voor Schone Kunsten', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (8, 'Koninklijk Paleis van Brussel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (9, 'Warandepark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (10, 'Belgisch Parlement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (11, 'Black Tower (Zwarte Toren)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (12, 'Kunstberg-trappen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (13, 'Dudenpark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (14, 'Basiliek van Koekelberg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (15, 'Park Thurn & Taxis Bridge View', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (16, 'Kruidtuin (Le Botanique)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (17, 'Bois de la Cambre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (18, 'Chalet Robinson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (19, 'Jardin du Maelbeek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (20, 'Place du Jeu de Balle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (21, 'Rue des Bouchers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (22, 'Rue du Marché aux Fromages', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (23, 'Villa Empain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (24, 'Koninklijke Serres van Laeken', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (25, 'Japanese Tower', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (26, 'Monument to the Dynasty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (27, 'Hallepoort', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (28, 'Poelaertplein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (29, 'Wiels Rooftop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (30, 'Het Goudblommeke in Papier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (31, 'À la Mort Subite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (32, 'Le Cirio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (33, 'Au Derby', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (34, '’t Spinnekopke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (35, 'Les Brigittines', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (36, 'Bouillon Bruxelles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (37, 'Belga Queen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (38, 'Vossenstraat Steegjes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (39, 'Horta Gallery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (40, 'Place du Petit Sablon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (41, 'Place du Grand Sablon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (42, 'MIM Terras', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (43, 'Jubelpark Arcade Rooftop View', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (44, 'Metrostation Pannenhuis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (45, 'Begraafplaats van Elsene', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (46, 'Serres van Botanique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (47, 'Park van Vorst', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (48, 'Lambermont-boulevard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (49, 'Jupiter Panorama', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (50, 'Scheutbospark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (51, 'Puppet Theatre Toone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (52, 'Le Cercueil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (53, 'Cemetery Dieweg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (54, 'Musée des Arbalétriers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (55, 'Jardin du Fleuriste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (56, 'Cemetery of Brussels (Evere)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (57, 'Kauwberg Nature Reserve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (58, 'Bois de la Cambre Secret Island', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (59, 'Fin-de-Siècle Museum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (60, 'Sewer Museum (Musée des Égouts)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (61, 'Cantillon Brewery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (62, 'Le Phare du Kanaal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (63, 'Zinneke Pis (Pissing Dog)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (64, 'Windmill of Lindekemale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (65, 'Abandoned Tower of Laeken', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (66, 'Cité Hellemans', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (67, 'Van Buuren Museum Courtyard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (68, 'Église Sainte-Marie Madeleine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (69, 'La Maison van Dyck', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (70, 'La Maison de La Bellone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW()),
  (71, 'La Fontaine des Aveugles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NOW(), NOW());