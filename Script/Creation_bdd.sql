CREATE database db_space;
use db_space;

create table galaxie ( id_galaxie int primary key auto_increment , nom_galaxie varchar(100) );
create table planete (id_planete int primary key auto_increment , nom_planete varchar(100), superficie float, masse float , type varchar(50));
create table organisation ( id_organisation int primary key auto_increment , nom_organisation varchar(100) ,pays varchar(100) , objectif text);
create table phenomene ( id_phenomene int primary key auto_increment , nom_phenomene varchar(100), niveau int , impact text );
create table satellite ( id_satellite int primary key auto_increment , taille float, nom_satellite varchar(100), type_info varchar(100), est_humain bool,  id_planete int , id_organisation int ,foreign key (id_planete) references planete (id_planete) , foreign key (id_organisation) references organisation(id_organisation));
create table appartenir ( id_planete int , id_galaxie int , foreign key (id_planete) references planete (id_planete) , foreign key (id_galaxie) references galaxie(id_galaxie), primary key (id_planete, id_galaxie));
create table analyser ( id_organisation int , id_phenomene int , foreign key (id_organisation) references organisation (id_organisation) , foreign key (id_phenomene) references phenomene(id_phenomene), primary key (id_organisation, id_phenomene));
create table situer ( id_galaxie int , id_phenomene int , foreign key (id_galaxie) references galaxie(id_galaxie) , foreign key (id_phenomene) references phenomene(id_phenomene), primary key (id_galaxie, id_phenomene));

-- Insertions dans la table galaxie
INSERT INTO galaxie (nom_galaxie) VALUES
('Voie lactée'),
('Andromède'),
('Sombrero'),
('Triangulum'),
('M87');

-- Insertions dans la table planete
INSERT INTO planete (nom_planete, superficie, masse, type) VALUES
('Terre', 510.1, 5.97, 'Tellurique'),
('Mars', 144.8, 0.64, 'Tellurique'),
('Jupiter', 61420, 1898, 'Géante gazeuse'),
('Saturne', 42700, 568, 'Géante gazeuse'),
('Neptune', 7618, 102, 'Géante gazeuse');

-- Insertions dans la table organisation
INSERT INTO organisation (nom_organisation, pays, objectif) VALUES
('NASA', 'États-Unis', 'Exploration spatiale'),
('ESA', 'Europe', 'Coopération spatiale européenne'),
('ISRO', 'Inde', 'Recherche spatiale indienne'),
('CNSA', 'Chine', 'Administration spatiale nationale de Chine'),
('Roscosmos', 'Russie', 'Agence spatiale fédérale russe');

-- Insertions dans la table phenomene
INSERT INTO phenomene (nom_phenomene, niveau, impact) VALUES
('Éruption solaire', 3, 'Possibles perturbations des communications radio'),
('Tornade stellaire', 5, "Fortes émissions d'énergie"),
('Trou noir', 7, "Déformation extrême de l'espace-temps"),
('Aurore boréale', 2, "Phénomène lumineux dans l'atmosphère"),
('Pluie de météorites', 4, 'Chutes de météores sur une planète');

-- Insertions dans la table satellite
INSERT INTO satellite (taille, nom_satellite, type_info, est_humain, id_planete, id_organisation) VALUES
(1200, 'Lune', 'Naturel', false, 1, 1),
(6000, 'ISS', 'Artificiel', true, 1, 1),
(3000, 'Hubble', 'Artificiel', true, 1, 2),
(1500, 'Phobos', 'Naturel', false, 2, NULL),
(2500, 'Titan', 'Naturel', false, 4, NULL);

-- Insertions dans la table appartenir
INSERT INTO appartenir (id_planete, id_galaxie) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 1),
(5, 2);

-- Insertions dans la table analyser
INSERT INTO analyser (id_organisation, id_phenomene) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 2),
(5, 5);

-- Insertions dans la table situer
INSERT INTO situer (id_galaxie, id_phenomene) VALUES
(1, 1),
(2, 3),
(1, 4),
(2, 2),
(3, 5);

