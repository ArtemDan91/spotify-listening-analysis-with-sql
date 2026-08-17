-- ============================================================
-- Spotify Listening Analysis
-- Block 4: PostgreSQL Query Optimization
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


-- Create index: Artist

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

-- Remove index before next test

DROP INDEX IF EXISTS idx_spotify_artist;

----------------------------------------------------------------
-- 2. Artist + Track search
----------------------------------------------------------------

-- Before index: Artist + Track

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
  AND track_name = 'Not Today';

-- Before index: Artist only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';

-- Before index: Track only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE track_name = 'Not Today';


-- Create index: Artist → Track

CREATE INDEX idx_spotify_artist_track
ON spotify_history (artist_name, track_name);


-- After index: Artist + Track

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons'
  AND track_name = 'Not Today';

-- After index: Artist only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';

-- After index: Track only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE track_name = 'Not Today';

-- Remove index before next test

DROP INDEX IF EXISTS idx_spotify_artist_track;

----------------------------------------------------------------
-- 3. Track + Artist search
----------------------------------------------------------------

-- Before index: Track + Artist

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE track_name = 'Not Today'
  AND artist_name = 'Imagine Dragons';

-- Before index: Track only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE track_name = 'Not Today';

-- Before index: Artist only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';


-- Create index: Track → Artist

CREATE INDEX idx_spotify_track_artist
ON spotify_history (track_name, artist_name);


-- After index: Track + Artist

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE track_name = 'Not Today'
  AND artist_name = 'Imagine Dragons';

-- After index: Track only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE track_name = 'Not Today';

-- After index: Artist only

EXPLAIN ANALYZE
SELECT *
FROM spotify_history
WHERE artist_name = 'Imagine Dragons';

-- Remove index before next test

DROP INDEX IF EXISTS idx_spotify_track_artist;

----------------------------------------------------------------
-- 4. Timestamp search
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


-- Create index: Timestamp

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
