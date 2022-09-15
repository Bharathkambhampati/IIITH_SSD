DELIMITER ;;
CREATE PROCEDURE Lives_in_bangalore(IN area VARCHAR(35))
BEGIN
select CUST_NAME from customer where WORKING_AREA=area;
END;;
