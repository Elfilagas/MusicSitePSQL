-- название и год выхода альбомов, вышедших в 2018 году
SELECT album_name, release_year 
  FROM albums 
 WHERE release_year = 2018;

-- название и продолжительность самого длительного трека
SELECT track_name, duration 
  FROM tracks 
 ORDER BY duration DESC 
 LIMIT 1;

-- название треков, продолжительность которых не менее 3,5 минуты
SELECT track_name 
  FROM tracks 
 WHERE duration >= 60 * 3.5;

-- названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name 
  FROM collections 
 WHERE release_year BETWEEN 2018 AND 2020;

-- исполнители, чье имя состоит из 1 слова
SELECT artist_name 
  FROM artists 
 WHERE artist_name NOT LIKE '% %';

-- название треков, которые содержат слово "мой"/"my"
SELECT track_name 
  FROM tracks 
 WHERE LOWER(track_name) LIKE '%my%';
