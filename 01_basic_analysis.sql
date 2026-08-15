-- ============================================================
-- Spotify Listening Analysis
-- Block 1: Basic SQL Analysis
-- ============================================================


-- 1. Analyze the number of plays across different platforms.

SELECT 
    platform, 
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY platform
ORDER BY play_count DESC;


-- 2. Find the tracks with the highest number of plays.

SELECT 
	track_name, 
	artist_name, 
	COUNT(*) as play_count 
FROM spotify_history
Group BY track_name, artist_name
ORDER BY play_count DESC;


-- 3. Find tracks that were listened to for more than 1 minute.

SELECT 
    DISTINCT track_name, 
    artist_name
FROM spotify_history
WHERE ms_played > 60000
ORDER BY artist_name;


-- 4. Calculate the average listening time for a single play.

SELECT 
    ROUND(AVG(ms_played) / 1000, 0) AS average_listening_seconds
FROM spotify_history;


-- 5. Count the skipped plays.

SELECT 
    COUNT(*) AS skipped_plays
FROM spotify_history
WHERE skipped = TRUE;


-- 6. Analyze how listening activity varies by year.

SELECT 
    EXTRACT(YEAR FROM ts) AS year,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY year
ORDER BY year DESC;


-- 7. Identify the day of the week with the highest listening activity.

SELECT 
    TO_CHAR(ts, 'Day') AS day_of_week,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY day_of_week
ORDER BY play_count DESC;


-- 8. Identify the hour of the day with the highest listening activity.

SELECT 
    EXTRACT(HOUR FROM ts) AS hour,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY hour
ORDER BY play_count DESC;


-- 9. Find the first listening activity of each artist.

SELECT
    artist_name,
    MIN(ts) AS first_listening
FROM spotify_history
GROUP BY artist_name
ORDER BY first_listening;
