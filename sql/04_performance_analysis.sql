-- ============================================================
-- Spotify Listening Analysis
-- Block 4: PostgreSQL Performance Analysis
-- ============================================================


-- 1. Analyze query performance before single-column indexing.

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';


-- 2. Create a single-column index.

CREATE INDEX idx_spotify_artist
ON spotify_history (artist_name);


-- 3. Analyze query performance after indexing.

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';


-- 4. Analyze query performance before composite indexing.

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
AND track_name = 'Not Today';


-- 5. Create a composite index.

CREATE INDEX idx_spotify_artist_track
ON spotify_history (artist_name, track_name);


-- 6. Analyze query performance after indexing.

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
AND track_name = 'Not Today';
