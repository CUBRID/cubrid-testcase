CREATE TABLE 테이블;
ALTER TABLE 테이블 ADD COLUMN 나이 INT DEFAULT 0 NOT NULL;
INSERT INTO 테이블(나이) VALUES(20),(30),(40);
ALTER TABLE 테이블 ADD COLUMN 이름 VARCHAR FIRST;
ALTER TABLE 테이블 ADD COLUMN 신분증 INT NOT NULL AUTO_INCREMENT UNIQUE;
ALTER TABLE 테이블 ADD COLUMN 전화 VARCHAR(13) DEFAULT '000-0000-0000' AFTER 이름; 
ALTER TABLE 테이블 ADD INDEX (ln(나이));
SELECT /*+ RECOMPILE */* FROM 테이블 where ln(나이)>1;

drop table 테이블;