pro = load  '/project/fin'  using  PigStorage('\t')  AS (s_no:int,case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray,prevailing_wage:long,year:int, worksite:chararray, longitute:long, latitute:long);
--dump pro;
kk = filter pro by year == 2011;
--dump kk;
ff = group kk by job_title;
--dump ff;
ss = foreach ff generate $0, (float)COUNT(kk.$1);
--dump ss;
kk12 = filter pro by year == 2012;
--dump kk12;
ff12 = group kk12 by job_title;
--dump ff12;
ss12 = foreach ff12 generate $0, (float)COUNT(kk12.$1);
--dump ss12;
jo = join ss by $0,ss12 by $0;
--dump jo;
gn = foreach jo generate $0, $1, $3, ((($3-$1)/$1)*100) as av;
--dump gn;
kk13 = filter pro by year == 2013;
--dump kk13;
ff13 = group kk13 by job_title;
--dump ff13;
ss13 = foreach ff13 generate $0, (float)COUNT(kk13.$1);
--dump ss13;
jo13 = join ss12 by $0,ss13 by $0;
--dump jo13;
gn13 = foreach jo13 generate $0, $1, $3, ((($3-$1)/$1)*100) as av1;
--dump gn13;
kk14 = filter pro by year == 2014;
--dump kk14;
ff14 = group kk14 by job_title;
--dump ff14;
ss14 = foreach ff14 generate $0, (float)COUNT(kk14.$1);
--dump ss14;
jo14 = join ss13 by $0,ss14 by $0;
--dump jo14;
gn14 = foreach jo14 generate $0, $1, $3, ((($3-$1)/$1)*100) as av2;
--dump gn14;
kk15 = filter pro by year == 2015;
--dump kk15;
ff15 = group kk15 by job_title;
--dump ff15;
ss15 = foreach ff15 generate $0, (float)COUNT(kk15.$1);
--dump ss15;
jo15 = join ss14 by $0,ss15 by $0;
--dump jo15;
gn15 = foreach jo15 generate $0, $1, $3, ((($3-$1)/$1)*100) as av3;
--dump gn15;
kk16 = filter pro by year == 2016;
--dump kk16;
ff16 = group kk16 by job_title;
--dump ff16;
ss16 = foreach ff16 generate $0, (float)COUNT(kk16.$1);
--dump ss16;
jo16 = join ss15 by $0,ss16 by $0;
--dump jo16;
gn16 = foreach jo16 generate $0, $1, $3, ((($3-$1)/$1)*100) as av4;
--dump gn16;
gg = join gn by $0,gn13 by $0,gn14 by $0,gn15 by $0,gn16 by $0;
--dump gg;
rr = foreach gg generate $0, ((av+av1+av2+av3+av4)/5) as cv;
--dump rr;
od = order rr by cv desc;
--dump od;
li = limit od 5;
dump li;
















