INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','警政署'),
  ('offambulance','醫護局'),
  ('offmechanic','修車廠'),
  ('offtaxi','計程車')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','警員',12,'{}','{}'),
  ('offpolice',1,'officer','警員',24,'{}','{}'),
  ('offpolice',2,'sergeant','警員',36,'{}','{}'),
  ('offpolice',3,'lieutenant','警員',48,'{}','{}'),
  ('offpolice',4,'boss','警員',0,'{}','{}'),
  ('offambulance',0,'ambulance','醫生',12,'{}','{}'),
  ('offambulance',1,'doctor','醫生',24,'{}','{}'),
  ('offambulance',2,'chief_doctor','醫生',36,'{}','{}'),
  ('offambulance',3,'boss','醫生',48,'{}','{}'),
  ('offmechanic',0,'recrue','技工',12,'{}','{}'),
  ('offmechanic',1,'novice','技工',24,'{}','{}'),
  ('offmechanic',2,'experimente','技工',36,'{}','{}'),
  ('offmechanic',3,'chief','技工',48,'{}','{}'),
  ('offmechanic',4,'boss','技工',0,'{}','{}'),
  ('offtaxi',0,'recrue','司機',12,'{}','{}'),
  ('offtaxi',1,'novice','司機',24,'{}', '{}'),
  ('offtaxi',2,'experimente','司機',36,'{}', '{}'),
  ('offtaxi',3,'uber','司機',48,'{}','{}'),
  ('offtaxi',4,'boss','司機',0,'{}','{}')
;