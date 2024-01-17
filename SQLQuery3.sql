




use Test2;
Create table Details (
FirstName Varchar (50),
MaritalStatus Varchar (2),
Gender varchar (2),
Income integer,
Children integer,
Education Varchar (30),
Occupation Varchar (20),
Homeowner  Varchar (5),
Cars  Varchar (10),
Communtedistance Varchar (15),
Region   Varchar (20));

insert into Details 
(FirstName, MaritalStatus, Gender, Income, Children, Education, Occupation, Homeowner, Cars, communtedistance, Region) values
('Jackie Gloria', 'M', 'F', 40000, 1, 'Bachelors', 'Skilled Manual', 'Yes', 0, '0-1 Miles', 'Europe'),
('Jack Emmanuel', 'M', 'M', 30000, 3, 'Partial College', 'Clerical', 'Yes', 1, '0-1 Miles', 'Europe'),
('Priscilia Ella', 'M', 'M', 80000, 5, 'Partial College', 'Professional', 'No', 2, '2-5 Miles', 'Europe'),
('Jack Hue', 'S', 'M', 70000, 3, 'Barchelors', 'Professional', 'Yes', 1, '5-10 Miles', 'Pacific'),
('Oknokwo Henry', 'S', 'M', 30000, 0, 'Barchelors', 'Clerical', 'No', 0, '0-1 Miles', 'Europe'),
('Mickie Jerry', 'M', 'F', 10000, 2, 'Partial College', 'CManual', 'Yes', 0, '1-2 Miles', 'Europe'),
('Love Eve', 'S', 'M', 160000, 2, 'High School', 'Management', 'Yes', 4, '0-1 Miles', 'Europe'),
('Ike Solomon', 'M', 'M', 40000, 1, 'Barchelors', 'Skilled Manual ', 'Yes', 0, '0-1 Miles', 'Europe'),
('Fatai Ibrahim', 'M', 'M', 20000, 2, 'Partial High School', 'Clerical', 'Yes', 2, '5-10 Miles', 'Pacific'),
('Tolu Joshual', 'M', 'M', 120000, 2, 'Partial College', 'Manual', 'Yes', 1, '0-1 Miles', 'Europe'),
('Chioma Oge', 'M', 'FM', 30000, 3, 'High School', 'Skilled Manual ', 'No', 2, '1-2 Miles', 'Pacific'),
('Paulina Isaac', 'S', 'F', 90000, 0, 'HBachelors', 'Professional', 'No',4 , '10+ Miles', 'Pacific'),
('Jack Ogechi', 'M', 'M', 170000, 3, 'Partial College', 'Professional', 'Yes', 0, '0-1 Miles', 'Europe'),
('Prince Dan', 'M', 'M', 40000, 2, 'Partial College', 'Clerical', 'Yes', 1, '1-2 Miles', 'Europe'),
('Daniel Ibukun', 'S', 'M', 60000, 1, 'Partial College', 'Skilled Manual', 'No', 1, '0-1 Miles', 'Pacific'),
('Glory Emeka', 'S', 'F', 10000, 2, 'High School', 'Manual', 'Yes', 1, '0-1 Miles', 'Europe'),
('Anthony Ike', 'S', 'M', 30000, 3, 'Partial College', 'Clerical', 'No', 2, '1-2 Miles', 'Pacific'),
('Eve Issa', 'S', 'M', 30000, 3, 'Bachelors', 'Clerical', 'Yes', 0, '0-1 Miles', 'Europe'),
('Issa Musa', 'S', 'M', 40000, 2, 'Partial College', 'Clerical', 'Yes', 1, '1-2 Miles', 'Europe'),
('Emeka Dike', 'S', 'M', 20000, 3, 'Partial College', 'Clerical', 'Yes', 1, '0-1 Miles', 'Europe'),
('Praise Dike', 'M', 'F', 40000, 3, 'Graduate Degree', 'Clerical', 'Yes', 0, '0-1 Miles', 'Europe'),
('Chisom Ken', 'S', 'M', 80000, 0, 'Bachelor', 'Professional', 'Yes', 4, '10+ Miles', 'Pacific'),
('Ebuka Paul', 'S', 'M', 40000, 2, 'Partial College', 'Clerical', 'Yes', 0, '1-2 Miles', 'Europe'),
('Emma Helen', 'M', 'F', 80000, 3, 'High School', 'Management', 'No', 3, '5-10 Miles', 'Europe');

Select * From Details;
Select * From Details Where Gender = 'F';
Select * From Details Where Gender = 'M';
Select * From Details Where Cars= 0;
Select * From Details Where Communtedistance > '1-2 Miles';
Select * From Details Where region = 'Europe';
Select * From Details Where MaritalStatus = 'S';
Select * From Details Where MaritalStatus = 'M';
Select * From Details Where MaritalStatus = 'S';
Select * From Details Where Gender = 'M' AND Education = 'Barchelors' AND Income > 50000;
Select * From Details Where Gender = 'F' AND Education = 'High School' AND Income < 70000;
Select * From Details Where Children = 0;
Drop table Details
