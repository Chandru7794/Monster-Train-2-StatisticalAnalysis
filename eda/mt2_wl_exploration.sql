-- ============================================================
-- MT2 WIN/LOSS EXPLORATION
-- Broad W/L analysis across all run-level variables.
-- Card composition analyses are in a separate file.
-- ============================================================
--
-- SECTIONS
--   1a. W/L by Primary Clan                        [2026-04-03]
--   1b. W/L by Secondary Clan                      [2026-04-03]
--   1c. W/L by Clan (either role)                  [2026-04-03]
--   2.  Clan Combinations                           [2026-04-03]
--   3.  W/L by Time/Run Segments                    [2026-04-03]
--       3a. By Month
--       3b. By Week
--       3c. By 10-Run Segment
--   4.  W/L by Covenant Level                         [2026-04-04]
--       4a. W/L by Covenant Level
--       4b. Runs to 5th Win per Covenant
--       4c. Longest Win/Loss Streaks per Covenant
--       4d. Clans within Longest Streaks per Covenant
--   5.  W/L by Pyreheart                               [2026-04-04]
--       5a. W/L by Pyreheart
--       5b. Top Pyrehearts Used per Covenant Level
--   6.  Ring Survival                                  [2026-04-04]
--       6a. Reach % and Survival % per Ring
--       6b. Reach and Survival by Encounter Name
--       6c. Primary Clan × Ring Survival (Rings 6–8)
--       6d. Primary Clan × Encounter Survival (Rings 6–8)
-- ============================================================

-- Attach the database first in your SQL client:
-- ATTACH 'data/mt2.duckdb' AS mt2;

-- Base runs table — referenced by all sections below
DROP TABLE IF EXISTS runs;
CREATE TABLE runs AS
SELECT
    *,
    CASE WHEN result = 'Victory' THEN 1 ELSE 0 END AS win
FROM mt2.main.stg_runs
WHERE result IN ('Victory', 'Loss');

SELECT * FROM runs;
-- ============================================================
-- SECTION 1: W/L by Clan (primary, secondary, either)
-- 2026-04-03
-- ============================================================

-- 1a. W/L by PRIMARY clan
SELECT
    primary_clan AS clan,
    SUM(win) AS wins,
    COUNT(*) - SUM(win) AS losses,
    COUNT(*) AS total_runs,
    PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct
FROM runs
GROUP BY primary_clan
ORDER BY CASE primary_clan
    WHEN 'Banished' THEN 1 WHEN 'Pyreborne' THEN 2
    WHEN 'Luna Coven' THEN 3 WHEN 'Underlegion' THEN 4
    WHEN 'Lazarus League' THEN 5 WHEN 'Hellhorned' THEN 6
    WHEN 'Awoken' THEN 7 WHEN 'Stygian Guard' THEN 8
    WHEN 'Umbra' THEN 9 WHEN 'Melting Remnant' THEN 10
    WHEN 'Wurmkin' THEN 11 WHEN 'Railforged' THEN 12
END;

-- 1b. W/L by SECONDARY clan
SELECT
    secondary_clan AS clan,
    SUM(win) AS wins,
    COUNT(*) - SUM(win) AS losses,
    COUNT(*) AS total_runs,
    PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct
FROM runs
WHERE secondary_clan IS NOT NULL
GROUP BY secondary_clan
ORDER BY CASE secondary_clan
    WHEN 'Banished' THEN 1 WHEN 'Pyreborne' THEN 2
    WHEN 'Luna Coven' THEN 3 WHEN 'Underlegion' THEN 4
    WHEN 'Lazarus League' THEN 5 WHEN 'Hellhorned' THEN 6
    WHEN 'Awoken' THEN 7 WHEN 'Stygian Guard' THEN 8
    WHEN 'Umbra' THEN 9 WHEN 'Melting Remnant' THEN 10
    WHEN 'Wurmkin' THEN 11 WHEN 'Railforged' THEN 12
END;

-- 1c. W/L by clan — EITHER role (primary or secondary)
WITH combined AS (
    SELECT
        primary_clan AS clan,
        win
    FROM runs
    UNION ALL
    SELECT
        secondary_clan,
        win
    FROM runs
    WHERE secondary_clan IS NOT NULL
)

SELECT
    clan,
    SUM(win) AS wins,
    COUNT(*) - SUM(win) AS losses,
    COUNT(*) AS total_appearances,
    PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct
