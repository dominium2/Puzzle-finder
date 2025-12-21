"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    const rawPlaces = [
      "Grote Markt",
      "Galeries Royales Saint-Hubert",
      "Manneken Pis",
      "Mont des Arts / Kunstberg",
      "Triomfboog van het Jubelpark",
      "Parc du Cinquantenaire",
      "Koninklijke Musea voor Schone Kunsten",
      "Koninklijk Paleis van Brussel",
      "Warandepark",
      "Belgisch Parlement",
      "Black Tower (Zwarte Toren)",
      "Kunstberg-trappen",
      "Dudenpark",
      "Basiliek van Koekelberg",
      "Park Thurn & Taxis Bridge View",
      "Kruidtuin (Le Botanique)",
      "Bois de la Cambre",
      "Chalet Robinson",
      "Jardin du Maelbeek",
      "Place du Jeu de Balle",
      "Rue des Bouchers",
      "Rue du Marché aux Fromages",
      "Villa Empain",
      "Koninklijke Serres van Laeken",
      "Japanese Tower",
      "Monument to the Dynasty",
      "Hallepoort",
      "Poelaertplein",
      "Wiels Rooftop",
      "Het Goudblommeke in Papier",
      "À la Mort Subite",
      "Le Cirio",
      "Au Derby",
      "’t Spinnekopke",
      "Les Brigittines",
      "Bouillon Bruxelles",
      "Belga Queen",
      "Vossenstraat Steegjes",
      "Horta Gallery",
      "Place du Petit Sablon",
      "Place du Grand Sablon",
      "MIM Terras",
      "Jubelpark Arcade Rooftop View",
      "Metrostation Pannenhuis",
      "Begraafplaats van Elsene",
      "Serres van Botanique",
      "Park van Vorst",
      "Lambermont-boulevard",
      "Jupiter Panorama",
      "Scheutbospark",

      // Hidden Gems from PDF
      "Puppet Theatre Toone",
      "Le Cercueil",
      "Cemetery Dieweg",
      "Musée des Arbalétriers",
      "Jardin du Fleuriste",
      "Cemetery of Brussels (Evere)",
      "Kauwberg Nature Reserve",
      "Bois de la Cambre Secret Island",
      "Fin-de-Siècle Museum",
      "Sewer Museum (Musée des Égouts)",
      "Cantillon Brewery",
      "Le Phare du Kanaal",
      "Zinneke Pis (Pissing Dog)",
      "Windmill of Lindekemale",
      "Abandoned Tower of Laeken",
      "Cité Hellemans",
      "Van Buuren Museum Courtyard",
      "Église Sainte-Marie Madeleine",
      "La Maison van Dyck",
      "La Maison de La Bellone",
      "La Fontaine des Aveugles"
    ];

    const locations = rawPlaces.map((name, index) => ({
      locationID: index + 1,
      name,
      description: null,          // ← vullen via CMS later
      latitude: null,             // ← te voorzien (GPS)
      longitude: null,            // ← te voorzien (GPS)
      difficulty_level: null,     // ← 1–5 bijv.
      hints: null,                // ← optioneel hint-systeem
      puzzle_text: null,          // ← tekst voor gamification
      next_location_id: null,     // ← route als je volgorde wilt
      is_active: true,
      createdAt: new Date(),
      updatedAt: new Date()
    }));

    await queryInterface.bulkInsert("Locations", locations);
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("Locations", null, {});
  },
};
