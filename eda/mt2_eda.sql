-- noqa: disable=all
DROP TABLE IF EXISTS mt2;


----have to attach database first
CREATE TABLE mt2 AS
SELECT
    *
FROM mt2.main.stg_runs;



SELECT * FROM mt2 ORDER BY run_id;


SELECT 
row_number() OVER (PARTITION BY clan) as consecutive_runs,* FROM clan_wl;





SELECT * FROM mt2;


--- Clan game-of-origin reference
--- MT1: Hellhorned, Awoken, Stygian Guard, Umbra, Melting Remnant, Wurmkin
--- MT2: Banished, Pyreborne, Luna Coven, Underlegion, Lazarus League, Railforged

DROP TABLE IF EXISTS clan_origin;
CREATE TABLE clan_origin AS
SELECT clan, game
FROM (VALUES
    ('Hellhorned',      'MT1'),
    ('Awoken',          'MT1'),
    ('Stygian Guard',   'MT1'),
    ('Umbra',           'MT1'),
    ('Melting Remnant', 'MT1'),
    ('Wurmkin',         'MT1'),
    ('Banished',        'MT2'),
    ('Pyreborne',       'MT2'),
    ('Luna Coven',      'MT2'),
    ('Underlegion',     'MT2'),
    ('Lazarus League',  'MT2'),
    ('Railforged',      'MT2')
) AS t(clan, game);

---Want to start with simple win loss by faction

DROP TABLE IF EXISTS clan_wl;
CREATE TABLE clan_wl AS
WITH 
    primary_wl AS (
        SELECT 
            primary_clan AS clan,
            COUNT(*) AS total_primary_clan,
            COUNT(CASE WHEN result='Victory' THEN 1 END) AS primary_victory,
            COUNT(CASE WHEN result='Loss' THEN 1 END) AS primary_loss
        FROM mt2 GROUP BY clan),
    secondary_wl AS (
        SELECT
            secondary_clan AS clan,
            COUNT(*) AS total_secondary_clan,
            COUNT(CASE WHEN result='Victory' THEN 1 END) AS secondary_victory,
            COUNT(CASE WHEN result='Loss' THEN 1 END) AS secondary_loss
        FROM mt2 GROUP BY clan)
        SELECT
            COALESCE(p.clan, s.clan) AS clan,
            (COALESCE(s.total_secondary_clan,0)+COALESCE(p.total_primary_clan,0)) AS total_clan,
            (COALESCE(s.secondary_victory,0)+COALESCE(p.primary_victory,0)) AS total_victory,
            (COALESCE(s.secondary_loss,0)+COALESCE(p.primary_loss,0)) AS total_loss,
            PRINTF('%.2f%%', total_victory * 100.0/total_clan) AS percent_total_wl,           
            p.total_primary_clan,
            p.primary_victory,
            p.primary_loss,
            PRINTF('%.2f%%', p.primary_victory * 100.0/p.total_primary_clan) AS percent_primary_wl,
            s.total_secondary_clan,
            s.secondary_victory, 
            s.secondary_loss,
            PRINTF('%.2f%%', s.secondary_victory * 100.0/s.total_secondary_clan) AS percent_secondary_wl
           
        FROM primary_wl AS p
        FULL OUTER JOIN secondary_wl AS s
    ON p.clan=s.clan
    ORDER BY
    CASE COALESCE(p.clan,s.clan)
        WHEN 'Banished'        THEN 1
        WHEN 'Pyreborne'       THEN 2
        WHEN 'Luna Coven'      THEN 3
        WHEN 'Underlegion'     THEN 4
        WHEN 'Lazarus League'  THEN 5
        WHEN 'Hellhorned'      THEN 6
        WHEN 'Awoken'          THEN 7
        WHEN 'Stygian Guard'   THEN 8
        WHEN 'Umbra'           THEN 9
        WHEN 'Melting Remnant' THEN 10
        WHEN 'Wurmkin'         THEN 11
        WHEN 'Railforged'      THEN 12
    END;

    
SELECT * FROM clan_wl;








------Below can't be done on stg_runs, will need a separate view for each battle.




-----Percent of time i beat a specific battle

WITH battles AS (
    SELECT '1_' || battle_1 AS battle,
    CASE WHEN battle_2 IS NOT NULL THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_1 IS NOT NULL

    UNION ALL
    SELECT '2_' || battle_2 AS battle,
    CASE WHEN battle_3 IS NOT NULL THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_2 IS NOT NULL

    UNION ALL
    SELECT '3_' || battle_3 AS battle,
    CASE WHEN battle_4 IS NOT NULL THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_3 IS NOT NULL

    UNION ALL
    SELECT '4_' || battle_4 AS battle,
    CASE WHEN battle_5 IS NOT NULL THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_4 IS NOT NULL

    UNION ALL
    SELECT '5_' || battle_5 AS battle,
    CASE WHEN battle_6 IS NOT NULL THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_5 IS NOT NULL

    UNION ALL
    SELECT '6_' || battle_6 AS battle,
    CASE WHEN battle_7 IS NOT NULL THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_6 IS NOT NULL

    UNION ALL
    SELECT '7_' || battle_7 AS battle,
    CASE WHEN battle_8 IS NOT NULL THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_7 IS NOT NULL

    UNION ALL
    SELECT '8_' || battle_8 AS battle,
    CASE WHEN result = 'Victory' THEN 1 ELSE 0 END AS won FROM mt2
    WHERE battle_8 IS NOT NULL)

SELECT 
    battle,
    COUNT(*) AS total_encounters,
    SUM(won) AS wins,
    COUNT(*) - SUM(won) AS losses,
    PRINTF('%.2f%%', SUM(won)*100.0/COUNT(*)) AS percent_battle_wl
FROM battles
GROUP BY battle
ORDER BY battle;




----Lets track how many cards in a given run

---cards can fall under "spell", "equipment", "unit", and "room", and "blight"
---How to identify each of these columns

----Need to turn the row of spell columns into an array, then add up that array.

SELECT * FROM mt2 LIMIT 5;


----get rid of the upgrades for counting card types

CREATE TABLE mt2_without_upgrades AS
SELECT * REPLACE(
    FLOOR(TRY_CAST(COLUMNS('spell_.*')::VARCHAR AS DOUBLE))::INTEGER AS COLUMNS('spell_.*')
) FROM mt2;




SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'mt2' 
AND column_name LIKE 'spell_%';


DROP TABLE IF EXISTS mt2_cards;

CREATE TABLE mt2_cards AS
SELECT FLOOR(list_sum([COLUMNS('spell_.*')::DOUBLE])) AS total_spells
FROM mt2;

SELECT total_spells FROM mt2_cards;


SELEC



SELECT spell_sanctuary FROM mt2 WHERE TRY_CAST(spell_sanctuary::VARCHAR AS DOUBLE) IS NULL AND spell_sanctuary IS NOT NULL;








CREATE TABLE mt2_cards AS
SELECT COALESCE(list_sum([FLOOR(TRY_CAST(NULLIF(COLUMNS('spell_.*'), '') AS DECIMAL))::INTEGER]), 0) AS total_spells
FROM mt2;





-----cards analysis
DROP TABLE IF EXISTS mt2_cards;

CREATE TABLE mt2_cards AS 
SELECT *
FROM mt2.main.stg_cards;



SELECT * FROM mt2_cards ORDER BY run_id, card_name LIMIT 200;

---ok now i can do EDA on all of this, c