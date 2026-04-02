----first thing i want to check is whether any card in "stg_runs" is not missing in dim_cards

SELECT DISTINCT card_type, card_name FROM mt2.main.stg_cards;


SELECT DISTINCT card_type, card_name FROM mt2.main.dim_cards WHERE cost NOT NULL;



SELECT
    COALESCE(s.card_type, d.card_type)   AS card_type,
    COALESCE(s.card_name, d.card_name)   AS card_name,
    CASE WHEN s.card_name IS NOT NULL THEN 1 ELSE 0 END AS in_stg,
    CASE WHEN d.card_name IS NOT NULL THEN 1 ELSE 0 END AS in_dim
FROM (SELECT DISTINCT card_type, card_name FROM mt2.main.stg_cards) AS s
JOIN (SELECT DISTINCT card_type, card_name FROM mt2.main.dim_cards WHERE cost IS NOT NULL) AS d
    ON s.card_name = d.card_name
ORDER BY card_type, card_name;



----Bring in overall MT2 Runs data

DROP TABLE IF EXISTS mt2;


----have to attach database first
CREATE TABLE mt2 AS
SELECT * FROM mt2.main.stg_runs;

SELECT * FROM mt2 LIMIT 2;


----Lets limit to just Banisehd


DROP TABLE IF EXISTS banished;

CREATE TABLE banished AS
SELECT * FROM mt2
WHERE primary_clan = 'Banished' OR secondary_clan = 'Banished';


SELECT * FROM banished;


SELECT
    primary_clan,
    secondary_clan,
    result,
    COUNT(*)
FROM banished
GROUP BY primary_clan, secondary_clan, result
ORDER BY primary_clan, secondary_clan;



----I need the table for which ring i lost in

DROP TABLE IF EXISTS banished_results;
CREATE TABLE banished_results AS
SELECT
    run_id,
    CASE
        WHEN battle_2 IS NULL THEN 'Ring 1'
        WHEN battle_3 IS NULL THEN 'Ring 2'
        WHEN battle_4 IS NULL THEN 'Ring 3'
        WHEN battle_5 IS NULL THEN 'Ring 4'
        WHEN battle_6 IS NULL THEN 'Ring 5'
        WHEN battle_7 IS NULL THEN 'Ring 6'
        WHEN battle_8 IS NULL THEN 'Ring 7'
        --below logic will change if i switch to doing Titan runs
        WHEN result='Loss' THEN 'Ring 8'
        ELSE 'Victory'
        END AS end_result
FROM banished;


SELECT * FROM banished_results;


SELECT end_result, COUNT(*) from banished_results GROUP BY end_result ORDER BY end_result;;






---I want to calculate number of spells, equipment, units, rooms, blights

DROP TABLE IF EXISTS banished_cards;

CREATE TABLE banished_cards AS
WITH run_cards AS (
    SELECT b.primary_clan, b.secondary_clan,d.*
    FROM banished AS b
    LEFT JOIN mt2.main.dim_cards AS d
        ON b.run_id = d.run_id
)
SELECT 
    run_id,
    SUM(copies) AS num_cards,
    SUM(upgrades) AS num_upgrades,
    SUM(CASE WHEN card_type='Unit' THEN copies ELSE 0 END) AS num_units,
    SUM(CASE WHEN card_type='Spell' THEN copies ELSE 0 END) as num_spells,
    SUM(CASE WHEN card_type='Equipment' THEN copies ELSE 0 END) as num_equipment,
    SUM(CASE WHEN card_type='Room' THEN copies ELSE 0 END) as num_rooms,
    SUM(CASE WHEN card_type='Blight' THEN copies ELSE 0 END) as num_blights,
    SUM(CASE WHEN card_type='Unit' THEN upgrades ELSE 0 END) AS unit_upgrades,
    SUM(CASE WHEN card_type='Spell' THEN upgrades ELSE 0 END) as spell_upgrades,
    SUM(CASE WHEN cost=0 THEN copies ELSE 0 END) as zero_cost_cards,
    SUM(CASE WHEN cost=1 THEN copies ELSE 0 END) as one_cost_cards,
    SUM(CASE WHEN cost=2 THEN copies ELSE 0 END) as two_cost_cards,
    SUM(CASE WHEN cost=3 THEN copies ELSE 0 END) as three_cost_cards,
    SUM(CASE WHEN cost=99 THEN copies ELSE 0 END) as variable_cost_cards,
    SUM(CASE WHEN consume='Yes' THEN copies ELSE 0 END) as num_consumes,
    SUM(CASE WHEN banner='Yes' THEN copies ELSE 0 END) as num_banners,
    SUM(CASE WHEN cost>3 AND cost !=99 THEN copies ELSE 0 END) as high_cost_cards,
    SUM(CASE WHEN clan='Banished' THEN copies ELSE 0 END) as banished_cards,
    SUM(CASE WHEN clan='Banished' AND card_type='Unit' THEN copies ELSE 0 END) as banished_units,
    SUM(CASE WHEN clan='Banished' AND card_type='Spell' THEN copies ELSE 0 END) as banished_spells,
    SUM(CASE WHEN clan='Banished' AND card_type='Equipment' THEN copies ELSE 0 END) as banished_equipment,
    SUM(CASE WHEN clan='Banished' AND card_type='Room' THEN copies ELSE 0 END) as banished_rooms

FROM run_cards
GROUP BY run_id, primary_clan, secondary_clan
ORDER BY run_id, primary_clan, secondary_clan;






