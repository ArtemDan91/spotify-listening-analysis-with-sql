-- ============================================================
-- Spotify Listening Analysis
-- Block 1: Basic SQL Analysis
-- ============================================================


-- 1. Which platforms had the highest number of plays?

SELECT 
    platform, 
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY platform
ORDER BY play_count DESC;


-- 2. Which tracks had the highest play count?

SELECT 
	track_name, 
	artist_name, 
	COUNT(*) as play_count 
FROM spotify_history
Group BY track_name, artist_name
ORDER BY play_count DESC;


-- 3. Which tracks were listened to for more than 1 minute?

SELECT 
    DISTINCT track_name, 
    artist_name
FROM spotify_history
WHERE ms_played > 60000
ORDER BY artist_name;


-- 4. What was the average listening time per play?

SELECT 
    ROUND(AVG(ms_played) / 1000, 0) AS average_listening_seconds
FROM spotify_history;


-- 5. How many plays were skipped?

SELECT 
    COUNT(*) AS skipped_plays
FROM spotify_history
WHERE skipped = TRUE;


-- 6. How did listening activity vary by year?

SELECT 
    EXTRACT(YEAR FROM ts) AS year,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY year
ORDER BY year DESC;


-- 7. Which day of the week had the highest listening activity?

SELECT 
    TO_CHAR(ts, 'Day') AS day_of_week,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY day_of_week
ORDER BY play_count DESC;


-- 8. Which hour of the day had the highest listening activity?

SELECT 
    EXTRACT(HOUR FROM ts) AS hour,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY hour
ORDER BY play_count DESC;
