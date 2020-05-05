## I wanted to find a way to reach out to those who are in need of affordable housing and wouldnt mind being somewhat self sustaining. Although the lifestyle is a bit unique I think a lot of people would enjoy the liberty of it and gain a new understanding to life and the natural world that surrounds us. 

DELIMITER $$

DROP PROCEDURE IF EXISTS getAlternativeHousing$$

CREATE PROCEDURE getAlternativeHousing(IN inSiteNumber INT, OUT outAlternativeHousingStatus VARCHAR(255))

	SET @SiteNumber := inSiteNumber;
	
CASE @DevelopmentStage 
	WHEN 'In-Service' THEN 
		SET outAlternativeHousingStatus := 0;
	WHEN 'Development' THEN
		SET outAlternativeHousingStatus := 1;
	ELSE 
		SET outAlternativeHousingStatus := 0;
END CASE;


	SELECT DevelopmentStage
	 		INTO outAlternativeHousingStatus
	WHERE DevelopmentStage = 'In-Service'
	FROM affordable_housing;
END$$

DELIMITER ;

CALL getAlternativeHousing(7, @HousingStatus); 

SELECT @HousingStatus;

## Failed attempts but I find value in my mistakes and try to learn the best I can from them.

/*
DELIMITER $$

DROP PROCEDURE IF EXISTS getHousingCount$$


CREATE PROCEDURE getHousingCount(IN inTotalProjects INT, inDateYear DATE)
BEGIN 

	SET @countProjects := inTotalProjects;
	SET @PerYear := inDateYear;
	

		SELECT  COUNT(*)
		FROM affordable_housing 
		WHERE @countTotalProjects >=25
END$$

DELIMITER ;

CALL getHousingCount(10);

SELECT out_SiteName

DELIMITER $$

DROP PROCEDURE IF EXISTS getAlternativeHousing$$

CREATE PROCEDURE getAlternativeHousing(in_developmentStage VARCHAR(255), in_SiteNumber INT, OUT out_SiteName VARCHAR(255))
BEGIN 
	SET @development_stage := in_developmentStage;
	SET @site_number := in_SiteNumber;
	SET @site_name := out_SiteName;

	SELECT * 
	FROM affordable_housing
	WHERE @development_stage = 'In-Service';
END$$

DELIMITER ;

CALL getAlternativeHousing('Development', 1, 'BRICKER');
*/

