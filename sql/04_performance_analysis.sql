-- ============================================================
-- Spotify Listening Analysis
-- Block 4: PostgreSQL Performance Analysis
-- ============================================================


-- 1. Analyze query performance before single-column indexing.

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';


-- 2. Create a single-column index and analyze its impact.

CREATE INDEX idx_spotify_artist
ON spotify_history (artist_name);

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';


-- 3. Analyze query performance before composite indexing.

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
  AND track_name = 'Not Today';


-- 4. Create a composite index and analyze its impact.

CREATE INDEX idx_spotify_artist_track
ON spotify_history (artist_name, track_name);

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
  AND track_name = 'Not Today';


-- 5. Analyze query performance before indexing timestamp.

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE ts >= '2024-01-01'
AND ts < '2025-01-01';


-- 6. Create an index on timestamp and analyze its impact.

CREATE INDEX idx_spotify_ts
ON spotify_history (ts);

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE ts >= '2024-01-01'
AND ts < '2025-01-01';
