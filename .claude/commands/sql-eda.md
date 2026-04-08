# /sql-eda — Ground-Level SQL Investigation

The user wants to open a new SQL EDA investigation. Their question or topic is:

> $ARGUMENTS

## Core Rule — Do Not Skip This

**Never build more than one section at a time. Never build anything without explicit approval.**

The workflow is always:
1. Ask one clarifying question or propose the next section
2. Wait for the user's answer or approval
3. Build only that one piece
4. Repeat

If the scope implies 10 sections, that is 10 separate question → approval → build cycles. Do not bundle them. Do not jump ahead. The user will say "build it" or "yes" or "go ahead" when ready — do not interpret silence or topic description as approval to build.

When you propose a section, describe in plain English:
- What the query will answer
- What columns/tables it will use
- Any assumption you're making about the data

Only write SQL after the user confirms.

---

## Starting a New Investigation

1. **Create the file shell first** (boilerplate only, no analysis queries yet) in `eda/` with a broad name that can accumulate many analyses over time — not a name scoped to just the first question.

2. **Ask one question at a time** to understand what the user is trying to figure out, which data sources are needed, and whether the data exists or needs to be created.

3. **Populate the file shell with this boilerplate only**, then stop and propose the first section:

```sql
-- ============================================================
-- <BROAD TITLE>
-- <one-line description of what this file covers>
-- ============================================================
--
-- SECTIONS
--   1. <First section title>    [YYYY-MM-DD]
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
```

4. **Add each section** only after the user approves, following these conventions:
   - Use `DROP TABLE IF EXISTS <name>; CREATE TABLE <name> AS ...` for intermediate working tables
   - Use CTEs for multi-step logic before the final SELECT
   - For clan-stratified output, use this ORDER BY:
     ```sql
     ORDER BY CASE clan
         WHEN 'Banished'        THEN 1  WHEN 'Pyreborne'       THEN 2
         WHEN 'Luna Coven'      THEN 3  WHEN 'Underlegion'     THEN 4
         WHEN 'Lazarus League'  THEN 5  WHEN 'Hellhorned'      THEN 6
         WHEN 'Awoken'          THEN 7  WHEN 'Stygian Guard'   THEN 8
         WHEN 'Umbra'           THEN 9  WHEN 'Melting Remnant' THEN 10
         WHEN 'Wurmkin'         THEN 11 WHEN 'Railforged'      THEN 12
     END
     ```
   - When joining to card data, use `mt2.main.dim_cards` (has cost, clan, card_type, copies, upgrades)
   - Win rate: `COUNT(CASE WHEN result='Victory' THEN 1 END) * 100.0 / COUNT(*)` formatted with `PRINTF('%.1f%%', ...)`
   - Column order for all W/L outputs: grouping column(s) first, then `wins`, `losses`, `total_runs`, `win_pct`

5. **Update the SECTIONS index** at the top of the file each time a new section is added.

---

## After Building Each Section — Interpretation Loop

**Do NOT embed interpret prompts as comments in the SQL file.** Ask these questions conversationally after building, then wait for the user to run the query and share what they see.


After writing a section, always follow this loop before moving on:

**Step 1 — Invite analysis.**
Tell the user the section is ready to run, and ask: *"What are you seeing in the results?"*
Wait for them to share their observations. Do not guess at findings or pre-interpret the data.

**Step 2 — Respond to their interpretation.**
When the user shares their thoughts:
- Affirm or push back on the interpretation based on what the query structure can and can't tell you
- Flag any limitations (small N, missing data, confounders) relevant to what they observed
- Suggest 1–2 concrete next steps: a follow-up query, a Python visualization, or a journal entry
- **If any next step involves a Python notebook visualization**, immediately scaffold it into the relevant notebook in `eda/` as a markdown cell (description only, empty code cell stub). Identify the right notebook based on context — look at what notebooks exist in `eda/` and match topic to the appropriate one. Tell the user which notebook you added it to.

**Step 3 — Ask if they want to log it.**
If the interpretation contains a meaningful finding, decision, or open question, ask:
*"Want to log this to the journal?"*
If yes, follow the `/log-decision` skill to append it to `documentation/journal.md`.

**Step 4 — Propose the next section.**
Only after the interpretation loop is complete (or the user explicitly skips it) propose the next section.

The loop is: build → user runs and observes → user shares thoughts → respond + suggest → log if warranted → next section.
