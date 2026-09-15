use project_movie_database;

#a)	Can you get all data about movies? 
SELECT * FROM movies;

#b)	How do you get all data about directors?
SELECT * FROM directors;

#c)	Check how many movies are present in IMDB.
SELECT count(id) FROM movies;

#d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * FROM directors
WHERE name IN 
("James Cameron", "Luc Besson", "John Woo");

#e)	Find all directors with name starting with S.
SELECT * FROM directors
WHERE name LIKE 'S%';

#f)	Count female directors.
SELECT * FROM  directors
WHERE gender=1;

#g)	Find the name of the 10th first women directors? (assuming to find the 10th women director name)
SELECT * FROM directors 
WHERE gender=1 
ORDER BY name asc limit 1 offset 9;

#h)	What are the 3 most popular movies?
SELECT * FROM movies 
ORDER BY popularity desc limit 3;

#i)	What are the 3 most bankable movies?
SELECT * FROM movies
ORDER BY revenue desc limit 3;
#j)	What is the most awarded average vote since the January 1st, 2000?
SELECT * FROM movies 
WHERE release_date>='2000-01-01' 
ORDER BY vote_average desc limit 1;

#k)	Which movie(s) were directed by Brenda Chapman?
SELECT * FROM movies
WHERE director_id= ( 
SELECT id FROM directors where name= "Brenda Chapman" );

#l)	Which director made the most movies?
SELECT directors.name, COUNT(movies.id) AS movie_count
FROM directors
JOIN movies ON directors.id = movies.director_id
GROUP BY directors.id
ORDER BY movie_count desc limit 1;

#m)	Which director is the most bankable?
SELECT directors.name, SUM(revenue) AS total_revenue
FROM directors
JOIN movies ON directors.id = movies.director_id
GROUP BY directors.id
ORDER BY total_revenue desc limit 1;


