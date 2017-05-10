drop if exists u,t;
CREATE TABLE t(i int PRIMARY KEY, j int, k int);
CREATE TABLE u(i int, j int, k int);
ALTER TABLE u ADD constraint fk_t_u_i FOREIGN KEY(i) REFERENCES t(i);
CREATE INDEX i_u_j ON u(j);


INSERT INTO t SELECT ROWNUM, ROWNUM, ROWNUM FROM db_root connect by level<=10;
INSERT INTO u SELECT 1+(ROWNUM % 10), ROWNUM, ROWNUM FROM db_root connect by level<=50;

prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT ?';
execute stmt using 5; 
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT ?, ?';
execute stmt using 0,5;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT ?-?,?';
execute stmt using 2,2,5;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT ?-?,?*?';
execute stmt using 2,1,5,1;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT 2-?,10/?';
execute stmt using 1,2;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT 5';
execute stmt;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT 0, 5';
execute stmt;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT 2-2,5';
execute stmt;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT 2-1,5*1';
execute stmt;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 ORDER BY u.j LIMIT 2-1,10/2';
execute stmt;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 using index i_u_j keyLIMIT 2-?,?/2';
execute stmt using 1,10;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 using index i_u_j keyLIMIT ?,?';
execute stmt using 0,5;
prepare stmt from 'SELECT /*+ RECOMPILE */ * FROM u, t WHERE u.i = t.i AND u.j > 10 using index i_u_j keyLIMIT ?-?,?*?';
execute stmt using 2,1,5,1;
deallocate prepare stmt;
drop if exists u,t;
