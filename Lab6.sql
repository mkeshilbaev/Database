CREATE DATABASE lab6;

create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);

insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

SELECT * FROM Movie;
SELECT *FROM Reviewer;
SELECT *FROM Rating;

--1
ALTER TABLE Movie
    ADD PRIMARY KEY (mID);

--2
ALTER TABLE Movie
    ADD CONSTRAINT movie_unique UNIQUE (title, year);

--3
ALTER TABLE Reviewer
    ADD CONSTRAINT reviwer_pkey PRIMARY KEY (rID);

--4
ALTER TABLE Rating
    ADD CONSTRAINT rating_unique UNIQUE (rID, mID, ratingDate);

--5
ALTER TABLE Reviewer
    ALTER COLUMN name SET NOT NULL;

--6
ALTER TABLE Rating
    ALTER COLUMN stars SET NOT NULL ;

--7
ALTER TABLE Movie
    ADD CONSTRAINT movie_checker1 CHECK (year > 1900);

--8
ALTER TABLE Rating
    ADD CONSTRAINT rating_checker1 CHECK (stars BETWEEN 1 AND 5);

--9
ALTER TABLE Rating
    ADD CONSTRAINT rating_checker1 CHECK (ratingDate >= TO_DATE(('2000-01-01'), 'yy-mm-dd'));

--10
ALTER TABLE Movie ADD CONSTRAINT movie_checker2 CHECK ((director == 'Steven Spilberg' AND year < 1990) OR (director == 'James Cameron' AND year <= 1990)
OR (director NOT IN ('Steven Spilberg', 'James Cameron')));


--Task 3 Constraint enforcement
--11
UPDATE Movie SET mID = mID + 1;

--12
INSERT INTO Movie
VALUES (109, 'Titanic', 1997, 'JC');

--13
INSERT INTO Reviewer
VALUES (201, 'Ted Codd');

--.................

--Task 4
--26
ALTER TABLE Rating
    ADD CONSTRAINT rating_fkey1 FOREIGN KEY (rID)
  REFERENCES Reviewer ON UPDATE CASCADE ON DELETE SET NULL ;

--26
ALTER TABLE Rating
    ADD CONSTRAINT rating_fkey2 FOREIGN KEY (mID)
  REFERENCES Movie ON DELETE CASCADE;

select conname, contype, consrc from pg_constraint;
SELECT *FROM Movie;

SELECT sum(rID) AS "SUM" FROM Rating;

SELECT count(rID) FROM Rating
WHERE rID ISNULL ;

