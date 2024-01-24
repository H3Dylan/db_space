select * from planete;
select * from planete where nom_planete="Terre";
select * from satellite;
select * from satellite where type_info="Artificiel";
select * from analyser;
select * from phenomene;
select * from phenomene where nom_phenomene="Trou noir";
select * from organisation;
select * from organisation where objectif ="Exploration spatiale";
select type, count(type) as nombre_planetes from planete group by type; -- afficher le nombre de planetes par type
select nom_planete, masse from planete order by masse desc limit 1; -- trouver la planete la plus lourde et l'afficher
select count(planete.id_planete) as nb_planete, nom_galaxie from planete, galaxie join appartenir where appartenir.id_galaxie=galaxie.id_galaxie and appartenir.id_planete=planete.id_planete group by galaxie.id_galaxie; -- nombre de planete par galaxie
update phenomene set  niveau = 2 where nom_phenomene = "Éruption solaire"; -- l'eruption s'étant calmé , le niveau est descendu d'1 sur l'echelle de danger
select * from phenomene;
delete from phenomene where nom_phenomene = "Éruption solaire"; -- l'eruption s'est arrété donc nous avons supprimé le phenomene 
select count(planete.id_planete) as nb_planete, nom_galaxie from planete, galaxie join appartenir where appartenir.id_galaxie=galaxie.id_galaxie and appartenir.id_planete=planete.id_planete group by galaxie.id_galaxie having count(planete.id_planete)>2 ;-- nombre de galaxie ou il y a plus de 2 planetes;
select nom_planete from planete union select nom_galaxie from galaxie; -- afficher sur la même liste nom des planetes et nom des galaxies.
create table test ( id int primary key auto_increment, nom varchar(100));
insert into test (nom) values ("lala");
describe test;
select * from test;
truncate table test;
describe test;
select * from test;
drop table test;
alter table planete add column  annee_decouverte INT;
update `planete` set  `annee_decouverte` = '750' where `planete`.`id_planete` = 1; 
update `planete` set  `annee_decouverte` = '750' where `planete`.`id_planete` = 2; 
update `planete` set  `annee_decouverte` = '952' where `planete`.`id_planete` = 3; 
update `planete` set  `annee_decouverte` = '1000' where `planete`.`id_planete` = 4; 
update `planete` set  `annee_decouverte` = '1495' where `planete`.`id_planete` = 5;


DELIMITER //
create procedure UpdatePlaneteMasse(in ajout float)
begin
    declare compteur int;
    
    -- Sélectionne les 5 premières lignes de la table planete pour la mise à jour
    select COUNT(*) into compteur from planete;
    
    if compteur >= 5 then
        update planete set masse = masse + ajout order by id_planete limit 5;
        
        select "Mise à jour effectuée pour les 5 premières lignes de la table planete." as Resultat;
    else
        select "Il n'y a pas suffisamment de lignes dans la table planete pour la mise à jour." as Resultat;
    end if;
end //
DELIMITER ;
select masse from planete; -- verif des masses avant ajout
CALL UpdatePlaneteMasse(10.0); -- ajoute 10 à la masse des 5 premières planetes
select masse from planete; -- verif de l'ajout
select nom_satellite,  case when est_humain = true then 'Humain' else 'Non humain' end as statut_humain from satellite; -- verif si satellite est humain ou pas
explain SELECT * FROM planete WHERE id_planete = 1; -- affiche le plan d'execution de la requete 
select annee_decouverte from planete;
select distinct annee_decouverte from planete ; -- affiche année de decouverte unique meme si plusieurs planete decouverte la même année;
select distinct annee_decouverte from planete where annee_decouverte between 900 and 1100; -- affiche année de decouverte entre 900 et 1100 unique meme si plusieurs planete decouverte la même année;  
select * from planete where type like "%gazeuse"; -- affiche les planetes dont le type contient le mot gazeuse
select * from organisation where nom_organisation in ("NASA" , "ISRO");

CREATE VIEW VueInformation AS
SELECT
    P.id_planete,
    P.nom_planete,
    P.superficie,
    P.masse,
    P.type AS type_planete,
    G.id_galaxie,
    G.nom_galaxie,
    O.id_organisation,
    O.nom_organisation,
    O.pays AS pays_organisation,
    S.id_satellite,
    S.nom_satellite,
    S.type_info
    
    

FROM
    planete P
JOIN appartenir AP ON P.id_planete = AP.id_planete
JOIN galaxie G ON AP.id_galaxie = G.id_galaxie
LEFT JOIN satellite S ON P.id_planete = S.id_planete
LEFT JOIN organisation O ON S.id_organisation = O.id_organisation
LEFT JOIN analyser A ON O.id_organisation = A.id_organisation;


SELECT * FROM VueInformation






