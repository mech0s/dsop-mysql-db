
use devopstoolsraw;

update all_tools set name = 'artifact repository', data_cleansed = 1 where name like 'artifact%reposit%' ;
update tools set tool = 'configuration automation tools', data_cleansed = 1  where tool like 'configura% automation tool%';
update all_artifacts set srcname = 'configuration automation tools', data_cleansed = 1  where srctype = 'Tool' and srcname like 'configura% automation tool%';
update all_tools set name = 'configuration automation tools', data_cleansed = 1  where name like 'configura% automation tool%';
-- update tools set tool = 'ci/cd orchestrator', data_cleansed = 1  where tool like 'orchestrator';
-- update all_artifacts set srcname = 'ci/cd orchestrator', data_cleansed = 1  where srctype = 'Tool' and srcname like 'orchestrator';
-- update all_tools set name = 'ci/cd orchestrator', data_cleansed = 1  where name like 'ci/cd%';
-- update all_tools set name = 'ci/cd orchestrator', data_cleansed = 1  where name like 'orchestrator';
update all_tools set name = 'configuration management database (cmdb)', data_cleansed = 1  where name like 'cmdb';
update all_tools set name = 'data masking tool', data_cleansed = 1  where name like 'data masking or';
update all_tools set name = 'database test tool suite', data_cleansed = 1  where name like 'database test tools';
update all_tools set name = 'dependency checking /bill of materials checking tool', data_cleansed = 1  where name like 'dependency checking%b%o%m%checking%tool';
update tools set tool = 'dependency checking /bill of materials checking tool', data_cleansed = 1  where tool like 'dependency checking%b%o%m%checking%tool';
update all_artifacts set srcname = 'dependency checking /bill of materials checking tool', data_cleansed = 1  where srctype = 'Tool' and srcname like 'dependency checking%b%o%m%checking%tool';
update all_tools set name = 'integrated development environment (ide)', data_cleansed = 1  where name like 'ide';
update all_tools set name = 'integrated development environment (ide) security plugins', data_cleansed = 1  where name like '%ide%security plugins';
update tools set tool = 'integrated development environment (ide) security plugins', data_cleansed = 1  where tool like '%ide%security plugins';
update all_artifacts set srcname = 'integrated development environment (ide) security plugins', data_cleansed = 1  where srctype = 'Tool' and srcname like '%ide%security plugins';
update all_tools set name = 'interactive application security test (iast) tool', data_cleansed = 1  where name like 'iast%';
update all_tools set name = 'istatic application security test (sast) tool', data_cleansed = 1  where name like 'sast tool';
update all_tools set name = 'dynamic application security test (dast) tool', data_cleansed = 1  where name like 'dast tool';
update all_tools set name = 'security compliance tool', data_cleansed = 1  where name like 'security compliance%';
update all_artifacts set name = replace(name,')','') where name like '%)%' and  name not like '%(%';
update all_artifacts set name = replace(name,'(','') where name like '%(%' and  name not like '%)%';

/* all_tools cleansing checks
select srcphase phase, name tool, max(if(srctype = 'Tools',1,0 )) data_cleansed from all_tools group by srcphase, name ;
*/
/* tool name quality check
select name, sum(allts + ts), max(allts), max(ts) from (
select name, count(*) allts, 0 ts from all_tools group by name
union all
select tool, 0, count(*) from tools group by tool
) x group by name ;
*/

truncate devopstools.source_info ;
insert into devopstools.source_info select xlsx_version, excel2db_version,
'20230522-3'  -- version of this script
from source_info;

delete from devopstools.tool_phases ;
delete from devopstools.activity_tools;
delete from devopstools.activity_artifacts;
delete from devopstools.tool_artifacts;
delete from devopstools.activities;
delete from devopstools.tools ;
delete from devopstools.phases ;
delete from devopstools.artifacts;

insert into devopstools.phases 
select distinct srcphase phase from all_tools where srcphase <> "Security";  -- Security "phase" complicates the data with other descriptions

insert into devopstools.tools  select tool , max(features), max(benefits), max(data_cleansed) from 
( select tool, features, benefits, data_cleansed from tools where phase <> "Security" -- Security "phase" complicates the data with other descriptions
  union select name, null, null, data_cleansed from all_tools) t1
group by tool;

insert into devopstools.tool_phases select phase, tool, 1 data_cleansed from tools where phase <> "Security"; -- tools table regarded as cleansed

insert into devopstools.tool_phases select distinct srcphase, name, data_cleansed from all_tools where (srcphase, name) not in ( select phase, tool from devopstools.tool_phases) and srcphase <> "Security";

update devopstools.tool_phases set data_cleansed = 1 where tool in (select tp1.tool from (select tp2.tool from devopstools.tool_phases as tp2 where tp2.data_cleansed = 1) as tp1); 
-- tool cleansed for one phase is cleansed for all. 

insert into devopstools.activities select activity, phase, description, 1 as data_cleansed from activities;  

insert into devopstools.artifacts  select distinct name as artifact, max(data_cleansed) from all_artifacts where name <> '' group by name;  
-- may need to check cleansing of tool names needs repeated for srcname of artifacts table

insert into devopstools.activity_artifacts 
select srcname as activity, name as artifact, max(if(srcsense='Input',1,0)) as input, max(if(srcsense='Output',1,0)) as output, max(data_cleansed) as data_cleansed  from all_artifacts where srctype='Activity' and name <> '' group by activity, artifact ;

insert into devopstools.tool_artifacts 
select srcname as tool, name as artifact, max(if(srcsense='Input',1,0)) as input, max(if(srcsense='Output',1,0)) as output, max(data_cleansed) as data_cleansed  from all_artifacts where srctype='Tool' and name <> '' group by tool, artifact ;

insert into devopstools.activity_tools (activity, tool) 
select srcname, name  from all_tools where srctype = 'Activities' group by srcname, name ;








