DROP DATABASE IF EXISTS uygulama;
CREATE DATABASE IF NOT EXISTS uygulama;
USE uygulama;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    password VARCHAR(255) DEFAULT NULL, 
    country VARCHAR(100),
    city VARCHAR(100),
     google_id VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS login_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    login_ip VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS google_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    google_id VARCHAR(255) UNIQUE,
    display_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS films (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_date INT,
    director VARCHAR(255),
    cast TEXT,
    genre VARCHAR(100),
    imdb_score DECIMAL(3, 1),
    poster_url VARCHAR(255),
    trailer_url VARCHAR(255),
    duration INT
);

CREATE TABLE IF NOT EXISTS actors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    aka VARCHAR(255),
    profile_pic_url VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS film_actors (
    film_id INT,
    actor_id INT,
    PRIMARY KEY (film_id, actor_id),
    FOREIGN KEY (film_id) REFERENCES films(id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors(id) ON DELETE CASCADE
);

CREATE TABLE watchlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    film_id INT NOT NULL,
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);


CREATE TABLE IF NOT EXISTS ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    film_id INT,
    rating DECIMAL(2, 1),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

INSERT INTO films (title, description, release_date, director, genre, imdb_score, poster_url, trailer_url, duration)
VALUES 
('The Idea of You', 'A romantic drama about unexpected love that sweeps you off your feet.', 2024, 'John Smith', 'Drama, Romance', 8.1, '/datas/The_Idea_of_You_film_poster.jpg', '/datas/Sen ihtimali - The Idea of You  IMDb.mp4', 115),
('Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.', 2010, 'Christopher Nolan', 'Action, Adventure, Sci-Fi', 8.8, '/datas/Inception_poster.jpg', '/datas/Inception_Trailer.mp4', 148),
('The Matrix', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 1999, 'Lana Wachowski, Lilly Wachowski', 'Action, Sci-Fi', 8.7, '/datas/The_Matrix_poster.jpg', '/datas/The_Matrix_Trailer.mp4', 136),
('Titanic', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 1997, 'James Cameron', 'Drama, Romance', 7.8, '/datas/Titanic_poster.jpg', '/datas/Titanic_Trailer.mp4', 195),
('Avatar', 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', 2009, 'James Cameron', 'Action, Adventure, Fantasy', 7.8, '/datas/Avatar_poster.jpg', '/datas/Avatar_Trailer.mp4', 162),
('Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 2014, 'Christopher Nolan', 'Adventure, Drama, Sci-Fi', 8.6, '/datas/Interstellar_poster.jpg', '/datas/Interstellar_Trailer.mp4', 169),
('The Dark Knight', 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', 2008, 'Christopher Nolan', 'Action, Crime, Drama', 9.0, '/datas/The_Dark_Knight_poster.jpg', '/datas/The_Dark_Knight_Trailer.mp4', 152),
('The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 1972, 'Francis Ford Coppola', 'Crime, Drama', 9.2, '/datas/The_Godfather_poster.jpg', '/datas/The_Godfather_Trailer.mp4', 175),
('Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 1994, 'Quentin Tarantino', 'Crime, Drama', 8.9, '/datas/Pulp_Fiction_poster.jpg', '/datas/Pulp_Fiction_Trailer.mp4', 154),
('Forrest Gump', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.', 1994, 'Robert Zemeckis', 'Drama, Romance', 8.8, '/datas/Forrest_Gump_poster.jpg', '/datas/Forrest_Gump_Trailer.mp4', 142),
('Fight Club', 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into much more.', 1999, 'David Fincher', 'Drama', 8.8, '/datas/Fight_Club_poster.jpg', '/datas/Fight_Club_Trailer.mp4', 139),
('The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 2001, 'Peter Jackson', 'Action, Adventure, Drama', 8.8, '/datas/LOTR_Fellowship_poster.jpg', '/datas/LOTR_Fellowship_Trailer.mp4', 178),
('The Lord of the Rings: The Two Towers', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.', 2002, 'Peter Jackson', 'Action, Adventure, Drama', 8.7, '/datas/LOTR_Two_Towers_poster.jpg', '/datas/LOTR_Two_Towers_Trailer.mp4', 179),
('The Lord of the Rings: The Return of the King', 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 2003, 'Peter Jackson', 'Action, Adventure, Drama', 8.9, '/datas/LOTR_Return_poster.jpg', '/datas/LOTR_Return_Trailer.mp4', 201),
('Star Wars: Episode IV - A New Hope', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire''s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.', 1977, 'George Lucas', 'Action, Adventure, Fantasy', 8.6, '/datas/Star_Wars_IV_poster.jpg', '/datas/Star_Wars_IV_Trailer.mp4', 121),
('The Avengers', 'Earth''s mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity.', 2012, 'Joss Whedon', 'Action, Adventure, Sci-Fi', 8.0, '/datas/The_Avengers_poster.jpg', '/datas/The_Avengers_Trailer.mp4', 143);

INSERT INTO actors (name, aka, profile_pic_url)
VALUES 
('Anne Hathaway', 'Annie', '/datas/anne hathaway.jpg'), 
('Nicholas Galitzine', 'Handsome Guy', '/datas/nicholas.jpg'),
('Leonardo DiCaprio', 'Leo', '/datas/leonardo_dicaprio.jpeg'),
('Kate Winslet', 'Rose', '/datas/kate_winslet.jpeg'),
('Keanu Reeves', 'Neo', '/datas/keanu_reeves.jpeg'),
('Carrie-Anne Moss', 'Trinity', '/datas/carrie_anne_moss.jpeg'),
('Matthew McConaughey', 'Cooper', '/datas/matthew_mcconaughey.jpeg'),
('Christian Bale', 'Batman', '/datas/christian_bale.jpg'),
('Heath Ledger', 'Joker', '/datas/heath_ledger.jpeg'),
('Marlon Brando', 'Don Vito', '/datas/marlon_brando.jpeg'),
('Al Pacino', 'Michael', '/datas/al_pacino.jpeg'),
('John Travolta', 'Vincent', '/datas/john_travolta.jpeg'),
('Uma Thurman', 'Mia', '/datas/uma_thurman.jpeg'),
('Tom Hanks', 'Forrest', '/datas/tom_hanks.jpeg'),
('Brad Pitt', 'Tyler', '/datas/brad_pitt.jpeg'),
('Edward Norton', 'Narrator', '/datas/edward_norton.jpeg'),
('Elijah Wood', 'Frodo', '/datas/elijah_wood.jpeg'),
('Ian McKellen', 'Gandalf', '/datas/ian_mckellen.jpeg'),
('Mark Hamill', 'Luke', '/datas/mark_hamill.jpeg'),
('Harrison Ford', 'Han', '/datas/harrison_ford.jpeg'),
('Robert Downey Jr.', 'Iron Man', '/datas/robert_downey_jr.jpeg'),
('Chris Evans', 'Captain America', '/datas/chris_evans.jpeg');

INSERT INTO film_actors (film_id, actor_id)
VALUES 
(1, 1), 
(1, 2),
(2, 3),   -- Leonardo DiCaprio in Inception
(3, 5),   -- Keanu Reeves in The Matrix
(3, 6),   -- Carrie-Anne Moss in The Matrix
(4, 3),  -- Leonardo DiCaprio in Titanic
(4, 4),  -- Kate Winslet in Titanic
(5, 1),  -- Sam Worthington in Avatar
(6, 7),  -- Matthew McConaughey in Interstellar
(7, 8),  -- Christian Bale in The Dark Knight
(7, 9),  -- Heath Ledger in The Dark Knight
(8, 10),  -- Marlon Brando in The Godfather
(8, 11),  -- Al Pacino in The Godfather
(9, 12),  -- John Travolta in Pulp Fiction
(9, 13),  -- Uma Thurman in Pulp Fiction
(10, 14), -- Tom Hanks in Forrest Gump
(11, 15), -- Brad Pitt in Fight Club
(11, 16), -- Edward Norton in Fight Club
(12, 17), -- Elijah Wood in The Fellowship of the Ring
(12, 18), -- Ian McKellen in The Fellowship of the Ring
(13, 17), -- Elijah Wood in The Two Towers
(13, 18), -- Ian McKellen in The Two Towers
(14, 17), -- Elijah Wood in The Return of the King
(14, 18), -- Ian McKellen in The Return of the King
(15, 19), -- Mark Hamill in Star Wars: Episode IV - A New Hope
(15, 20), -- Harrison Ford in Star Wars: Episode IV - A New Hope
(16, 21), -- Robert Downey Jr. in The Avengers
(16, 22); -- Chris Evans in The Avengers