FROM combined
GROUP BY clan
ORDER BY CASE clan
    WHEN 'Banished' THEN 1 WHEN 'Pyreborne' THEN 2
    WHEN 'Luna Coven' THEN 3 WHEN 'Underlegion' THEN 4
    WHEN 'Lazarus League' THEN 5 WHEN 'Hellhorned' THEN 6
    WHEN 'Awoken' THEN 7 WHEN 'Stygian Guard' THEN 8
    WHEN 'Umbra' THEN 9 WHEN 'Melting Remnant' THEN 10
    WHEN 'Wurmkin' THEN 11 WHEN 'Railforged' THEN 12
END;

-- ============================================================
-- SECTION 2: Clan Combinations (role-agnostic)
-- 2026-04-03
-- ============================================================

-- Pair is ordered by canonical clan rank so (A+B) and (B+A) collapse into the same row
WITH clan_rank AS (
    SELECT
        clan,
        rank
    FROM (
        VALUES
        ('Banished', 1), ('Pyreborne', 2),
        ('Luna Coven', 3), ('Underlegion', 4),
        ('Lazarus League', 5), ('Hellhorned', 6),
        ('Awoken', 7), ('Stygian Guard', 8),
        ('Umbra', 9), ('Melting Remnant', 10),
        ('Wurmkin', 11), ('Railforged', 12)
    ) AS t(clan, rank)
),

ordered_pairs AS (
    SELECT
        win,
        CASE WHEN pr.rank <= sr.rank THEN primary_clan ELSE secondary_clan END
            AS clan_1,
        CASE WHEN pr.rank <= sr.rank THEN secondary_clan ELSE primary_clan END
            AS clan_2
    FROM runs
    LEFT JOIN clan_rank AS pr ON runs.primary_clan = pr.clan
    LEFT JOIN clan_rank AS sr ON runs.secondary_clan = sr.clan
    WHERE secondary_clan IS NOT NULL
)

SELECT
    clan_1,
    clan_2,
    SUM(win) AS wins,
    COUNT(*) - SUM(win) AS losses,
    COUNT(*) AS total_runs,
    PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct,
    PRINTF(
        '%.1f%%', COUNT(
            *) * 100.0 / (
            SELECT COUNT(*) FROM runs
            WHERE secondary_clan IS NOT NULL
        )
    ) AS pct_of_all_runs
FROM ordered_pairs
GROUP BY clan_1, clan_2
ORDER BY
    CASE clan_1
        WHEN 'Banished' THEN 1 WHEN 'Pyreborne' THEN 2
        WHEN 'Luna Coven' THEN 3 WHEN 'Underlegion' THEN 4
        WHEN 'Lazarus League' THEN 5 WHEN 'Hellhorned' THEN 6
        WHEN 'Awoken' THEN 7 WHEN 'Stygian Guard' THEN 8
        WHEN 'Umbra' THEN 9 WHEN 'Melting Remnant' THEN 10
        WHEN 'Wurmkin' THEN 11 WHEN 'Railforged' THEN 12
    END,
    CASE clan_2
        WHEN 'Banished' THEN 1 WHEN 'Pyreborne' THEN 2
        WHEN 'Luna Coven' THEN 3 WHEN 'Underlegion' THEN 4
        WHEN 'Lazarus League' THEN 5 WHEN 'Hellhorned' THEN 6
        WHEN 'Awoken' THEN 7 WHEN 'Stygian Guard' THEN 8
        WHEN 'Umbra' THEN 9 WHEN 'Melting Remnant' THEN 10
        WHEN 'Wurmkin' THEN 11 WHEN 'Railforged' THEN 12
    END;

-- ============================================================
-- SECTION 3: W/L by Time/Run Segments
-- 2026-04-03
-- ============================================================

-- Helper: clan appearances per run (either role), used in all three subsections
DROP TABLE IF EXISTS run_clans;
CREATE TABLE run_clans AS
SELECT
    run_id,
    primary_clan AS clan
FROM runs
UNION ALL
SELECT
    run_id,
    secondary_clan
FROM runs
WHERE secondary_clan IS NOT NULL;


-- 3a. W/L by MONTH
WITH monthly AS (
    SELECT
        win,
        run_id,
        STRFTIME(run_date, '%Y-%m') AS month
    FROM runs
),

