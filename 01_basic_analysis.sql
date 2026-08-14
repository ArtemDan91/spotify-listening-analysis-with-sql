-- ============================================================
-- Spotify Listening Analysis
-- Block 1: Basic SQL Analysis
-- ============================================================


-- 1. Listenings by platform

SELECT 
    platform, 
    COUNT(*) AS listenings
FROM spotify_history
GROUP BY platform
ORDER BY listenings DESC;


-- 2. Most listened tracks

SELECT 
	track_name, 
	artist_name, 
	COUNT(*) as listenings 
FROM spotify_history
Group BY track_name, artist_name
ORDER BY listenings DESC;


-- 3. Tracks listened to for more than 1 minute

SELECT 
    DISTINCT track_name, 
    artist_name
FROM spotify_history
WHERE ms_played > 60000
ORDER BY artist_name;


-- 4. Average listening time

SELECT 
    ROUND(AVG(ms_played) / 1000, 0) AS average_listening_seconds
FROM spotify_history;


-- 5. Skipped listenings

SELECT 
    COUNT(*) AS skipped_listenings
FROM spotify_history
WHERE skipped = TRUE;


-- 6. Listening activity by year

SELECT 
    EXTRACT(YEAR FROM ts) AS year,
    COUNT(*) AS listenings
FROM spotify_history
GROUP BY year
ORDER BY year DESC;


-- 7. Most active weekday

SELECT 
    TRIM(TO_CHAR(ts, 'DAY')) AS day_of_week,
    COUNT(*) AS listenings
FROM spotify_history
GROUP BY day_of_week
ORDER BY listenings DESC;


-- 8. Most active hour

SELECT 
    EXTRACT(HOUR FROM ts) AS hour,
    COUNT(*) AS listenings
FROM spotify_history
GROUP BY hour
ORDER BY listenings DESC;
