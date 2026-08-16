-- ============================================================
-- Spotify Listening Analysis
-- Block 4: PostgreSQL Performance Analysis
-- ============================================================

----------------------------------------------------------------
-- 1. Artist search
----------------------------------------------------------------

-- Before index: Equals

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';

-- Before index: LIKE

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name LIKE '%Dragons%';

-- Before index: LOWER

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE LOWER(artist_name) = 'imagine dragons';


-- Create index

CREATE INDEX idx_spotify_artist
ON spotify_history (artist_name);


-- After index: Equals

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';

-- After index: LIKE

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name LIKE '%Dragons%';

-- After index: LOWER

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE LOWER(artist_name) = 'imagine dragons';


----------------------------------------------------------------
-- 2. Artist + Track search
----------------------------------------------------------------

-- Before index

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
  AND track_name = 'Not Today';


-- Create index

CREATE INDEX idx_spotify_artist_track
ON spotify_history (artist_name, track_name);


-- After index

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
  AND track_name = 'Not Today';


----------------------------------------------------------------
-- 3. Timestamp search
----------------------------------------------------------------

-- Before index: Range Search

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE ts >= '2024-01-01'
  AND ts < '2025-01-01';

-- Before index: Sorting

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
ORDER BY ts DESC
LIMIT 100;


-- Create index

CREATE INDEX idx_spotify_ts
ON spotify_history (ts);


-- After index: Range Search

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE ts >= '2024-01-01'
  AND ts < '2025-01-01';

-- After index: Sorting

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
ORDER BY ts DESC
LIMIT 100;
