CREATE TABLE FOOTEDC.ARBITRE_ASSISTANT
( 
ID_ARBITRE INT PRIMARY KEY,
PRENOM_NOM_ARBITRE_ASSISTANT VARCHAR(60),
ID_PAYS INT);

CREATE TABLE FOOTEDC.JOUEURS
( ID_JOUEUR INT PRIMARY KEY,
ID_EQUIPE INT,
NUMERO_MAILLOT INT,
NOMPRENOM_JOUEUR VARCHAR(60),
POSITION_TERRAIN CHAR(2),
DATE_NAISSANCE DATE,
AGE INT,
NOM_CLUB VARCHAR(60)
);

CREATE TABLE FOOTEDC.POSITION
(
POSITION_TERRAIN CHAR(2),
LIBELLE_POSITION VARCHAR(60)
);

CREATE TABLE FOOTEDC.BUT_DETAIL
( 
ID_BUT INT PRIMARY KEY,
ID_MATCH INT,
ID_JOUEUR INT,
ID_EQUIPE INT,
TEMPS_BUT INT,
TYPE_BUT CHAR(1),
ETAPE_COMPETITION CHAR(1),
TEMPS_ADDITIONNEL CHAR(1),
PERIODE_BUT INT
);


CREATE TABLE FOOTEDC.TIRS_AU_BUT_PENALTY
( 
ID_TIR_PENALTY INT PRIMARY KEY,
ID_MATCH INT,
ID_EQUIPE INT,
ID_JOUEUR INT,
BUT_MARQUE CHAR(1),
NUMERO_TIR INT
);



CREATE TABLE FOOTEDC.CARTONS
( 
ID_MATCH INT,
ID_EQUIPE INT,
ID_JOUEUR INT,
TEMPS_CARTON INT,
EXPULSION CHAR(1),
TEMPS_ADDITIONNEL CHAR(1),
PERIODE_CARTON INT
);

CREATE TABLE FOOTEDC.REMPLACEMENTS
( 
ID_MATCH INT,
ID_EQUIPE INT,
ID_JOUEUR INT,
ENTREE_SORTIE CHAR(1),
TEMPS_REMPLACEMENT INT,
TEMPS_ADDITIONNEL CHAR(1),
PERIODE_REMPLACEMENT INT
);

CREATE TABLE FOOTEDC.CAPITAINES
( 
ID_MATCH INT,
ID_EQUIPE INT,
ID_JOUEUR_CAPITAINE INT
);

CREATE TABLE FOOTEDC.GARDIEN_MATCH_TIRSAUXBUTS
( 
ID_MATCH INT,
ID_EQUIPE INT,
ID_JOUEUR_GARDIEN INT
);