monthly_stats AS (
    SELECT
        month,
        SUM(win) AS wins,
        COUNT(*) - SUM(win) AS losses,
        COUNT(*) AS total_runs,
        PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct
    FROM monthly
    GROUP BY month
),

monthly_clan_ranks AS (
    SELECT
        rc.clan,
        STRFTIME(r.run_date, '%Y-%m') AS month,
        COUNT(*) AS appearances,
        ROW_NUMBER() OVER (
            PARTITION BY STRFTIME(r.run_date, '%Y-%m')
            ORDER BY COUNT(*) DESC
        ) AS clan_rank
    FROM runs AS r
    INNER JOIN run_clans AS rc ON r.run_id = rc.run_id
    GROUP BY month, rc.clan
)

SELECT
    ms.month,
    ms.wins,
    ms.losses,
    ms.total_runs,
    ms.win_pct,
    MAX(CASE WHEN cr.clan_rank = 1 THEN cr.clan END) AS top_clan_1,
    MAX(CASE WHEN cr.clan_rank = 2 THEN cr.clan END) AS top_clan_2,
    MAX(CASE WHEN cr.clan_rank = 3 THEN cr.clan END) AS top_clan_3
FROM monthly_stats AS ms
LEFT JOIN monthly_clan_ranks AS cr ON ms.month = cr.month AND cr.clan_rank <= 3
GROUP BY ms.month, ms.wins, ms.losses, ms.total_runs, ms.win_pct
ORDER BY ms.month;

-- 3b. W/L by WEEK
WITH weekly AS (
    SELECT
        win,
        run_id,
        STRFTIME(run_date, '%Y-W%W') AS week
    FROM runs
),

weekly_stats AS (
    SELECT
        week,
        SUM(win) AS wins,
        COUNT(*) - SUM(win) AS losses,
        COUNT(*) AS total_runs,
        PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct
    FROM weekly
    GROUP BY week
),

weekly_clan_ranks AS (
    SELECT
        rc.clan,
        STRFTIME(r.run_date, '%Y-W%W') AS week,
        COUNT(*) AS appearances,
        ROW_NUMBER() OVER (
            PARTITION BY STRFTIME(r.run_date, '%Y-W%W')
            ORDER BY COUNT(*) DESC
        ) AS clan_rank
    FROM runs AS r
    INNER JOIN run_clans AS rc ON r.run_id = rc.run_id
    GROUP BY week, rc.clan
)

SELECT
    ws.week,
    ws.wins,
    ws.losses,
    ws.total_runs,
    ws.win_pct,
    MAX(CASE WHEN cr.clan_rank = 1 THEN cr.clan END) AS top_clan_1,
    MAX(CASE WHEN cr.clan_rank = 2 THEN cr.clan END) AS top_clan_2,
    MAX(CASE WHEN cr.clan_rank = 3 THEN cr.clan END) AS top_clan_3
FROM weekly_stats AS ws
LEFT JOIN weekly_clan_ranks AS cr ON ws.week = cr.week AND cr.clan_rank <= 3
GROUP BY ws.week, ws.wins, ws.losses, ws.total_runs, ws.win_pct
ORDER BY ws.week;

-- 3c. W/L by 10-RUN SEGMENT
WITH segmented AS (
    SELECT
        win,
        run_id,
        CEIL(run_id / 10.0) AS segment_num,
        PRINTF(
            'Runs %d-%d',
            ((CEIL(run_id / 10.0) - 1) * 10 + 1)::INTEGER,
            (CEIL(run_id / 10.0) * 10)::INTEGER
        ) AS segment_label
    FROM runs
),

segment_stats AS (
    SELECT
        segment_num,
        segment_label,
        SUM(win) AS wins,
        COUNT(*) - SUM(win) AS losses,
        COUNT(*) AS total_runs,
        PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct
    FROM segmented
    GROUP BY segment_num, segment_label
),

segment_clan_ranks AS (
    SELECT
        rc.clan,
        CEIL(r.run_id / 10.0) AS segment_num,
        COUNT(*) AS appearances,
        ROW_NUMBER() OVER (
            PARTITION BY CEIL(r.run_id / 10.0)
            ORDER BY COUNT(*) DESC
        ) AS clan_rank
    FROM runs AS r
    INNER JOIN run_clans AS rc ON r.run_id = rc.run_id
    GROUP BY segment_num, rc.clan
)

