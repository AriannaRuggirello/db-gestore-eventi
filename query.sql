Selezionare tutti gli eventi gratis, cioè con prezzo nullo (19) 

SELECT * FROM `events` WHERE `price` IS null;

Selezionare tutte le location in ordine alfabetico (82)

SELECT * FROM `locations`ORDER BY `name` ASC;

Selezionare tutti gli eventi che costano meno di 20 euro e durano meno di 3 ore (38)

SELECT * FROM `events` WHERE `price` < 20 AND `duration` < 030000; 


Selezionare tutti gli eventi di dicembre 2023
    (25) 

    SELECT * FROM `events`
    WHERE MONTH(start) = 12 AND YEAR(start) = 2023;




Selezionare tutti gli eventi con una durata maggiore alle 2 ore (823) 

    SELECT * FROM `events` WHERE `duration` > 020000;




Selezionare tutti gli eventi, mostrando nome, data di inizio, ora di inizio, ora di fine e
-- durata totale (1040) 

    SELECT `name`,`start`,`end_of_sale`,`duration` FROM `events`;




Selezionare tutti gli eventi aggiunti da “Fabiano Lombardo” (id: 1202) (132) 

    SELECT * FROM `events`WHERE `user_id` = 1202;




Selezionare il numero totale di eventi per ogni fascia di prezzo (81) 

    SELECT
    SUM(CASE WHEN `price` BETWEEN 0 AND 10 THEN 1 ELSE 0 END) AS fascia_0_10,
    SUM(CASE WHEN `price` BETWEEN 11 AND 20 THEN 1 ELSE 0 END) AS fascia_11_20,
    SUM(CASE WHEN `price` BETWEEN 21 AND 30 THEN 1 ELSE 0 END) AS fascia_21_30,
    SUM(CASE WHEN `price` BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS fascia_31_40
    FROM
    `events`;


Selezionare tutti gli utenti admin ed editor (9) 

    SELECT *
    FROM users
    WHERE role_id IN (1, 2);


Selezionare tutti i concerti (eventi con il tag “concerti”) (72) 

SELECT
    `e`.*
FROM
    `events` `e`
JOIN
    `event_tag` `et` ON `e`.`id` = `et`.`event_id`
JOIN
    `tags` `t` ON `et`.`tag_id` = `t`.`id`
WHERE
    `t`.`name` = 'concerti';



Selezionare tutti i tag e il prezzo medio degli eventi a loro collegati (11) 




Selezionare tutte le location e mostrare quanti eventi si sono tenute in ognuna di
esse (82) 

SELECT 
    `locations`.`id`,
    `locations`.`name` AS `location_name`,
    COUNT(`events`.`id`) AS `numero_eventi`
FROM 
    `locations`
LEFT JOIN 
    `events` ON `locations`.`id` = `events`.`location_id`
GROUP BY 
    `locations`.`id`, `locations`.`name`;



Selezionare tutti i partecipanti per l’evento “Concerto Classico Serale” (slug:
concerto-classico-serale, id: 34) (30) 

SELECT 
    `u`.*
FROM 
    `bookings` `b`
JOIN 
    `events` `e` ON `e`.`id` = `b`.`event_id`
JOIN 
    `users` `u` ON `u`.`id` = `b`.`user_id`
WHERE 
    `e`.`id` = 34;



Selezionare tutti i partecipanti all’evento “Festival Jazz Estivo” (slug:
festival-jazz-estivo, id: 2) specificando nome e cognome (13) 

SELECT 
    `u`.`first_name` AS `name`,
    `u`.`last_name` AS `surname`
FROM 
    `bookings` `b`
JOIN 
    `events` `e` ON `e`.`id` = `b`.`event_id`
JOIN 
    `users` `u` ON `u`.`id` = `b`.`user_id`
WHERE 
    `e`.`id` = 2;



Selezionare tutti gli eventi sold out (dove il totale delle prenotazioni è uguale ai
biglietti totali per l’evento) (18) 

SELECT `events`.*
FROM `events`
WHERE `events`.`total_tickets` = (
    SELECT COUNT(*)
    FROM `bookings`
    WHERE `bookings`.`event_id` = `events`.`id`
);


Selezionare tutte le location in ordine per chi ha ospitato più eventi (82) 





Selezionare tutti gli utenti che si sono prenotati a più di 70 eventi (74) 




Selezionare tutti gli eventi, mostrando il nome dell’evento, il nome della location, il
numero di prenotazioni e il totale di biglietti ancora disponibili per l’evento (1040) 

SELECT events.name as EventName, 
locations.name as LocationName
FROM `events`
JOIN locations on events.location_id = locations.id;