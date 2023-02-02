-- Выборка из одной таблицы
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


-- Продвинутая выборка
-- количество исполнителей в каждом жанре
SELECT g.genre_name, COUNT(a.artist_id)
  FROM artists a
       JOIN genre_artist ga
       ON ga.artist_id = a.artist_id
       JOIN genres g
       ON g.genre_id = ga.genre_id
 GROUP BY g.genre_name
 ORDER BY g.genre_name
       
-- количество треков, вошедших в альбомы 2019-2020 годов
SELECT a.release_year, COUNT(t.track_id)
  FROM tracks t
       JOIN albums a
       ON a.album_id = t.album_id
 WHERE a.release_year IN (2019, 2020)
 GROUP BY a.release_year
  
-- средняя продолжительность треков по каждому альбому
SELECT a.album_name, AVG(t.duration) AS average_track_duration
  FROM tracks t
       JOIN albums a
       ON a.album_id = t.album_id
 GROUP BY a.album_name
 ORDER BY a.album_name
 
-- все исполнители, которые не выпустили альбомы в 2020 году
SELECT a.artist_name
  FROM artists a
       JOIN artist_album aa
       ON aa.artist_id = a.artist_id
       JOIN albums a2
       ON a2.album_id = aa.album_id
 WHERE a.artist_name NOT IN  
       (SELECT a.artist_name
          FROM artists a
               JOIN artist_album aa
               ON aa.artist_id = a.artist_id
               JOIN albums a2
               ON a2.album_id = aa.album_id
         WHERE a2.release_year = 2020)
 ORDER BY a.artist_name
 
-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT c.collection_name
  FROM collections c 
       JOIN track_collection tc
       ON tc.collection_id  = c.collection_id
       JOIN tracks t
       ON t.track_id  = tc.track_id
       JOIN albums a
       ON a.album_id = t.album_id
       JOIN artist_album aa 
       ON aa.album_id = a.album_id 
       JOIN artists a2
       ON a2.artist_id = aa.artist_id 
 WHERE a2.artist_name = 'Korn' 
 ORDER BY c.collection_name
       
-- название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT a.album_name
  FROM albums a
       JOIN artist_album aa
       ON aa.album_id = a.album_id
       JOIN artists a2
       ON a2.artist_id = aa.artist_id
       JOIN genre_artist ga 
       ON ga.artist_id = a2.artist_id 
       JOIN genres g 
       ON g.genre_id = ga.genre_id 
 GROUP BY a.album_name
HAVING count(g.genre_id) > 1
 ORDER BY a.album_name 

-- наименование треков, которые не входят в сборники
SELECT t.track_name
  FROM tracks t 
       LEFT JOIN track_collection tc 
       ON tc.track_id = t.track_id 
 WHERE tc.track_id IS NULL 
 ORDER BY t.track_name 

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT a.artist_name
  FROM artists a 
       JOIN artist_album aa 
       ON aa.artist_id = a.artist_id 
       JOIN albums a2 
       ON a2.album_id = aa.album_id 
       JOIN tracks t 
       ON t.album_id = a2.album_id 
 WHERE t.duration = (SELECT MIN(duration) FROM tracks)  
 ORDER BY a.artist_name
       
-- название альбомов, содержащих наименьшее количество треков
SELECT a.album_name
  FROM albums a
       LEFT JOIN tracks t 
       ON t.album_id = a.album_id 
 WHERE t.album_id IN 
       (SELECT album_id 
          FROM tracks
         GROUP BY album_id
        HAVING count(album_id) = 
               (SELECT count(track_id)
                  FROM tracks 
                 GROUP BY album_id
                 ORDER BY count
                 LIMIT 1))
 ORDER BY a.album_name            

 