SELECT
    ss.segment_label,
    ss.wins,
    ss.losses,
    ss.total_runs,
    ss.win_pct,
    MAX(CASE WHEN cr.clan_rank = 1 THEN cr.clan END) AS top_clan_1,
    MAX(CASE WHEN cr.clan_rank = 2 THEN cr.clan END) AS top_clan_2,
    MAX(CASE WHEN cr.clan_rank = 3 THEN cr.clan END) AS top_clan_3
FROM segment_stats AS ss
LEFT JOIN
    segment_clan_ranks AS cr
    ON ss.segment_num = cr.segment_num AND cr.clan_rank <= 3
GROUP BY
    ss.segment_num,
    ss.segment_label,
    ss.wins,
    ss.losses,
    ss.total_runs,
    ss.win_pct
ORDER BY ss.segment_num;


-- ============================================================
-- SECTION 4: W/L by Covenant Level
-- 2026-04-04
-- ============================================================

-- 4a. W/L by Covenant Level
SELECT
    covenant_rank,
    SUM(win)                                            AS wins,
    COUNT(*) - SUM(win)                                 AS losses,
    COUNT(*)                                            AS total_runs,
    PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*))      AS win_pct
FROM runs
GROUP BY covenant_rank
ORDER BY covenant_rank;


-- 4b. Runs to 5th Win per Covenant
-- For each covenant level: how many runs at that covenant did it take to reach 5 wins?
-- Rows with NULL runs_to_5th_win have not yet reached 5 wins.
WITH wins_numbered AS (
    SELECT
        run_id,
        covenant_rank,
        ROW_NUMBER() OVER (
            PARTITION BY covenant_rank ORDER BY run_id
        ) AS win_num
    FROM runs
    WHERE win = 1
),

fifth_win_run AS (
    SELECT covenant_rank, run_id AS fifth_win_run_id
    FROM wins_numbered
    WHERE win_num = 5
),

runs_to_fifth AS (
    SELECT
        r.covenant_rank,
        COUNT(*) AS runs_to_5th_win
    FROM runs AS r
    INNER JOIN fifth_win_run AS fw ON r.covenant_rank = fw.covenant_rank
    WHERE r.run_id <= fw.fifth_win_run_id
    GROUP BY r.covenant_rank
)

SELECT
    r.covenant_rank,
    SUM(r.win)              AS total_wins,
    COUNT(*) - SUM(r.win)  AS total_losses,
    COUNT(*)                AS total_runs,
    rf.runs_to_5th_win
FROM runs AS r
LEFT JOIN runs_to_fifth AS rf ON r.covenant_rank = rf.covenant_rank
GROUP BY r.covenant_rank, rf.runs_to_5th_win
ORDER BY r.covenant_rank;


-- 4c. Longest Win/Loss Streaks per Covenant
-- Uses gaps-and-islands: within each covenant, consecutive same results form an island.
WITH numbered AS (
    SELECT
        covenant_rank,
        run_id,
        win,
        ROW_NUMBER() OVER (
            PARTITION BY covenant_rank ORDER BY run_id
        ) AS rn
    FROM runs
),

islands AS (
    SELECT
        covenant_rank,
        win,
        rn - ROW_NUMBER() OVER (
            PARTITION BY covenant_rank, win ORDER BY rn
        ) AS grp
    FROM numbered
),

streak_lengths AS (
    SELECT
        covenant_rank,
        win,
        COUNT(*) AS streak_len
    FROM islands
    GROUP BY covenant_rank, win, grp
)

SELECT
    covenant_rank,
    MAX(CASE WHEN win = 1 THEN streak_len END) AS longest_win_streak,
    MAX(CASE WHEN win = 0 THEN streak_len END) AS longest_loss_streak
FROM streak_lengths
GROUP BY covenant_rank
ORDER BY covenant_rank;


-- ============================================================
-- SECTION 5: W/L by Pyreheart
-- 2026-04-04
-- ============================================================

-- 5a. W/L by Pyreheart
SELECT
    pyre_heart,
    SUM(win) AS wins,
    COUNT(*) - SUM(win) AS losses,
    COUNT(*) AS total_runs,
    PRINTF('%.1f%%', SUM(win) * 100.0 / COUNT(*)) AS win_pct
