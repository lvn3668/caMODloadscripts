truncate table publication;
alter trigger publication_id_trigger disable;

-- -----------------------------------------------------------------------------------------
-- ------------------------------ Insert Publication Data ----------------------------------
ALTER TABLE PUBLICATION
MODIFY(END_PAGE VARCHAR2(4000));


ALTER TABLE PUBLICATION
MODIFY(PMID VARCHAR2(4000));


ALTER TABLE PUBLICATION
MODIFY(START_PAGE VARCHAR2(4000));

ALTER TABLE PUBLICATION
MODIFY(AUTHORS VARCHAR2(4000));

ALTER TABLE PUBLICATION
ADD(REFKEY NUMBER);

ALTER TABLE PUBLICATION
ADD(TUMORKEY NUMBER);

insert into publication(publication_id, volume, end_page, year, title, pmid, start_page, journal, authors, first_time_reported, j_number, publication_status_id, zfin_pub_id, comments, rgd_pub_id) select publication_id, volume, end_page, year, title, pmid, start_page, journal, authors, first_time_reported, j_number, publication_status_id, zfin_pub_id, comments, rgd_pub_id from zstg_publication;
commit;

--update publication p set refkey = (select refkey from zstg_reference x where p.volume = x.volume and p.end_page = x.end_pages and p.start_page = x.start_pages and p.year = x.year and p.title = x.title and p.journal = x.journal and p.j_number = x.jnum and p.pmid = x.pmid);

--commit;

var v_maxrow number;
COLUMN V_MAXROW NEW_VALUE V_MAXROW;

select max(publication_id)+1 as v_maxrow from publication;
drop sequence publication_id;

create sequence publication_id start with &v_maxrow;

create or replace trigger publication_id_trigger  
BEFORE INSERT
ON publication
FOR EACH ROW
BEGIN
  SELECT publication_id.NEXTVAL
  INTO :NEW.publication_id
  FROM DUAL;
END;
/
alter trigger publication_id_trigger enable;

INSERT INTO PUBLICATION
(VOLUME, YEAR, TITLE, START_PAGE, END_PAGE, PMID, AUTHORS, JOURNAL, J_NUMBER, 
PUBLICATION_STATUS_ID, FIRST_TIME_REPORTED, REFKEY, TUMORKEY )
select distinct VOLUME,  YEAR, TITLE || ' ' || TITLE2, START_PAGES, 
END_PAGES, PMID, AUTHORS||' '||AUTHORS2, JOURNAL, 
JNUM, 1 as PUBLICATION_STATUS_ID, 0 as FIRST_TIME_RECORDED, a.refkey, b.tumorkey FROM zstg_reference a, zstg_tumor_ref b where a.refkey = b.refkey;
COMMIT;

exit;
