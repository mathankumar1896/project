pro = load  '/project/fin'  using  PigStorage('\t')  AS (s_no:int,case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray,prevailing_wage:long,year:int, worksite:chararray, longitute:long, latitute:long);
--dump pro;
grp1 = group pro by ($1,$7);
--dump grp1;
fla = foreach grp1 generate flatten(group), (float)COUNT(pro.case_status);
--dump fla;
kk = group pro by year;
--dump kk;
fd = foreach kk generate $0, (float)COUNT(pro.$1);
--dump fd;
de = join fla by $1, fd by $0;
--dump de;
fr = foreach de generate $0,$1,$2,$4;
--dump fr;
fi = foreach fr generate $0,$1,$2, ROUND_TO((($2/$3)*100),2);
--dump fi;
om = order fi by $0 asc,$1 asc;
dump om;
store om into '/home/hduser/Downloads/6ans';