FROM runs
GROUP BY pyre_heart
ORDER BY total_runs DESC;


-- 5b. Top Pyrehearts Used per Covenant Level
-- One row per covenant; top 3 pyrehearts by usage within that covenant
WITH pyreheart_counts AS (
    SELECT
        covenant_rank,
        pyre_heart,
        COUNT(*) AS n,
        ROW_NUMBER() OVER (
            PARTITION BY covenant_rank ORDER BY COUNT(*) DESC
        ) AS rn
    FROM runs
    GROUP BY covenant_rank, pyre_heart
)

SELECT
    covenant_rank,
    MAX(CASE WHEN rn = 1 THEN pyre_heart || ' (' || n || ')' END) AS top_pyre_heart_1,
    MAX(CASE WHEN rn = 2 THEN pyre_heart || ' (' || n || ')' END) AS top_pyre_heart_2,
    MAX(CASE WHEN rn = 3 THEN pyre_heart || ' (' || n || ')' END) AS top_pyre_heart_3
FROM pyreheart_counts
GROUP BY covenant_rank
ORDER BY covenant_rank;


-- ============================================================
-- SECTION 6: Ring Survival
-- 2026-04-04
-- Reached ring N  = battle_N is not null
-- Survived ring N = battle_{N+1} is not null (rings 1-7)
--                   OR result = 'Victory' (ring 8)
-- Note: Ring 9 exists in future data (Titan fights) but is not
--       present yet — ring 8 survival uses Victory as proxy.
-- ============================================================

-- 6a. Reach % and Survival % per Ring
WITH ring_stats AS (
    SELECT 1 AS ring, COUNT(*) AS reached,
        COUNT(CASE WHEN battle_2 IS NOT NULL THEN 1 END) AS survived
    FROM runs WHERE battle_1 IS NOT NULL
    UNION ALL
    SELECT 2, COUNT(*),
        COUNT(CASE WHEN battle_3 IS NOT NULL THEN 1 END)
    FROM runs WHERE battle_2 IS NOT NULL
    UNION ALL
    SELECT 3, COUNT(*),
        COUNT(CASE WHEN battle_4 IS NOT NULL THEN 1 END)
    FROM runs WHERE battle_3 IS NOT NULL
    UNION ALL
    SELECT 4, COUNT(*),
        COUNT(CASE WHEN battle_5 IS NOT NULL THEN 1 END)
    FROM runs WHERE battle_4 IS NOT NULL
    UNION ALL
    SELECT 5, COUNT(*),
        COUNT(CASE WHEN battle_6 IS NOT NULL THEN 1 END)
    FROM runs WHERE battle_5 IS NOT NULL
    UNION ALL
    SELECT 6, COUNT(*),
        COUNT(CASE WHEN battle_7 IS NOT NULL THEN 1 END)
    FROM runs WHERE battle_6 IS NOT NULL
    UNION ALL
    SELECT 7, COUNT(*),
        COUNT(CASE WHEN battle_8 IS NOT NULL THEN 1 END)
    FROM runs WHERE battle_7 IS NOT NULL
    UNION ALL
    SELECT 8, COUNT(*),
        COUNT(CASE WHEN win = 1 THEN 1 END)
    FROM runs WHERE battle_8 IS NOT NULL
),

total_runs AS (SELECT COUNT(*) AS n FROM runs)

SELECT
    rs.ring,
    rs.reached,
    PRINTF('%.1f%%', rs.reached * 100.0 / tr.n)        AS pct_of_all_runs,
    rs.survived,
    PRINTF('%.1f%%', rs.survived * 100.0 / rs.reached) AS survival_pct
FROM ring_stats AS rs
CROSS JOIN total_runs AS tr
ORDER BY rs.ring;


