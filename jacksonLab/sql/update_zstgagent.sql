-- Author Lalitha Viswanathan
-- MTB Agent Class (caMOD)
update ZSTG_REFERENCE set PMID = NULL where PMID = ' ';
commit;
update ZSTG_REFERENCE set PAGES = NULL where PAGES = ' ';
commit;
update ZSTG_REFERENCE SET START_PAGES =  decode(instr(PAGES,'-'),0,PAGES,substr(PAGES,0, instr(PAGES,'-')-1));
commit;
update ZSTG_REFERENCE SET END_PAGES =  decode(instr(PAGES,'-'),0,PAGES,substr(PAGES,instr(PAGES,'-')+1));
commit;


update zstg_agent set agenttype = 'Chemical / Drug' where agenttype = 'Chemical/Drug';
commit;
update zstg_agent set agenttype = 'Signaling Molecule' where agenttype = 'Signaling molecule';
commit;
update zstg_agent set agenttype = 'Viral' where agenttype = 'Virus';
commit;

exit;
