DELIMITER ;;
CREATE PROCEDURE agentcodelike()
BEGIN
DECLARE end INT DEFAULT 0;
DECLARE name VARCHAR(40);
DECLARE city VARCHAR(35);
DECLARE cou VARCHAR(20);
DECLARE grade decimal(10,0);
DECLARE cust_cur CURSOR FOR
select CUST_NAME,CUST_CITY,CUST_COUNTRY,GRADE from customer where  AGENT_CODE LIKE 'A00%';

DECLARE CONTINUE HANDLER FOR NOT FOUND SET end=1;
OPEN cust_cur;
looping:LOOP
IF end=1 THEN
LEAVE looping;
END IF;
FETCH CUST_CUR INTO name,city,cou,grade;
select name,city,cou,grade;
END LOOP looping;
CLOSE cust_cur;
END;;
