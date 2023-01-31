INSERT INTO genres 
VALUES (1, 'Metal'), 
       (2, 'Country'), 
       (3, 'Rock'), 
       (4, 'Folk'), 
       (5, 'Classics');

INSERT INTO artists 
VALUES (1, 'Michael Jackson'), 
       (2, 'Dead cat'), 
       (3, 'Ludwig Van Bethoven'), 
       (4, 'Korn'), 
       (5, 'Tatu'), 
       (6, 'Merlin Manson'),
       (7, 'Return'),
       (8, 'Python Rock');
    
INSERT INTO genre_artist 
VALUES (1, 2), (1, 6), (2, 7), (3, 4), (4, 8), (5, 3), (5, 1), (4, 5), (3, 6);
    
INSERT INTO albums 
VALUES (1, 'Night', 1956),
       (2, 'Hellrising', 2018),
       (3, 'Shell', 1987),
       (4, 'Netherveless', 2018),
       (5, 'Millenium', 2000),
       (6, 'Sonates', 1810),
       (7, 'Dawn', 1963),
       (8, 'Forgiveness', 2020);
    
INSERT INTO artist_album 
VALUES (1, 1), (2, 2), (3, 6), (4, 3), (5, 8), (6, 5), (7, 4), (8, 5), (8, 8);
    
INSERT INTO collections 
VALUES (1, 'Relax', 2018),
       (2, 'Mood', 1953),
       (3, 'Sea', 2020),
       (4, 'Seasons', 1820),
       (5, 'Dead Inside', 1995),
       (6, 'Morning', 1965),
       (7, 'Tomorrow', 2019),
       (8, 'The day after tomorrow', 2006);
    
INSERT INTO tracks 
VALUES (1, 6, 'Spring', 92),
       (2, 1, 'Kill them all', 185),
       (3, 5, 'Goodbye my love', 263),
       (4, 4, 'My Destiny', 168),
       (5, 2, 'Road to Hell', 66),
       (6, 3, 'Protection', 236),
       (7, 8, 'Mess', 193),
       (8, 7, 'Dawn of Humanity', 229),
       (9, 6, 'Autumn', 102),
       (10, 1, 'Night is short', 216),
       (11, 5, 'Storm', 163),
       (12, 2, 'Apathy', 298),
       (13, 6, 'Summer', 109),
       (14, 8, 'Aftercare', 218),
       (15, 3, 'Say something to me', 124);
    
INSERT INTO track_collection 
VALUES (1, 4), (2, 5), (3, 6), (4, 8), (5, 8), (5, 5), (6, 7), (7, 2), (8, 5), (9, 4), (10,6), (11, 3), (12, 1), (13, 4), (14, 7), (15, 2);
    


