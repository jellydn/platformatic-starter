
-- Add SQL in this file to create the database tables for your API
CREATE TABLE IF NOT EXISTS quotes (
  id INTEGER PRIMARY KEY,
  movie_id INTEGER NOT NULL,
  character TEXT DEFAULT 'unknown' NOT NULL,
  quote TEXT NOT NULL,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (movie_id) REFERENCES movies(id)
);
