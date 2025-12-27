-- Making sure we use the right schema
USE `csci402_project_schema`; 

-- Test 1: Volunteer exclusivity (either Expert or Non-Expert, not both)
-- Expectation: 0 rows returned
SELECT e.volunteer_id AS in_both
FROM expert e
JOIN non_expert ne ON e.volunteer_id = ne.volunteer_id; 

-- Test 2: Every volunteer appears in exactly one of expoert or non_expert
-- Expectation: zero rows return (no volunteer missing from any of both)
SELECT v.volunteer_id, v.volunteer_name
FROM volunteer v
LEFT JOIN non_expert ne ON v.volunteer_id = ne.volunteer_id
LEFT JOIN expert e ON v.volunteer_id = e.volunteer_id
WHERE e.volunteer_id IS NULL AND ne.volunteer_id IS NULL;

-- Test 3: Expertise with out volunteer 
-- Expectation: 0 rows expected
SELECT ex.expertise_id
FROM expertise ex
LEFT JOIN volunteer v ON v.expertise_id = ex.expertise_id
GROUP BY ex.expertise_id
HAVING COUNT(v.volunteer_id) = 0; 

-- Test 4: Volunteer belongs to only one expertise 
-- Expectation: 0 rows returned 
SELECT v.volunteer_id, COUNT(DISTINCT v.expertise_id) AS expertise_count
FROM volunteer v
GROUP BY v.volunteer_id
HAVING COUNT(DISTINCT v.expertise_id) > 1;

-- Test 5: Project Plan includes one or many expertise 
-- Expectation: 0 rows
SELECT p.project_id
FROM project_plan p
LEFT JOIN expertise e ON e.project_id = p.project_id
GROUP BY p.project_id
HAVING COUNT(e.expertise_id) = 0;

-- Test 6: Donations referencing missing donor or project
-- Expectations: 0 rows
SELECT d.donation_id
FROM donation d
LEFT JOIN donor dr ON d.donor_id = dr.donor_id
LEFT JOIN project_plan p ON d.project_id = p.project_id
WHERE dr.donor_id IS NULL OR p.project_id IS NULL;

-- Test 7: Donors with zero donations 
-- Expectation: 0 rows
SELECT dr.donor_id
FROM donor dr
LEFT JOIN donation d ON dr.donor_id = d.donor_id
GROUP BY dr.donor_id
HAVING COUNT(d.donation_id) = 0; 

-- Test 8: Request fulfills only 1 assigment, an assigment is only assiogned to a request
-- Expectation: 0 rows
SELECT r.request_id, COUNT(a.assigment_id) AS assignment_count
FROM request r
LEFT JOIN assigment a ON r.request_id = a.request_id
GROUP BY r.request_id
HAVING COUNT(a.assigment_id) <> 1; 

-- Test 9: Assigments refernece to a valid project plan 
-- Expectation: 0 rows 
SELECT a.assigment_id
FROM assigment a
LEFT JOIN project_plan p ON a.project_id = p.project_id
WHERE p.project_id IS NULL; 

-- Test 10: Projects must have one or many assigments
-- Expectation: 0 rows
SELECT p.project_id 
FROM project_plan p 
LEFT JOIN assigment a ON p.project_id = a.project_id
GROUP BY p.project_id
HAVING COUNT(a.assigment_id) = 0; 

-- Test 11: Request belong to exactly one village
-- Expectation: 0 rows
SELECT r.request_id, COUNT(DISTINCT r.village_id) AS village_count
FROM request r
GROUP BY r.request_id
HAVING COUNT(DISTINCT r.village_id) <> 1; 

-- Test 12: A donation funs only one project
-- Expectation: 0 rows
SELECT d.donation_id, COUNT(DISTINCT d.project_id) AS project_count
FROM donation d
GROUP BY d.donation_id
HAVING COUNT(DISTINCT d.project_id) > 1; 

-- Test 13: A donation comes from only one donor
-- Expectation: 0 rows
SELECT d.donation_id, COUNT(DISTINCT d.donor_id) AS donor_count
FROM donation d 
GROUP BY d.donation_id
HAVING COUNT(DISTINCT d.donor_id) > 1; 

-- Test 14: Total donations per donor 
-- Expectation: returns each donor with total donated amount
SELECT dr.donor_id, dr.donor_name,
COALESCE(SUM(d.amount_donated),0) AS total_donated
FROM donor dr
LEFT JOIN donation d ON dr.donor_id = d.donor_id
GROUP BY dr.donor_id, dr.donor_name
ORDER BY total_donated DESC;

-- Test 15: Volunteers available per project 
-- Expectation: returns each project with the numbers of volunteers available
SELECT p.project_id, p.project_name, COUNT(v.volunteer_id) AS volunteer_count
FROM project_plan p
LEFT JOIN expertise ex ON ex.project_id = p.project_id
LEFT JOIN volunteer v ON v.expertise_id = ex.expertise_id
GROUP BY p.project_id, p.project_name
ORDER BY volunteer_count DESC, p.project_id;

-- Test 16: Average years of experience for experts in expertise
-- Expectation: returns expertise areas with average years 
SELECT ex.expertise_id, ex.name AS expertise_name, 
AVG(er.years_of_experience) AS avg_years_experience, COUNT(er.volunteer_id) AS num_experts
FROM expertise ex
JOIN volunteer v ON v.expertise_id = ex.expertise_id
JOIN expert er ON er.volunteer_id = v.volunteer_id
GROUP BY ex.expertise_id, ex.name
ORDER BY avg_years_experience DESC;