SELECT * FROM banished_cards;
SELECT * FROM mt2.main.dim_cards LIMIT 2;

    
----so now i have the counts of card type and upgrades, and what level i got to
---I want to see how MANY of the cards are of a given class


----Things i want to do is
----calculate cost of cards
----merge in what ring i lost in or if i won
----bring in other card data from the seeds.




DROP TABLE IF EXISTS run_cards_summary;

CREATE TABLE run_cards_summary AS
WITH run_cards AS (
    SELECT
        d.*,
        m.primary_clan,
        m.secondary_clan,
        m.result,
        CASE
            WHEN d.clan = 'Clanless'                                     THEN 'Clanless'
            WHEN d.clan = m.primary_clan                                 THEN 'Primary'
            WHEN d.clan = m.secondary_clan                               THEN 'Secondary'
            ELSE 'Another Clan'
        END AS card_source
    FROM mt2 AS m
    LEFT JOIN mt2.main.dim_cards AS d ON m.run_id = d.run_id
),

final_battles AS (
    SELECT run_id,
        CASE
            WHEN battle_2 IS NULL THEN 1
            WHEN battle_3 IS NULL THEN 2
            WHEN battle_4 IS NULL THEN 3
            WHEN battle_5 IS NULL THEN 4
            WHEN battle_6 IS NULL THEN 5
            WHEN battle_7 IS NULL THEN 6
            WHEN battle_8 IS NULL THEN 7
            ELSE 8
        END AS final_battle
    FROM mt2
)

SELECT
    rc.run_id,
    rc.primary_clan,
    rc.secondary_clan,
    rc.result,
    fb.final_battle,

    -- totals
    SUM(copies)                                                              AS num_cards,
    SUM(upgrades)                                                            AS num_upgrades,

    -- by card type
    SUM(CASE WHEN card_type = 'Unit'      THEN copies ELSE 0 END)           AS num_units,
    SUM(CASE WHEN card_type = 'Spell'     THEN copies ELSE 0 END)           AS num_spells,
    SUM(CASE WHEN card_type = 'Equipment' THEN copies ELSE 0 END)           AS num_equipment,
    SUM(CASE WHEN card_type = 'Room'      THEN copies ELSE 0 END)           AS num_rooms,
    SUM(CASE WHEN card_type = 'Blight'    THEN copies ELSE 0 END)           AS num_blights,

    -- by clan source
    SUM(CASE WHEN card_source = 'Primary'   THEN copies ELSE 0 END)         AS primary_cards,
    SUM(CASE WHEN card_source = 'Secondary' THEN copies ELSE 0 END)         AS secondary_cards,
    SUM(CASE WHEN card_source = 'Other'     THEN copies ELSE 0 END)         AS other_cards,

    -- primary clan breakdown by type
    SUM(CASE WHEN card_source = 'Primary' AND card_type = 'Unit'      THEN copies ELSE 0 END) AS primary_units,
    SUM(CASE WHEN card_source = 'Primary' AND card_type = 'Spell'     THEN copies ELSE 0 END) AS primary_spells,
    SUM(CASE WHEN card_source = 'Primary' AND card_type = 'Equipment' THEN copies ELSE 0 END) AS primary_equipment,
    SUM(CASE WHEN card_source = 'Primary' AND card_type = 'Room'      THEN copies ELSE 0 END) AS primary_rooms,

    -- secondary clan breakdown by type
    SUM(CASE WHEN card_source = 'Secondary' AND card_type = 'Unit'      THEN copies ELSE 0 END) AS secondary_units,
    SUM(CASE WHEN card_source = 'Secondary' AND card_type = 'Spell'     THEN copies ELSE 0 END) AS secondary_spells,
    SUM(CASE WHEN card_source = 'Secondary' AND card_type = 'Equipment' THEN copies ELSE 0 END) AS secondary_equipment,
    SUM(CASE WHEN card_source = 'Secondary' AND card_type = 'Room'      THEN copies ELSE 0 END) AS secondary_rooms,

    -- upgrades by type
    SUM(CASE WHEN card_type = 'Unit'  THEN upgrades ELSE 0 END)             AS unit_upgrades,
    SUM(CASE WHEN card_type = 'Spell' THEN upgrades ELSE 0 END)             AS spell_upgrades,

    -- by cost
    SUM(CASE WHEN cost = 0              THEN copies ELSE 0 END)             AS zero_cost_cards,
    SUM(CASE WHEN cost = 1              THEN copies ELSE 0 END)             AS one_cost_cards,
    SUM(CASE WHEN cost = 2              THEN copies ELSE 0 END)             AS two_cost_cards,
    SUM(CASE WHEN cost = 3              THEN copies ELSE 0 END)             AS three_cost_cards,
    SUM(CASE WHEN cost = 99             THEN copies ELSE 0 END)             AS variable_cost_cards,
    SUM(CASE WHEN cost > 3 AND cost != 99 THEN copies ELSE 0 END)           AS high_cost_cards

FROM run_cards AS rc
LEFT JOIN final_battles AS fb ON rc.run_id = fb.run_id
GROUP BY rc.run_id, rc.primary_clan, rc.secondary_clan, rc.result, fb.final_battle
ORDER BY rc.run_id;



WITH run_cards AS (
    SELECT d.*
    FROM banished AS b
    LEFT JOIN mt2.main.dim_cards AS d
        ON b.run_id = d.run_id
)
SELECT * FROM run_cards LIMIT 2;



SELECT cost, card_type, COUNT(*) FROM mt2.card_attributes GROUP BY cost, card_type ORDER BY cost, card_type;