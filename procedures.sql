-- Sample data for `csci402_project_schema`
-- Generated for MySQL Workbench; inserts ~12 rows per table

USE `csci402_project_schema`;

DELIMITER $$

-- Procedure: returns project funding summary
CREATE PROCEDURE sp_get_project_funding_summary(
  IN p_project_id CHAR(10)
)
BEGIN
  SELECT * FROM view_project_funding_summary WHERE project_id = p_project_id;
END$$

DELIMITER ;
