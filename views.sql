-- Making sure we use the right schema
USE `csci402_project_schema`; 

-- View 1: Project Funding Summary
CREATE OR REPLACE VIEW view_project_funding_summary AS
SELECT
  p.project_id,
  p.project_name,
  COALESCE(p.funds_recovered,0) AS funds_recovered,
  COALESCE(SUM(d.amount_donated),0) AS total_donations,
  COALESCE(p.funds_recovered,0) + COALESCE(SUM(d.amount_donated),0) AS funds_available
FROM project_plan p
LEFT JOIN donation d ON p.project_id = d.project_id
GROUP BY p.project_id, p.project_name, p.funds_recovered;

-- View 2: Assigment schedule with project and village
CREATE OR REPLACE VIEW view_assignment_schedule AS
SELECT
  a.assigment_id,
  a.request_id,
  a.start_date,
  a.end_date,
  a.location AS assignment_location,
  a.project_id,
  p.project_name,
  r.project_request,
  v.village_id,
  v.village_name
FROM assigment a
LEFT JOIN project_plan p ON a.project_id = p.project_id
LEFT JOIN request r ON a.request_id = r.request_id
LEFT JOIN village v ON r.village_id = v.village_id;

-- View 3: Volunteer list with expertise name and role
CREATE OR REPLACE VIEW view_volunteer AS
SELECT
  v.volunteer_id,
  v.volunteer_name,
  v.volunteer_email,
  v.volunteer_type,
  e.name AS expertise_name,
  CASE WHEN ex.volunteer_id IS NOT NULL THEN 'Expert' WHEN ne.volunteer_id IS NOT NULL 
  THEN 'Non-Expert' ELSE 'Unknown' END AS subtype
FROM volunteer v
LEFT JOIN expertise e ON v.expertise_id = e.expertise_id
LEFT JOIN expert ex ON v.volunteer_id = ex.volunteer_id
LEFT JOIN non_expert ne ON v.volunteer_id = ne.volunteer_id;