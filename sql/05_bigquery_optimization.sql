-- ============================================================
-- Spotify Listening Analysis
-- Block 5: BigQuery Query Optimization
-- ============================================================

----------------------------------------------------------------
-- 1. Before Partitioning
----------------------------------------------------------------

SELECT
    artist_name,
    COUNT(*) AS total_plays
FROM `spotify-505811.spotify.spotify_history`
WHERE ts >= '2025-01-01'
  AND ts < '2026-01-01'
  AND platform = 'android'
GROUP BY artist_name
ORDER BY total_plays DESC;

-- ============================================================
-- 2. Partitioning
-- ============================================================

-- Create a table partitioned by ts.
CREATE TABLE `spotify-505811.spotify.spotify_history_partitioned`
PARTITION BY DATE(ts)
AS
SELECT *
FROM `spotify-505811.spotify.spotify_history`;

SELECT
    artist_name,
    COUNT(*) AS total_plays
FROM `spotify-505811.spotify.spotify_history_partitioned`
WHERE ts >= '2025-01-01'
  AND ts < '2026-01-01'
  AND platform = 'android'
GROUP BY artist_name
ORDER BY total_plays DESC;

-- ============================================================
-- 3. Partitioning + Clustering
-- ============================================================

-- Create a table partitioned by ts and clustered by platform.
CREATE TABLE `spotify-505811.spotify.spotify_history_partitioned_clustered`
PARTITION BY DATE(ts)
CLUSTER BY platform
AS
SELECT *
FROM `spotify-505811.spotify.spotify_history`;

SELECT
    artist_name,
    COUNT(*) AS total_plays
FROM `spotify-505811.spotify.spotify_history__partitioned_clustered`
WHERE ts >= '2025-01-01'
  AND ts < '2026-01-01'
  AND platform = 'android'
GROUP BY artist_name
ORDER BY total_plays DESC;
