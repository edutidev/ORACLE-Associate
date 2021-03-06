spool t0
set echo on

declare
  ORA_00942 exception; pragma Exception_Init(ORA_00942, -00942);
begin
  execute immediate 'drop table tab_corr1';
  exception when ORA_00942 then null;
end;
/

create table tab_corr1 as
select rownum n0,
       mod(rownum,10) n1,
       mod(rownum,10) n2
from   (select 1 from dual connect by rownum<10000);


exec dbms_stats.gather_table_stats(user,'tab_corr1')

spool off
