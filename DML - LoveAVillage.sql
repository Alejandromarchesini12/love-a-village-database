-- Sample data for `csci402_project_schema`
-- Generated for MySQL Workbench; inserts ~12 rows per table

USE `csci402_project_schema`;

-- Now insert data. Order is parent -> child so FK checks will be satisfied.
SET FOREIGN_KEY_CHECKS=0;

-- project_plan (12 rows)
INSERT INTO project_plan (project_id, project_name, project_type, funds_recovered) VALUES
('P000000001','Clean Water Initiative','Install wells and filtration systems',10000.00),
('P000000002','Solar School','Provide solar panels and training',25000.00),
('P000000003','Tree Planting','Reforestation and community training',5000.00),
('P000000004','Health Outreach','Mobile clinics and vaccines',15000.00),
('P000000005','Sanitation Upgrade','Build latrines and sewer improvements',12000.00),
('P000000006','Agriculture Support','Seeds, tools and training',8000.00),
('P000000007','ICT Lab','Create a computer lab for local school',18000.00),
('P000000008','Women Empowerment','Microloans and workshops',9000.00),
('P000000009','Road Repair','Repair village access roads',22000.00),
('P000000010','Market Construction','Build covered market stalls',11000.00),
('P000000011','Nutrition Program','Child nutrition and education',7000.00),
('P000000012','Flood Defenses','Construct simple levees and drains',14000.00);

-- village (12 rows)
INSERT INTO village (village_id, village_name, longitude, latitude, village_size) VALUES
('V000000001','Riverside',-82.9001,34.2001,850),
('V000000002','Hilltop',-82.9123,34.2105,420),
('V000000003','Greenfield',-82.8900,34.1800,1200),
('V000000004','Seaside',-82.9400,34.2500,980),
('V000000005','Oak Grove',-82.8800,34.1700,560),
('V000000006','Sunnyvale',-82.8700,34.1600,340),
('V000000007','Lakeside',-82.8600,34.1550,1400),
('V000000008','Maple Town',-82.8500,34.1450,760),
('V000000009','Pine Hill',-82.8450,34.1400,620),
('V000000010','Cedar Point',-82.8400,34.1350,430),
('V000000011','Willow Bend',-82.8350,34.1300,980),
('V000000012','Stonebridge',-82.8300,34.1250,2100);

-- donor (12 rows)
INSERT INTO donor (donor_id, donor_name, donor_email) VALUES
('D000000001','Acme Foundation','contact@acme.org'),
('D000000002','GreenTrust','hello@greentrust.org'),
('D000000003','Community Aid','info@comm-aid.org'),
('D000000004','Smith Family','smiths@example.com'),
('D000000005','GlobalHands','donate@globalhands.org'),
('D000000006','BrightFuture','bf@bright.org'),
('D000000007','FarmersUnited','contact@farmersunited.org'),
('D000000008','Tech4All','support@tech4all.org'),
('D000000009','HealthBridge','gifts@healthbridge.org'),
('D000000010','WomenFund','support@womenfund.org'),
('D000000011','RoadsForAll','donate@roadsforall.org'),
('D000000012','WaterWorks','hello@waterworks.org');

-- expertise (12 rows)
INSERT INTO expertise (expertise_id, name, description, team_size, project_id) VALUES
('E000000001','Hydrology','Water resource specialists',6,'P000000001'),
('E000000002','SolarTech','Solar installation team',8,'P000000002'),
('E000000003','Forestry','Tree planting and care',5,'P000000003'),
('E000000004','Medical','Mobile clinic staff',10,'P000000004'),
('E000000005','Sanitation','Sanitation engineers',4,'P000000005'),
('E000000006','Agro','Agricultural extension',7,'P000000006'),
('E000000007','IT','ICT trainers and techs',5,'P000000007'),
('E000000008','Microfinance','Loan officers',4,'P000000008'),
('E000000009','Civil','Road construction team',9,'P000000009'),
('E000000010','Construction','Market builders',6,'P000000010'),
('E000000011','Nutrition','Dietitians and educators',5,'P000000011'),
('E000000012','Hydraulics','Flood defense engineers',7,'P000000012');

-- volunteer (12 rows) — mix of experts and non-experts
INSERT INTO volunteer (volunteer_id, volunteer_name, volunteer_email, volunteer_phone, location, volunteer_type, availability, expertise_id, birthdate) VALUES
('VLT0000001','Alice Johnson','alice.j@example.com','555-0101','Riverside','Expert','2026-01-10','E000000001','1986-05-12'),
('VLT0000002','Bob Martinez','bob.m@example.com','555-0102','Hilltop','Expert','2026-02-01','E000000002','1979-11-03'),
('VLT0000003','Carol Wang','carol.w@example.com','555-0103','Greenfield','Expert','2026-03-15','E000000003','1990-07-21'),
('VLT0000004','David Lee','david.l@example.com','555-0104','Seaside','Expert','2026-01-05','E000000004','1982-02-02'),
('VLT0000005','Eva Patel','eva.p@example.com','555-0105','Oak Grove','Non-Expert','2026-04-20','E000000005','1995-09-10'),
('VLT0000006','Frank O''Neil','frank.o@example.com','555-0106','Sunnyvale','Non-Expert','2026-05-03','E000000006','1998-12-30'),
('VLT0000007','Grace Kim','grace.k@example.com','555-0107','Lakeside','Expert','2026-06-11','E000000007','1988-08-17'),
('VLT0000008','Hassan Ali','hassan.a@example.com','555-0108','Maple Town','Non-Expert','2026-02-23','E000000008','1992-03-04'),
('VLT0000009','Isabel Cruz','isabel.c@example.com','555-0109','Pine Hill','Non-Expert','2026-03-30','E000000009','1991-06-29'),
('VLT0000010','John Doe','john.d@example.com','555-0110','Cedar Point','Expert','2026-01-20','E000000010','1975-10-12'),
('VLT0000011','Kavita Rao','kavita.r@example.com','555-0111','Willow Bend','Expert','2026-07-01','E000000011','1984-04-08'),
('VLT0000012','Liam O''Connor','liam.o@example.com','555-0112','Stonebridge','Non-Expert','2026-08-15','E000000012','1996-01-22');

