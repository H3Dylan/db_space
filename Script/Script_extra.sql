-- Procédures stockées

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


-- vue 
create view vue (nom_planete, nom_galaxie, nom_satellite) as select planete.nom_planete, galaxie.nom_galaxie, satellite.nom_satellite from planete join appartenir on planete.id_planete = appartenir.id_planete join galaxie on appartenir.id_galaxie = galaxie.id_galaxie join satellite on planete.id_planete = satellite.id_planete;
select * from vue;


-- trigger
alter table planete add column  date_derniere_modification timestamp default current_timestamp on update current_timestamp; -- ajout d'une date de derniere modif dans la table planete

DELIMITER //

create trigger update_last_modified -- creation d'un trigger qui permet de mettre a jour la date de modif dans la table planete
before update
on planete for each row

begin
    set new.date_derniere_modification = NOW();
end //

DELIMITER ;
select * from planete where id_planete=1; -- verif avant maj
update planete set masse = masse + 50 where id_planete = 1; -- maj 
select * from planete where id_planete=1; -- verif si trigger ok 
