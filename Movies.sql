CREATE DATABASE BollywoodMovies;

USE BollywoodMovies;

CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(255) NOT NULL
);

CREATE TABLE Directors (
    DirectorID INT AUTO_INCREMENT PRIMARY KEY,
    DirectorName VARCHAR(255) NOT NULL
);

CREATE TABLE MusicDirectors (
    MusicDirectorID INT AUTO_INCREMENT PRIMARY KEY,
    MusicDirectorName VARCHAR(255) NOT NULL
);

CREATE TABLE Actors (
    ActorID INT AUTO_INCREMENT PRIMARY KEY,
    ActorName VARCHAR(255) NOT NULL
);

CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    MovieName VARCHAR(255) NOT NULL,
    ReleaseYear YEAR,
    GenreID INT,
    DirectorID INT,
    MusicDirectorID INT,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
    FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID),
    FOREIGN KEY (MusicDirectorID) REFERENCES MusicDirectors(MusicDirectorID)
);

CREATE TABLE MovieActors (
    MovieID INT,
    ActorID INT,
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
);

INSERT INTO Genres (GenreName) VALUES
    ('Drama'),
    ('Comedy'),
    ('Action'),
    ('Romance'),
    ('Thriller');
    
INSERT INTO Directors (DirectorName) VALUES
    ('Karan Johar'),
    ('Rajkumar Hirani'),
    ('Sanjay Leela Bhansali'),
    ('Rohit Shetty'),
    ('Imtiaz Ali');
    
INSERT INTO MusicDirectors (MusicDirectorName) VALUES
    ('A. R. Rahman'),
    ('Pritam'),
    ('Vishal-Shekhar'),
    ('Amit Trivedi'),
    ('Himesh Reshammiya');
    
INSERT INTO Actors (ActorName) VALUES
    ('Shah Rukh Khan'),
    ('Amitabh Bachchan'),
    ('Aishwarya Rai'),
    ('Deepika Padukone'),
    ('Ranbir Kapoor');
    
INSERT INTO Movies (MovieName, ReleaseYear, GenreID, DirectorID, MusicDirectorID) VALUES
    ('Dilwale Dulhania Le Jayenge', '1995', 4, 1, 1),
    ('3 Idiots', '2009', 1, 2, 2),
    ('Padmaavat', '2018', 1, 3, 3),
    ('Chennai Express', '2013', 3, 4, 4),
    ('Tamasha', '2015', 1, 5, 5);
    
INSERT INTO MovieActors (MovieID, ActorID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 5);
    
-- Retrieve all movies released after the year 2000:
SELECT * FROM Movies WHERE ReleaseYear > 2000;

-- Retrieve the names of actors who appeared in a specific movie
SELECT Actors.ActorName
FROM Actors
INNER JOIN MovieActors ON Actors.ActorID = MovieActors.ActorID
INNER JOIN Movies ON MovieActors.MovieID = Movies.MovieID
WHERE Movies.MovieName = 'Dilwale Dulhania Le Jayenge';

-- Find all movies in the 'Romance' genre
SELECT Movies.MovieName
FROM Movies
INNER JOIN Genres ON Movies.GenreID = Genres.GenreID
WHERE Genres.GenreName = 'Romance';
