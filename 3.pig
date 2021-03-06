pro = load  '/project/fin'  using  PigStorage('\t')  AS (s_no:int,case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray,prevailing_wage:long,year:int, worksite:chararray, longitute:long, latitute:long);
--dump pro;
soc = filter pro by job_title == 'DATA SCIENTIST' and case_status == 'CERTIFIED';
--dump soc;
grp = group soc by $3;
--dump grp;
cou = foreach grp generate $0, COUNT(soc.job_title) as tot;
--dump cou;
od = order cou by tot desc;
--dump od;
li = limit od 1;
dump li;