-- 6b. Reach and Survival by Encounter Name
-- One row per ring × encounter; survival defined same as 6a.
WITH encounters AS (
    SELECT 1 AS ring, battle_1 AS encounter,
        CASE WHEN battle_2 IS NOT NULL THEN 1 ELSE 0 END AS survived
    FROM runs WHERE battle_1 IS NOT NULL
    UNION ALL
    SELECT 2, battle_2,
        CASE WHEN battle_3 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_2 IS NOT NULL
    UNION ALL
    SELECT 3, battle_3,
        CASE WHEN battle_4 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_3 IS NOT NULL
    UNION ALL
    SELECT 4, battle_4,
        CASE WHEN battle_5 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_4 IS NOT NULL
    UNION ALL
    SELECT 5, battle_5,
        CASE WHEN battle_6 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_5 IS NOT NULL
    UNION ALL
    SELECT 6, battle_6,
        CASE WHEN battle_7 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_6 IS NOT NULL
    UNION ALL
    SELECT 7, battle_7,
        CASE WHEN battle_8 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_7 IS NOT NULL
    UNION ALL
    SELECT 8, battle_8,
        win
    FROM runs WHERE battle_8 IS NOT NULL
)

SELECT
    ring,
    encounter,
    COUNT(*) AS reached,
    SUM(survived) AS survived,
    PRINTF('%.1f%%', SUM(survived) * 100.0 / COUNT(*)) AS survival_pct
FROM encounters
GROUP BY ring, encounter
ORDER BY ring, reached DESC;


-- 6c. Primary Clan × Ring Survival (Rings 6–8)
-- One row per primary clan × ring; cleaner first-pass view before encounter detail.
WITH late_rings AS (
    SELECT primary_clan, 6 AS ring,
        CASE WHEN battle_7 IS NOT NULL THEN 1 ELSE 0 END AS survived
    FROM runs WHERE battle_6 IS NOT NULL
    UNION ALL
    SELECT primary_clan, 7,
        CASE WHEN battle_8 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_7 IS NOT NULL
    UNION ALL
    SELECT primary_clan, 8, win
    FROM runs WHERE battle_8 IS NOT NULL
)

SELECT
    ring,
    primary_clan,
    COUNT(*) AS reached,
    SUM(survived) AS survived,
    PRINTF('%.1f%%', SUM(survived) * 100.0 / COUNT(*)) AS survival_pct
FROM late_rings
GROUP BY ring, primary_clan
ORDER BY
    ring,
    CASE primary_clan
        WHEN 'Banished'        THEN 1  WHEN 'Pyreborne'       THEN 2
        WHEN 'Luna Coven'      THEN 3  WHEN 'Underlegion'     THEN 4
        WHEN 'Lazarus League'  THEN 5  WHEN 'Hellhorned'      THEN 6
        WHEN 'Awoken'          THEN 7  WHEN 'Stygian Guard'   THEN 8
        WHEN 'Umbra'           THEN 9  WHEN 'Melting Remnant' THEN 10
        WHEN 'Wurmkin'         THEN 11 WHEN 'Railforged'      THEN 12
    END;


-- 6d. Primary Clan × Encounter Survival (Rings 6–8)
-- Rows with fewer than 3 runs should be treated as insufficient data.
WITH late_encounters AS (
    SELECT
        primary_clan,
        6 AS ring,
        battle_6 AS encounter,
        CASE WHEN battle_7 IS NOT NULL THEN 1 ELSE 0 END AS survived
    FROM runs WHERE battle_6 IS NOT NULL
    UNION ALL
    SELECT
        primary_clan,
        7,
        battle_7,
        CASE WHEN battle_8 IS NOT NULL THEN 1 ELSE 0 END
    FROM runs WHERE battle_7 IS NOT NULL
    UNION ALL
    SELECT
        primary_clan,
        8,
        battle_8,
        win
    FROM runs WHERE battle_8 IS NOT NULL
)

SELECT
    ring,
    encounter,
    primary_clan,
    COUNT(*) AS reached,
    SUM(survived) AS survived,
    PRINTF('%.1f%%', SUM(survived) * 100.0 / COUNT(*)) AS survival_pct
FROM late_encounters
GROUP BY ring, encounter, primary_clan
ORDER BY
    ring,
    encounter,
    CASE primary_clan
        WHEN 'Banished'        THEN 1  WHEN 'Pyreborne'       THEN 2
        WHEN 'Luna Coven'      THEN 3  WHEN 'Underlegion'     THEN 4
        WHEN 'Lazarus League'  THEN 5  WHEN 'Hellhorned'      THEN 6
        WHEN 'Awoken'          THEN 7  WHEN 'Stygian Guard'   THEN 8
        WHEN 'Umbra'           THEN 9  WHEN 'Melting Remnant' THEN 10
        WHEN 'Wurmkin'         THEN 11 WHEN 'Railforged'      THEN 12
    END;
