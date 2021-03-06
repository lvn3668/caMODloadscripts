-- Author Lalitha Viswanathan
-- Post process disable constraints 
alter table ABS_CANCER_MODEL disable constraint FKBC9267572175CA75;
alter table ABS_CANCER_MODEL disable constraint FKBC926757290CE83F;
alter table ABS_CANCER_MODEL disable constraint FKBC9267572D8B96DA;
alter table ABS_CANCER_MODEL disable constraint FKBC9267573D222B55;
alter table ABS_CANCER_MODEL disable constraint FKBC9267574D19DE94;
alter table ABS_CANCER_MODEL disable constraint FKBC9267576DC9C38B;
alter table ABS_CANCER_MODEL disable constraint FKBC9267579BE9D993;
alter table ABS_CANCER_MODEL disable constraint FKBC926757C104A02E;
alter table ABS_CANCER_MODEL disable constraint FKBC926757D490A9BF;
alter table ABS_CAN_MOD_PUBLICATION disable constraint FK9377C2B3496C4E05;
alter table ABS_CAN_MOD_PUBLICATION disable constraint FK9377C2B38258D935;
alter table AGENT_AGENT_TARGET disable constraint FKCD3DA3053C5575C0;
alter table AGENT_AGENT_TARGET disable constraint FKCD3DA305457316D5;
alter table AGENT_BIOLOGICAL_PROCESS disable constraint FK5FEB6DAB42FAD9D2;
alter table AGENT_BIOLOGICAL_PROCESS disable constraint FK5FEB6DAB457316D5;
alter table AGENT_CHEMICAL_CLASS disable constraint FKD3317785457316D5;
alter table AGENT_CHEMICAL_CLASS disable constraint FKD3317785BD096390;
alter table ANIMAL_AVAILABILITY disable constraint FKD4698ABE1CC8B88B;
alter table ANIMAL_AVAILABILITY disable constraint FKD4698ABEFB3FC01C;
alter table CARCINOGEN_EXPOSURE disable constraint FKDF2E871119EF4CF2;
alter table CARCINOGEN_EXPOSURE disable constraint FKDF2E87111CC8B88B;
alter table CARCINOGEN_EXPOSURE disable constraint FKDF2E871146872875;
alter table CELL_LINE disable constraint FK61276CB11CC8B88B;
alter table CELL_LINE disable constraint FK61276CB13D222B55;
alter table CELL_LINE_PUBLICATION disable constraint FKA8A4EB9E8258D935;
alter table CELL_LINE_PUBLICATION disable constraint FKA8A4EB9ED2525AC4;
alter table CLINICAL_MARKER disable constraint FK179B7EE6D45FCF9F;
alter table COMMENTS disable constraint FKDC17DDF4290CE83F;
alter table COMMENTS disable constraint FKDC17DDF42EB4E88E;
alter table COMMENTS disable constraint FKDC17DDF4496C4E05;
alter table COMMENTS disable constraint FKDC17DDF495BE676C;
alter table ENGINEERED_GENE disable constraint FK4ADB496619EF4CF2;
alter table ENGINEERED_GENE disable constraint FK4ADB49661CC8B88B;
alter table ENGINEERED_GENE disable constraint FK4ADB496653A0BB3C;
alter table ENGINEERED_GENE disable constraint FK4ADB496666D7EBDF;
alter table ENGINEERED_GENE disable constraint FK4ADB496672CE5632;
alter table ENGINEERED_GENE disable constraint FK4ADB496687D074B5;
alter table ENGINEERED_GENE disable constraint FK4ADB496697B9D0A5;
alter table ENGINEERED_GENE disable constraint FK4ADB4966BB186F15;
alter table EXPRESSION_FEATURE disable constraint FKCC1D9C4F3D222B55;
alter table EXPRESSION_FEATURE disable constraint FKCC1D9C4FA17421A4;
alter table EXPRESSION_FEATURE disable constraint FKCC1D9C4FD749BD3C;
alter table GENE_DELIVERY disable constraint FK918699DE1CC8B88B;
alter table GENE_DELIVERY disable constraint FK918699DE3D222B55;
alter table GENE_DELIVERY disable constraint FK918699DE46872875;
alter table GENE_FUNCTION disable constraint FKB2C0F1C2D749BD3C;
alter table GENOTYPE disable constraint FK6C7642D91CC8B88B;
alter table HISTOPATHOLOGY disable constraint FK587A4AB2102F8CB5;
alter table HISTOPATHOLOGY disable constraint FK587A4AB21CC8B88B;
alter table HISTOPATHOLOGY disable constraint FK587A4AB23D222B55;
alter table HISTOPATHOLOGY disable constraint FK587A4AB23FE1DDE8;
alter table HISTOPATHOLOGY disable constraint FK587A4AB2BCA0AB4A;
alter table IMAGE disable constraint FK5FAA95B1CC8B88B;
alter table IMAGE disable constraint FK5FAA95BB86E2EDA;
alter table INVIVO_RESULT disable constraint FKC187E8CB457316D5;
alter table INVIVO_RESULT disable constraint FKC187E8CB46872875;
alter table INVIVO_RESULT disable constraint FKC187E8CB887C658A;
alter table LOG disable constraint FK1A3441CC8B88B;
alter table LOG disable constraint FK1A3442EB4E88E;
alter table LOG disable constraint FK1A34477AB701F;
alter table MICRO_ARRAY_DATA disable constraint FKC3D0BA2B1CC8B88B;
alter table NOMENCLATURE disable constraint FK6ECA840B35AE2BF;
alter table PARTY_CONTACT_INFO disable constraint FK4B2B42263595FF35;
alter table PARTY_CONTACT_INFO disable constraint FK4B2B4226534EE516;
alter table PARTY_ROLE disable constraint FK1C92FE2F3595FF35;
alter table PARTY_ROLE disable constraint FK1C92FE2FAC5A835F;
alter table PHENOTYPE disable constraint FKB24800288E609262;
alter table PROTEOMICS_DATA disable constraint FKC3D0BA2B1CC8B88E;
alter table PUBLICATION disable constraint FKBFBBA22C9B29662E;
alter table REGULATORY_ELEMENT disable constraint FKEA51B055229D942B;
alter table REGULATORY_ELEMENT disable constraint FKEA51B05587D074B5;
alter table RESULT_SETTINGS_COLUMNS disable constraint SYS_C0084112;
alter table SAVED_QUERY_ATTRIBUTE disable constraint SYS_C0084113;
alter table SCREENING_RESULT disable constraint FKE30F1486457316D5;
alter table SCREENING_RESULT disable constraint FKE30F148646872875;
alter table SPONTANEOUS_MUTATION disable constraint FKAE3E7B3B1CC8B88B;
alter table SPONTANEOUS_MUTATION disable constraint FKAE3E7B3B72CE5632;
alter table SPONTANEOUS_MUTATION disable constraint FKAE3E7B3BA9F03D86;
alter table STRAIN disable constraint FKCAD5417572CE5632;
alter table STRAIN disable constraint FKCAD5417587D074B5;
alter table TAR_MOD_MODIFICATION_TYPE disable constraint FK211C32E6C1E42178;
alter table TAR_MOD_MODIFICATION_TYPE disable constraint FK211C32E6DE1A05A5;
alter table THERAPY disable constraint FKAF8F6C691CC8B88B;
alter table THERAPY disable constraint FKAF8F6C6936A94812;
alter table THERAPY disable constraint FKAF8F6C69457316D5;
alter table THERAPY disable constraint FKAF8F6C6946872875;
alter table THERAPY_PUBLICATION disable constraint FK863317568258D935;
alter table THERAPY_PUBLICATION disable constraint FK86331756DB10995;
alter table TRANSGENE_REG_ELEMENT disable constraint FK32E60ECF9C4CA0C;
alter table TRANSGENE_REG_ELEMENT disable constraint FK32E60ECFB947BD44;
alter table TRANSIENT_INTERFERENCE disable constraint FKE89F80171CC8B88B;
alter table TRANSIENT_INTERFERENCE disable constraint FKE89F801778685E5B;
alter table TREATMENT disable constraint FKFC3978788E609262;
alter table YST_MDL_SCRNING_RESULT disable constraint FK7374643556E4597B;
alter table YST_MDL_SCRNING_RESULT disable constraint FK737464356928CCA2;
alter table YST_MDL_TRGTD_MOD disable constraint FK89FF9EAD56E4597B;
alter table YST_MDL_TRGTD_MOD disable constraint FK89FF9EAD75303515;

EXIT;
