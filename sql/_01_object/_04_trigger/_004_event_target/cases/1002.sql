--Create trigger on target class


CREATE CLASS DCL1;	
CREATE TRIGGER DCL1	
BEFORE UPDATE ON DCL1	
EXECUTE REJECT;	
	

DROP TRIGGER DCL1;
DROP CLASS DCL1;	
