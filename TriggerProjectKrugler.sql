## I wanted to make note of when new tours were added or if any tours needed to update information. It is important to keep up to date with the various tours to best inform Texino's customers what routes are best for them. ##

CREATE TABLE new_tours_log (
User VARCHAR(255),
TourID INT (11),
TourName VARCHAR(255),
TourType VARCHAR(255),
OldTourDuration INT(11),
NewTourDuration INT(11),
LogDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

DROP TRIGGER IF EXISTS new_tours_after_update$$

CREATE TRIGGER new_tours_after_update
	AFTER UPDATE ON Tours
	FOR EACH ROW
BEGIN
	INSERT INTO new_tours_log
	(User, TourID, TourName, TourType, OldTourDuration, NewTourDuration)
	VALUES 
	(USER(), OLD.TourID, OLD.TourName, OLD.TourType, OLD.TourDuration, NEW.TourDuration);

END$$
DELIMITER ;

UPDATE Tours
SET TourDuration = 42 
WHERE TourID = 100
	AND TourName LIKE 'Grand%';

SELECT *
FROM new_tours_log;


/*

DROP TABLE IF EXISTS vanlife_forum_Log;

CREATE TABLE vanlife_forum_Log (
User VARCHAR(255),
Members_name VARCHAR (255),
Members_Date VARCHAR(255),
NewMembers_name VARCHAR(255),
NewMembers_Date VARCHAR(255),
LogDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

DROP TRIGGER IF EXISTS vanlife_forum_after_update$$

CREATE TRIGGER vanlife_forum_after_update
	AFTER UPDATE ON vanlife_forum 
	FOR EACH ROW
BEGIN
	INSERT INTO vanlife_forum_Log 
	(User, Members_name, Members_Date)
	VALUES 
	(USER(), OLD.Members_name, OLD.Members_Date, NEW.Members_name, NEW.Members_Date);

END$$
DELIMITER ;

UPDATE vanlife_forum
SET Members_name = 'Scott K'
WHERE Members_url = 'https://www.meetup.com/VanlifeConnections/members/189531898/'
	;

SELECT *
FROM vanlife_forum_Log;



CREATE TABLE new_tours_log (
User VARCHAR(255),
TourID INT (11),
TourName VARCHAR(255),
TourType VARCHAR(255),
OldTourDuration INT(11),
NewTourDuration INT(11),
LogDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

DROP TRIGGER IF EXISTS new_tours_after_update$$

CREATE TRIGGER new_tours_after_update
	AFTER UPDATE ON Tours
	FOR EACH ROW
BEGIN
	INSERT INTO new_tours_log
	(User, TourID, TourName, TourType, OldTourDuration, NewTourDuration)
	VALUES 
	(USER(), OLD.TourID, OLD.TourName, OLD.TourType, OLD.TourDuration, NEW.TourDuration);

END$$
DELIMITER ;

UPDATE Tours
SET TourDuration = 42 
WHERE TourID = 100
	AND TourName LIKE 'Grand%';

SELECT *
FROM new_tours_log;
*/