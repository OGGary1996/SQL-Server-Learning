--It's assumed these demos will be suplimented with lecture.
--Demo a join
use student;

SELECT 
    s.LastName + ', ' + s.FirstName AS [Name],
    c.CourseCode + ' - ' + c.Title AS [Course]
FROM Student s
INNER JOIN Student_Course sc ON s.ID = sc.StudentID
INNER JOIN Course c ON sc.CourseCode = c.CourseCode;

--- COUNT(c.CourseCode) → counts the number of courses per student.
-- GROUP BY s.LastName, s.FirstName → groups results by each student’s name.
-- Each student appears only once, with their total number of courses.
SELECT 
    s.LastName + ', ' + s.FirstName AS [Name],
    COUNT(c.CourseCode) AS [TotalCourses]
FROM Student s
INNER JOIN Student_Course sc ON s.ID = sc.StudentID
INNER JOIN Course c ON sc.CourseCode = c.CourseCode
GROUP BY s.LastName, s.FirstName

-- ORDER BY s.LastName, s.FirstName;


SELECT LastName + ', '+ FirstName AS [Name]
	--,c.CourseCode + ' - '+ Title AS [Course]
	FROM Student s LEFT JOIN Student_Course sc On s.ID = sc.StudentID
	WHERE sc.StudentID IS NULL

	-- Demo the case
SELECT Instructor,
CASE Instructor 
	WHEN 1 THEN 'Steven'
	WHEN 2 THEN 'Frank'
	WHEN 3 THEN 'Michael'
END AS [Instructor Name]
 FROM Course	

 -- VIEWS
--Efficiency: You can display data from multiple tables and not write the same queries over and over again.
--Performance: You can cache the query a view uses, and you can even create something called an indexed view, which further improves speed.
--Security: You can limit the amount of data certain users can see.
--Less coding: Views reduce the amount of code you need to write and can be referenced in other queries using joins.
 -- Demo a View
 GO

 CREATE View UnenrolledStudents
 AS
 SELECT LastName + ', '+ FirstName AS [Name]
	--,c.CourseCode + ' - '+ Title AS [Course]
	FROM Student s LEFT JOIN Student_Course sc On s.ID = sc.StudentID
	WHERE sc.StudentID IS NULL
	
GO
	SELECT * FROM UnenrolledStudents
GO