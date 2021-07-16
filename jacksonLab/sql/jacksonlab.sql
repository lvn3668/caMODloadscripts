-- Author Lalitha Viswanathan
-- Tables for caMOD
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

-- Create Jackson Lab table for new dataset
insert into JACKSON_LAB_TMP2(MTB_ID, TUMOR_NAME, TUMOR_SYNONYMS, STRAIN_KEY, STRAIN_NAME, STRAIN_TYPES, STRAIN_GENERAL_NOTE, TREATMENT_TYPE, TREATMENT_AGENTS, ORGAN_KEY, ORGAN_AFFECTED, METASTASIZED_TO, MTBIDS_OF_METS, SEX, REPRODUCTIVE_STATUS, TUMOR_FREQUENCY, AGE_OF_ONSET, AGE_OF_DETECTION, REFERENCES, STRAIN_SYNONYMS) select DISTINCT a.TUMORKEY, a.TUMORNAME, TO_CHAR(a.TUMORSYNONYMS), a.STRAINKEY, a.STRAINNAME, a.STRAINTYPES, a.STRAINGENERALNOTE, d.AGENTTYPE, d.AGENTNAME, a.ORGANKEY, a.ORGANAFFECTED, c.METASTASISORGAN, c.METASTASISKEY, a.SEX, a.REPRODUCTIVESTATUS, a.TUMORFREQUENCY, a.AGEOFONSET, a.AGEOFDETECTION, e.JNUM_COMBINED, to_char(a.STRAINSYNONYMS) from ZSTG_TUMOR a, ZSTG_TUMOR_REFERENCE_COMBINED b, ZSTG_METASTASES_COMBINED c, ZSTG_TUMOR_AGENTNAME_COMBINED d, ZSTG_TUMOR_REFERENCE_COMBINED e where a.TUMORKEY = d.TUMORKEY(+) and a.TUMORKEY = c.TUMORKEY(+) and a.TUMORKEY = b.TUMORKEY(+) and a.TUMORKEY = e.TUMORKEY(+);
commit;

-- Update as per business rules
update JACKSON_LAB_TMP2 set TREATMENT_TYPE = 'None (Spontaneous)' where TREATMENT_TYPE IS NULL;
commit;
update jackson_lab_tmp2 set treatment_type = 'Chemical / Drug' where treatment_type = 'Chemical/Drug';
commit;
update jackson_lab_tmp2 set treatment_type = 'Signaling Molecule' where treatment_type = 'Signaling molecule';
commit;
update jackson_lab_tmp2 set treatment_type = 'Viral' where treatment_type = 'Virus';
commit;
update jackson_lab_tmp2 set treatment_agents = '(see notes)' where treatment_agents ='(see notes';
commit;

EXIT;
