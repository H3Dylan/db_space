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
