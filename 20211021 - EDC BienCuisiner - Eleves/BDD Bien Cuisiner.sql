CREATE SCHEMA BIENCUISINER;
GO

CREATE TABLE BIENCUISINER.Categorie_CSA (
CODE CHAR(2) NOT NULL PRIMARY KEY ,
LIBELLE VARCHAR(100)
) ;

INSERT INTO BIENCUISINER.Categorie_CSA VALUES ('10', 'D�conseill� - 10 ans');
INSERT INTO BIENCUISINER.Categorie_CSA VALUES ('12', 'D�conseill� - 12 ans');
INSERT INTO BIENCUISINER.Categorie_CSA VALUES ('16', 'D�conseill� - 16 ans');
INSERT INTO BIENCUISINER.Categorie_CSA VALUES ('18', 'D�conseill� - 18 ans');
INSERT INTO BIENCUISINER.Categorie_CSA VALUES ('TP', 'Tout public');

CREATE TABLE BIENCUISINER.GENRE (
CODE CHAR(3) NOT NULL PRIMARY KEY ,
LIBELLE VARCHAR(100)
) ;

INSERT INTO BIENCUISINER.GENRE VALUES ('ANI', 'Animation');
INSERT INTO BIENCUISINER.GENRE VALUES ('BAN', 'Bande Annonce');
INSERT INTO BIENCUISINER.GENRE VALUES ('DOC', 'Documentaire');
INSERT INTO BIENCUISINER.GENRE VALUES ('ECU', 'Emission Culinaire');
INSERT INTO BIENCUISINER.GENRE VALUES ('FIC', 'Fiction');
INSERT INTO BIENCUISINER.GENRE VALUES ('PUB', 'Publicit�');
INSERT INTO BIENCUISINER.GENRE VALUES ('SAI', 'Saison de s�rie');

CREATE TABLE BIENCUISINER.ORIGINE (
CODE CHAR(3) NOT NULL PRIMARY KEY ,
LIBELLE VARCHAR(100)
) ;

INSERT INTO BIENCUISINER.ORIGINE VALUES ('OAU', 'Origine autre');
INSERT INTO BIENCUISINER.ORIGINE VALUES ('OEU', 'Origine Europ�enne');
INSERT INTO BIENCUISINER.ORIGINE VALUES ('OEF', 'Oeuvre d''expression originale fran�aise');


CREATE TABLE BIENCUISINER.EMISSION(
ID INT NOT NULL PRIMARY KEY ,
TITRE VARCHAR(100),
TITRE_ORIGINAL VARCHAR(100),
ANNEE_PRODUCTION INT,
NUM_SAISON INT,
CODE_GENRE CHAR(3) FOREIGn KEY REFERENCES BIENCUISINER.GENRE (CODE),
code_origine CHAR(3) FOREIGn KEY REFERENCES BIENCUISINER.ORIGINE (CODE)
);

INSERT INTO BIENCUISINER.EMISSION VALUES (112678,'Temp�te de boulettes g�antes','Cloudly with a Chance of Meatballs', 2009,NULL,'ANI','OAU');
INSERT INTO BIENCUISINER.EMISSION VALUES (121131,'Les d�fis de Laly - 2011',NULL, 2011,1,'ECU','OEU');
INSERT INTO BIENCUISINER.EMISSION VALUES (121132,'Les d�fis de Laly - 2012',NULL, 2012,2,'ECU','OEU');
INSERT INTO BIENCUISINER.EMISSION VALUES (123121,'A table ! Saison 1',NULL, 2017,1,'ECU','OEF');
INSERT INTO BIENCUISINER.EMISSION VALUES (123122,'A table ! Saison 2',NULL, 2018,2,'ECU','OEF');
INSERT INTO BIENCUISINER.EMISSION VALUES (123245,'Les recettes du bonheur','The hundred foot journey', 2013,NULL,'FIC','OAU');
INSERT INTO BIENCUISINER.EMISSION VALUES (212234,'Chefs Saison 1',NULL, 2015,1,'SAI','OEF');
INSERT INTO BIENCUISINER.EMISSION VALUES (213456,'A vif !','Burnt', 2015,NULL,'FIC','OAU');
INSERT INTO BIENCUISINER.EMISSION VALUES (234345,'Les saveurs du palais',NULL, 2012,NULL,'FIC','OEF');
INSERT INTO BIENCUISINER.EMISSION VALUES (234347,'#Chef','Chef', 2014,NULL,'FIC','OAU');



CREATE TABLE BIENCUISINER.PROGRAMME
(
ID_EMISSION INT NOT NULL ,
ID INT NOT NULL ,
TITRE VARCHAR(100),
DUREE INT ,
CODE_CATEGORIE CHAR(2) Foreign key references BIENCUISINER.Categorie_CSA (CODE) ,
PRIMARY KEY (ID_EMISSION, ID)
) ;
INSERT INTO BIENCUISINER.PROGRAMME VALUES (123122,1,'Episode n� 1',35, 'TP');
INSERT INTO BIENCUISINER.PROGRAMME VALUES (123122,2,'Episode n� 2',35, 'TP');

INSERT INTO BIENCUISINER.PROGRAMME VALUES (212234,1,'Episode n� 1',52, 'TP');
INSERT INTO BIENCUISINER.PROGRAMME VALUES (212234,2,'Episode n� 2',52, 'TP');
INSERT INTO BIENCUISINER.PROGRAMME VALUES (212234,3,'Episode n� 3',52, 'TP');
INSERT INTO BIENCUISINER.PROGRAMME VALUES (212234,4,'Episode n� 4',52, 'TP');

CREATE TABLE BIENCUISINER.DIFFUSION(
ID INT NOT NULL PRIMARY KEY ,
JOUR DATE ,
HORAIRE TIME,
DIRECT INT,
ID_EMISSION INT NOT NULL FOREIGN KEY REFERENCES BIENCUISINER.EMISSION (ID),
ID_PROGRAMME INT NOT NULL,
CONSTRAINT FK_PROGRAMME  FOREIGN KEY (ID_EMISSION, ID_PROGRAMME) REFERENCES 
	BIENCUISINER.PROGRAMME (ID_EMISSION, ID) );

INSERT INTO BIENCUISINER.DIFFUSION VALUES (122122, '2019-05-01','12:00:00',1,123122,1) ;
INSERT INTO BIENCUISINER.DIFFUSION VALUES (122123, '2019-05-02','12:00:00',1,123122,2) ;
INSERT INTO BIENCUISINER.DIFFUSION VALUES (122126, '2019-06-01','13:30:00',0,212234,1) ;
INSERT INTO BIENCUISINER.DIFFUSION VALUES (234234, '2019-06-01','10:29:00',1,123122,1) ;




