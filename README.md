# Spotify Listening Analysis

## SQL-based analysis of Spotify listening behavior

### Project Overview

This project analyzes personal Spotify listening history to identify listening patterns, track and artist preferences, and user listening behavior.

The analysis is performed using SQL, with Power BI used to visualize the results and create an interactive dashboard.

### Objectives

- Analyze overall listening activity and listening time
- Identify the most frequently played tracks and artists
- Explore listening behavior and skip patterns
- Analyze listening activity across different time periods
- Apply SQL techniques to extract meaningful insights from the data
- Explore query performance and SQL optimization

### Dataset

The dataset contains Spotify listening history records.

Each row represents a single listening event and contains information about the track, artist, album, listening duration, playback context, and listening behavior.

| Field | Description |
|---|---|
| `spotify_track_uri` | Spotify URI identifying the track |
| `ts` | Timestamp of the listening event |
| `platform` | Platform used for playback |
| `ms_played` | Track listening duration in milliseconds |
| `track_name` | Name of the track |
| `artist_name` | Name of the artist |
| `album_name` | Name of the album |
| `reason_start` | Reason why playback started |
| `reason_end` | Reason why playback ended |
| `shuffle` | Indicates whether Shuffle Mode was enabled |
| `skipped` | Indicates whether the track was skipped |

### SQL Analysis

The analysis is divided into several sections:

1. Basic Listening Overview
2. Track & Artist Analysis
3. Listening Behavior
4. Advanced SQL Analysis
5. SQL Query Optimization

### Tools & Technologies

- SQL
- PostgreSQL
- BigQuery
- Power BI
- GitHub
- Excel

### Power BI Dashboard

The Spotify listening data is also explored in Power BI.

[View Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiYjcyNzYwOGMtZDc0ZC00ZDZiLWE5NTEtY2E5NmQ1N2FhNDhhIiwidCI6IjllNjI3NDIxLTRkYTUtNGYxYi1hYTMxLThiNTRiZWJlYTE0NyJ9)

### Key Findings


### Project Structure
