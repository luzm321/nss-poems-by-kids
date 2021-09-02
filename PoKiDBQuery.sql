--Investigating the Data
--Query the PoKi database using SQL SELECT statements to answer the following questions:

--What grades are stored in the database?
SELECT 
	Name [Grades]
FROM Grade;

--What emotions may be associated with a poem?
SELECT 
	Name [Emotion Name]
FROM Emotion;

--How many poems are in the database?
SELECT
	COUNT(Id) [Total Poem Count]
FROM Poem;

--Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT DISTINCT TOP 76 Name [Author Name]
FROM Author
ORDER BY Name;

--Starting with the above query, add the grade of each of the authors.
SELECT DISTINCT TOP 76
	a.Name [Author Name],
	g.Name [Grade]
FROM Author a
INNER JOIN Grade g
ON a.GradeId = g.Id
ORDER BY a.Name;

--Starting with the above query, add the recorded gender of each of the authors.
SELECT DISTINCT TOP 76
	a.Name [Author Name],
	g.Name [Grade],
	gen.Name [Gender]
FROM Author a
INNER JOIN Grade g
ON a.GradeId = g.Id
INNER JOIN Gender gen
ON a.GenderId = gen.Id
ORDER BY a.Name;

--What is the total number of words in all poems in the database?
SELECT
	SUM(WordCount) [Total Word Count in All Poems]
FROM Poem;

--Which poem has the fewest characters?
SELECT 
	Poem.Title [Poem Title],
	MIN(CharCount) [Fewest Character Count]
FROM Poem
GROUP BY Poem.Title
HAVING MIN(Poem.CharCount) = 6;

--How many authors are in the third grade?
SELECT
	COUNT(a.GradeId) [Number of Authors in 3rd Grade]
FROM Author a
LEFT JOIN Grade g
ON a.GradeId = g.Id
WHERE g.Name = '3rd Grade';
--WHERE g.Id = 3;

--How many total authors are in the first through third grades?
SELECT
	SUM(a.GradeId) [Total Number of Authors From 1st-3rd Grades]
FROM Author a
LEFT JOIN Grade g
ON a.GradeId = g.Id
WHERE g.Name BETWEEN '1st Grade' AND '3rd Grade';
--WHERE g.Name NOT LIKE '4%' OR '5%';
--WHERE g.Name IN (LIKE '%1st%' OR '%2nd%' OR '%3rd%');

--What is the total number of poems written by fourth graders?
SELECT
	COUNT(p.Id) [Total Number of Poems By 4th Graders]
FROM Poem p
LEFT JOIN Author a
ON p.AuthorId = a.Id
LEFT JOIN Grade g
ON a.GradeId = g.Id
WHERE g.Name = '4th Grade';

--How many poems are there per grade?
SELECT
	g.Name [Grade],
	COUNT(p.Id) [Number of Poems Per Grade]
FROM Poem p
LEFT JOIN Author a
ON p.AuthorId = a.Id
LEFT JOIN Grade g
ON a.GradeId = g.Id
GROUP BY g.Name
ORDER BY g.Name; 

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT
	g.Name [Grade],
	COUNT(a.Id) [Number of Authors Per Grade]
FROM Author a
LEFT JOIN Grade g
ON a.GradeId = g.Id
GROUP BY g.Name
ORDER BY g.Name;

--What is the title of the poem that has the most words?
SELECT MAX(p.WordCount) [Most Word Count in a Poem]
FROM Poem p

SELECT
	p.Title [Poem Title With Most Words],
	MAX(p.WordCount) [Most Word Count]
FROM Poem p
GROUP BY p.Title
HAVING MAX(p.WordCount) = 263;

--Which author(s) have the most poems? (Remember authors can have the same name.)
SELECT 
	DISTINCT a.Name [Author Name],
	MAX(p.AuthorId) [Number of Poems]
FROM Poem p
LEFT JOIN Author a
ON p.AuthorId = a.Id
GROUP By a.Name
ORDER BY a.Name;
--STILL NEED TO COMPLETE QUERY ABOVE FOR AUTHOR(S) WITH THE MOST POEMS

--How many poems have an emotion of sadness?

--How many poems are not associated with any emotion?

--Which emotion is associated with the least number of poems?

--Which grade has the largest number of poems with an emotion of joy?

--Which gender has the least number of poems with an emotion of fear?