-- request (12 rows) — each tied to a village
INSERT INTO request (request_id, project_request, village_id) VALUES
('R00000001','Need clean drinking water and filtration systems','V000000001'),
('R00000002','School needs reliable electricity via solar','V000000002'),
('R00000003','Request assistance for tree planting around riverbanks','V000000003'),
('R00000004','Request mobile clinic visits and vaccination drives','V000000004'),
('R00000005','Urgent sanitation improvements required','V000000005'),
('R00000006','Support for improved farming techniques and seeds','V000000006'),
('R00000007','Request for community ICT training and hardware','V000000007'),
('R00000008','Women need small loan programs and training','V000000008'),
('R00000009','Access road is in poor condition and needs repair','V000000009'),
('R00000010','Market space requested for local vendors','V000000010'),
('R00000011','Child malnutrition concerns, seek nutrition program','V000000011'),
('R00000012','Recurring floods — need simple levees and drains','V000000012');

-- assigment (12 rows) — assignments referencing requests and projects
INSERT INTO assigment (assigment_id, request_id, start_date, end_date, location, project_id) VALUES
('A00000001','R00000001','2026-02-01','2026-06-01','Riverside community center','P000000001'),
('A00000002','R00000002','2026-03-01',NULL,'Hilltop primary school','P000000002'),
('A00000003','R00000003','2026-04-15','2026-05-30','Greenfield riverbanks','P000000003'),
('A00000004','R00000004','2026-02-20','2026-03-05','Seaside clinic route','P000000004'),
('A00000005','R00000005','2026-05-01',NULL,'Oak Grove sanitation sites','P000000005'),
('A00000006','R00000006','2026-03-10','2026-04-30','Sunnyvale agriculture plots','P000000006'),
('A00000007','R00000007','2026-06-01',NULL,'Lakeside school hall','P000000007'),
('A00000008','R00000008','2026-04-01','2026-09-01','Maple Town training center','P000000008'),
('A00000009','R00000009','2026-05-10','2026-08-15','Pine Hill access road','P000000009'),
('A00000010','R00000010','2026-03-20','2026-06-20','Cedar Point market area','P000000010'),
('A00000011','R00000011','2026-02-05','2026-05-05','Willow Bend health posts','P000000011'),
('A00000012','R00000012','2026-07-01',NULL,'Stonebridge flood plain','P000000012');

-- donation (12 rows) — donations linking donors and projects
INSERT INTO donation (donation_id, donor_id, project_id, amount_donated, donation_date) VALUES
('DN0000001','D000000001','P000000001',5000.00,'2025-12-01'),
('DN0000002','D000000002','P000000002',12000.00,'2025-11-15'),
('DN0000003','D000000003','P000000003',2500.00,'2025-10-30'),
('DN0000004','D000000004','P000000004',3000.00,'2025-12-02'),
('DN0000005','D000000005','P000000005',4000.00,'2025-09-20'),
('DN0000006','D000000006','P000000006',1500.00,'2025-08-10'),
('DN0000007','D000000007','P000000007',8000.00,'2025-11-01'),
('DN0000008','D000000008','P000000008',2000.00,'2025-10-05'),
('DN0000009','D000000009','P000000009',10000.00,'2025-12-03'),
('DN0000010','D000000010','P000000010',2500.00,'2025-09-30'),
('DN0000011','D000000011','P000000011',3500.00,'2025-10-12'),
('DN0000012','D000000012','P000000012',7000.00,'2025-11-20');

-- expert (for volunteers designated as experts)
INSERT INTO expert (volunteer_id, expertise_area, certifications, years_of_experience) VALUES
('VLT0000001','Hydrology',2,8),
('VLT0000002','Solar Installation',3,12),
('VLT0000003','Forestry Management',1,6),
('VLT0000004','General Medicine',2,10),
('VLT0000007','IT Training',1,5),
('VLT0000010','Construction Management',2,18),
('VLT0000011','Nutrition',2,9);

-- non_expert (for volunteers designated as non-experts)
INSERT INTO non_expert (volunteer_id, skills) VALUES
('VLT0000005','Sanitation site assistance'),
('VLT0000006','Seed distribution and field support'),
('VLT0000008','Training logistics'),
('VLT0000009','Road clearing and manual labor'),
('VLT0000012','Community outreach and translation');

SET FOREIGN_KEY_CHECKS=1;

-- End of loveAVillage seed data
