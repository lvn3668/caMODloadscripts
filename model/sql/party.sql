-- Author Lalitha Viswanathan
-- Party class 
truncate table party;
insert into party select * from zstg_party;
commit;

---------------------------------------------------------------------------------
----------------------------------- Update party --------------------------------
update party set first_name = ' ' where first_name = '(July 2006)';
commit;

exit;
