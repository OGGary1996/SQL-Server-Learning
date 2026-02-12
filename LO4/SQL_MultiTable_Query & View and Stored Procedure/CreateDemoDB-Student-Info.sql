

DROP TABLE Student_Course;
DROP TABLE Course;
DROP TABLE Student;

CREATE TABLE Course(
    CourseCode CHAR(7) NOT NULL,
    Title nvarchar(50) NOT NULL,
    Fee money,
    Instructor int,
    PRIMARY KEY (CourseCode)
);

CREATE TABLE Student(
    ID int IDENTITY(1,1) NOT NULL,
    LastName nvarchar(35) NOT NULL,
    FirstName nvarchar(40),
    Address nvarchar(255),
	City nvarchar(55) NOT NULL,
	Province char(2),
    PRIMARY KEY (ID)
);

CREATE TABLE Student_Course(
    CourseCode CHAR(7) NOT NULL,
    StudentID int NOT NULL,
    PRIMARY KEY (CourseCode,StudentID)
);

-- Step 6 Modify Student_Course to add FK Relationships
ALTER TABLE Student_Course
ADD CONSTRAINT FK_StudentID_Student
FOREIGN KEY (StudentID) REFERENCES Student(ID);

ALTER TABLE Student_Course
ADD CONSTRAINT FK_CourseCode_Course
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode);






INSERT INTO [dbo].[Course]
           ([CourseCode]
           ,[Title]
           ,[Fee]
           ,[Instructor])
     VALUES
           ('COMP123'
           ,'Introduction to Business Computing'
           ,550.00
           ,1),
           ('COMP255'
           ,'Visual Application Development'
           ,550.00
           ,2),
		   ('STAT120',
		   'Business Statistics',
		   500.00
		   ,3),
		   ('CMDB600',
		   'Database Design and Development',
		   1500.00
		   ,1)
GO




INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Bowman','Wilma','Ap #899-3451 Dolor. St.','Shawville','QC'),('Phillips','Colette','297 Semper Ave','Gaspé','QC'),('Bullock','Quamar','P.O. Box 655, 5295 At, Rd.','Belcarra','BC'),('Noble','Griffin','P.O. Box 878, 5659 Maecenas Road','Breton','AB'),('Torres','Castor','4114 Massa. St.','Cornwall','ON'),('Ryan','Lillian','Ap #829-3743 Feugiat Rd.','Provost','AB'),('Whitehead','Carissa','680-4028 Penatibus St.','Sooke','BC'),('Keller','Dalton','Ap #782-7346 Nam Ave','Beausejour','MB'),('Peters','Jana','591-192 Dui. Avenue','Cranbrook','BC'),('Bradley','Gay','237-9939 Nulla Rd.','Gatineau','QC');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Petty','Aquila','123-2553 Accumsan Ave','Newmarket','ON'),('Gardner','Lunea','P.O. Box 298, 8674 Ullamcorper St.','Aurora','ON'),('Ratliff','Yoko','Ap #880-443 Vitae St.','LaSalle','ON'),('Cash','Hop','798-3542 Tortor Av.','Aylmer','QC'),('Mills','Amity','862-2548 Placerat, Av.','Lacombe','AB'),('Graham','Bianca','988-2231 Duis St.','Parkland County','AB'),('Holden','Stephanie','P.O. Box 850, 2575 Turpis Av.','Minitonas','MB'),('Clayton','Rana','P.O. Box 746, 9562 Vel, Rd.','Lanark County','ON'),('Marquez','Macy','324-6167 Fermentum Rd.','Rivière-du-Loup','QC'),('Gaines','Fulton','3960 Non, Avenue','Fort Providence','NT');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Moody','Shaine','2034 Eu Street','Barrie','ON'),('Morales','Myra','1294 Faucibus Ave','Thunder Bay','ON'),('Guy','Hyatt','538-960 Orci St.','Saint-Laurent','QC'),('Jenkins','Germane','525-289 Mi Ave','Bon Accord','AB'),('Bentley','Noelani','P.O. Box 532, 4190 Amet Avenue','Malahide','ON'),('Cox','Iliana','Ap #470-7703 Ultrices Rd.','Rivière-du-Loup','QC'),('Wiley','Paul','P.O. Box 566, 4958 Ut Street','High Level','AB'),('Boyle','Kuame','644-7548 Proin Rd.','Outremont','QC'),('Conner','Slade','Ap #172-1163 Pede Ave','Beausejour','MB'),('Eaton','Magee','Ap #310-597 Facilisis St.','Tumbler Ridge','BC');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Sharp','John','P.O. Box 791, 2357 Et Street','Champlain','QC'),('Glass','Lester','7855 Id Avenue','Kapuskasing','ON'),('Head','Farrah','854-4873 Urna. St.','Cornwall','ON'),('Barker','Amelia','P.O. Box 320, 1070 Nulla Rd.','Duncan','BC'),('Deleon','Kaseem','P.O. Box 309, 2787 Mauris St.','Legal','AB'),('Carson','Isaiah','894-8300 Fringilla Av.','Northumberland','ON'),('Mayer','Maia','223-3965 Gravida. St.','Penhold','AB'),('Sellers','Cherokee','Ap #402-3574 Tincidunt St.','Minto','ON'),('Hall','Thomas','P.O. Box 234, 7383 Orci Rd.','Drayton Valley','AB'),('Bauer','Ezekiel','P.O. Box 995, 2984 Est St.','Gloucester','ON');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Wyatt','Francis','8907 Sed Street','Greater Sudbury','ON'),('Jackson','Suki','Ap #334-155 Arcu Ave','Essex','ON'),('Hancock','Giselle','8372 Vulputate Avenue','Fort Laird','NT'),('Flowers','Alfonso','3805 Augue St.','Leamington','ON'),('Merritt','Hollee','P.O. Box 721, 3659 Felis. St.','Hope','BC'),('Mendoza','Myles','Ap #875-9014 Et Ave','Osgoode','ON'),('Carrillo','Xandra','P.O. Box 686, 3426 Et Avenue','Saint-Hilarion','QC'),('Mays','Lesley','P.O. Box 423, 8903 In Av.','Bathurst','NB'),('Jensen','Kimberley','351-4456 Quam, Av.','Vanier','ON'),('Carrillo','Quin','199-6305 Quisque St.','Blind River','ON');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Bond','Pandora','250-4569 Consectetuer Rd.','Caledon','ON'),('Ryan','Ciara','P.O. Box 221, 5408 Libero. St.','Tay','ON'),('Clayton','Edward','805-5395 Donec Ave','Beaconsfield','QC'),('Winters','Octavius','P.O. Box 912, 4259 Nullam Ave','Westmount','QC'),('Prince','Hammett','5768 Lectus. Ave','Senneville','QC'),('Lambert','Brenna','827-8519 Vulputate Street','Redwater','AB'),('Simpson','Phyllis','P.O. Box 198, 2572 Lacinia. St.','Etobicoke','ON'),('Murphy','Evangeline','Ap #277-1078 Ullamcorper, Ave','Verdun','QC'),('Love','Penelope','P.O. Box 613, 2224 Mauris, Av.','Pointe-au-Pic','QC'),('Jefferson','Victoria','Ap #197-2994 Eu Street','Shawinigan','QC');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Stein','Francesca','P.O. Box 996, 6957 Fermentum Rd.','Lang','SK'),('Oliver','Oscar','P.O. Box 903, 1205 Vitae, Street','Newbury','ON'),('Olson','Justina','Ap #583-3037 Sit Rd.','Oyen','AB'),('Riddle','Rudyard','4555 Ornare, Rd.','Orilla','ON'),('Wall','Victor','783-7918 Ut Avenue','Russell','ON'),('Patterson','Herman','5194 Risus. Av.','Campbellton','NB'),('Horton','Jacqueline','Ap #176-6499 Diam Street','Scarborough','ON'),('Mcintyre','Axel','Ap #764-6757 Massa Street','Anjou','QC'),('Henry','Micah','P.O. Box 676, 7418 Est. Street','Malbaie','QC'),('Avery','Marah','953-722 Vitae Road','Wilmont','ON');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Holland','Neve','505-2700 Erat Avenue','Nelson','BC'),('Carter','Macey','944-8247 Magna. Rd.','Cobourg','ON'),('Mcbride','Rosalyn','3916 Erat. Road','Sunshine Coast Regional District','BC'),('Mclean','Quynn','P.O. Box 973, 1411 Nunc Rd.','LaSalle','ON'),('Rhodes','Andrew','Ap #418-7050 Tempus Avenue','Tay','ON'),('Barron','Randall','Ap #952-199 Nulla St.','Malahide','ON'),('Wilcox','Colin','332-2031 Rhoncus. St.','LaSalle','ON'),('Gilbert','Noah','283-1964 Et, Rd.','Essex','ON'),('Miller','Wyatt','6701 A, Av.','Salt Spring Island','BC'),('Benson','Ulla','Ap #635-1637 Fringilla Road','Montebello','QC');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Singleton','Cassidy','7294 Tincidunt Ave','Lloydminster','AB'),('Walsh','Neville','614-8509 Imperdiet, Av.','Malahide','ON'),('Crosby','Zenaida','914-1932 Facilisis, Street','Vaughan','ON'),('Lane','Dustin','Ap #240-804 Magna. Road','Westmount','QC'),('Horn','Hope','P.O. Box 130, 7625 Nascetur Ave','Midlands','ON'),('Shepherd','Graiden','659-8425 Sit Av.','Whitehorse','YT'),('Mcmillan','Brianna','3986 Arcu Road','Belcarra','BC'),('Church','Castor','Ap #108-4122 Pede Road','Vanderhoof','BC'),('Roy','Sonya','348-9297 Dolor Rd.','Harrison Hot Springs','BC'),('Diaz','Henry','1372 Proin Av.','Shipshaw','QC');
INSERT INTO Student([LastName],[FirstName],[Address],[City],[Province]) VALUES('Barnes','Shafira','P.O. Box 491, 6613 Pellentesque Avenue','Warwick','ON'),('Stephens','Kenyon','P.O. Box 378, 7800 Aliquam St.','Houston','BC'),('Peterson','Kerry','P.O. Box 833, 8149 Vel St.','Caledon','ON'),('Rollins','Raven','842-618 Dolor Ave','Spaniard''s Bay','NL'),('Cummings','Ginger','779-6966 Vitae St.','Flin Flon','MB'),('Wolf','Cathleen','Ap #684-2742 Elit, St.','Rycroft','AB'),('Holder','Galvin','P.O. Box 661, 7671 Dignissim St.','Dubuisson','QC'),('Townsend','Dylan','848-699 Nisi Street','Guelph','ON'),('Beach','Kane','Ap #960-5528 Tortor, Rd.','Anjou','QC'),('Paul','MacKensie','P.O. Box 803, 3147 Dapibus Rd.','Cache Creek','BC');

INSERT INTO Student_Course([CourseCode],[StudentID]) VALUES('COMP123',75),('COMP123',76),('COMP123',77),('COMP123',78),('COMP123',79),('COMP123',80),('COMP123',81),('COMP123',82),('COMP123',83),('COMP123',84),('COMP123',85),('COMP123',86),('COMP123',87),('COMP123',88),('COMP123',89),('COMP123',90),('COMP123',91),('COMP123',92),('COMP123',93),('COMP123',94),('COMP123',95),('COMP123',96),('COMP123',97),('COMP123',98),('COMP123',99);
INSERT INTO Student_Course([CourseCode],[StudentID]) VALUES('COMP255',75),('COMP255',76),('COMP255',77),('COMP255',78),('COMP255',79),('COMP255',80),('COMP255',81),('COMP255',82),('COMP255',83),('COMP255',84),('COMP255',85),('COMP255',86),('COMP255',87),('COMP255',88),('COMP255',89),('COMP255',90),('COMP255',91),('COMP255',92),('COMP255',93),('COMP255',94),('COMP255',95),('COMP255',96),('COMP255',97),('COMP255',98),('COMP255',99);
INSERT INTO Student_Course([CourseCode],[StudentID]) VALUES('STAT120',75),('STAT120',76),('STAT120',77),('STAT120',78),('STAT120',79),('STAT120',80),('STAT120',81),('STAT120',82),('STAT120',83),('STAT120',84),('STAT120',85),('STAT120',86),('STAT120',87),('STAT120',88),('STAT120',89),('STAT120',90),('STAT120',91),('STAT120',92),('STAT120',93),('STAT120',94),('STAT120',95),('STAT120',96),('STAT120',97),('STAT120',98),('STAT120',99);
INSERT INTO Student_Course([CourseCode],[StudentID]) VALUES('CMDB600',50),('CMDB600',51),('CMDB600',52),('CMDB600',53),('CMDB600',54),('CMDB600',55),('CMDB600',56),('CMDB600',57),('CMDB600',58),('CMDB600',59),('CMDB600',60),('CMDB600',61),('CMDB600',62),('CMDB600',63),('CMDB600',64),('CMDB600',65),('CMDB600',66),('CMDB600',67),('CMDB600',68),('CMDB600',69),('CMDB600',70),('CMDB600',71),('CMDB600',72),('CMDB600',73),('CMDB600',74);
INSERT INTO Student_Course([CourseCode],[StudentID]) VALUES('CMDB600',25),('CMDB600',26),('CMDB600',27),('CMDB600',28),('CMDB600',29),('CMDB600',30),('CMDB600',31),('CMDB600',32),('CMDB600',33),('CMDB600',34),('CMDB600',35),('CMDB600',36),('CMDB600',37),('CMDB600',38),('CMDB600',39),('CMDB600',40),('CMDB600',41),('CMDB600',42),('CMDB600',43),('CMDB600',44),('CMDB600',45),('CMDB600',46),('CMDB600',47),('CMDB600',48),('CMDB600',49);
INSERT INTO Student_Course([CourseCode],[StudentID]) VALUES('COMP123',1),('COMP123',2),('COMP123',3),('COMP123',4),('COMP123',5),('COMP123',6),('COMP123',7),('COMP123',8),('COMP123',9),('COMP123',10),('COMP123',11),('COMP123',12),('COMP123',13),('COMP123',14),('COMP123',15),('COMP123',16),('COMP123',17),('COMP123',18),('COMP123',19),('COMP123',20),('COMP123',21),('COMP123',22),('COMP123',23),('COMP123',24),('COMP123',25);
INSERT INTO Student_Course([CourseCode],[StudentID]) VALUES('STAT120',1),('STAT120',2),('STAT120',3),('STAT120',4),('STAT120',5),('STAT120',6),('STAT120',7),('STAT120',8),('STAT120',9),('STAT120',10),('STAT120',11),('STAT120',12),('STAT120',13),('STAT120',14),('STAT120',15),('STAT120',16),('STAT120',17),('STAT120',18),('STAT120',19),('STAT120',20),('STAT120',21),('STAT120',22),('STAT120',23),('STAT120',24),('STAT120',25);

