# Monster Train 2 — Statistical Analysis
## Claude Code Project Guide

---

## Project Identity

This is a personal, single-player statistical analysis of Monster Train 2 run data. The goal is to build
a rigorous analysis pipeline progressing through three gated phases: automated descriptive reporting →
comparative case-control analysis → predictive modeling. This is a solo data science project, not a
production system. Interpretability and correctness matter more than engineering polish.

---

## Tech Stack

| Layer | Tool | Notes |
|---|---|---|
| Raw data | Excel + CSV | `data/Monster Train 2.xlsx` is source of truth; CSV is derived |
| Database | DuckDB | `data/mt2.duckdb` — file-based, no server needed |
| Transforms | dbt (dbt-duckdb adapter) | Profile: `mt2`, project dir: `transform/` |
| Pipeline | Python | `scripts/refresh.py` orchestrates Excel→CSV→dbt→general win/loss stats |
| EDA | SQL + Jupyter | `eda/` folder |
| Python env | `.venv` | Must be activated before running Python or dbt |

---

## Directory Structure

```
Monster Train/
├── CLAUDE.md                        ← This file
├── .claude/
│   ├── settings.local.json
│   └── commands/                    ← Custom slash commands (skills)
├── data/
│   ├── Monster Train 2.xlsx         ← Source of truth — never modify directly
│   ├── Monster Train 2.csv          ← Derived from xlsx via refresh.py
│   └── mt2.duckdb                   ← DuckDB database file
├── documentation/
│   ├── analytic_plans.md            ← Phase definitions and gating conditions
│   ├── brainstorming.md             ← Design notes and Q&A log
│   ├── limitations.md               ← Known analytical limitations
│   └── todo.md                      ← Active task list
├── eda/                             ← SQL and Jupyter EDA files
├── logs/                            ← dbt logs
├── scripts/
│   └── refresh.py                   ← Main pipeline script to update database and generate general W/L stats
└── transform/                       ← dbt project
    ├── models/
    │   ├── base/base_runs.sql
    │   ├── staging/stg_runs.sql
    │   ├── staging/stg_cards.sql    ← Auto-patched by refresh.py for new cards
    │   └── marts/
    └── seeds/                       ← card_attributes.csv, card_tags.csv
```

---

## Pipeline Flow

```
Monster Train 2.xlsx
        ↓  (refresh.py step 1: excel_to_csv)
Monster Train 2.csv
        ↓  (refresh.py step 2: check_new_cards → patches stg_cards.sql)
stg_cards.sql updated
        ↓  (refresh.py step 3: dbt build)
DuckDB views/models materialized
        ↓  (refresh.py step 4: win_loss_stats)
Console stats printed
```

Run the full pipeline: `python scripts/refresh.py` (from repo root, with `.venv` active).

---

## Data Encoding — Critical Details

**Card columns in the CSV:**
- Column names follow the pattern `{type}_{card_name}` where type is one of:
  `equipment_`, `unit_`, `spell_`, `room_`, `blight_`, `relic_` (relic has not been included yet in analysis)
- Values are encoded as `copies.upgrades` — e.g., `2.4` means 2 copies, 4 total upgrades
- `refresh.py` uses `floor(cast(value as decimal))` to extract copies; upgrades extraction is not yet implemented
- When a new card column appears in the CSV, `refresh.py` auto-patches a new UNION ALL block into `stg_cards.sql`

**Result values:** `'Victory'` or `'Loss'` — these are the only two valid values; rows with other values are filtered out in analysis


---

## Analysis Phases — Read Before Writing Any Code

### Phase 1 — Automated Reporting (CURRENT PHASE)
Descriptive win/loss statistics and summary metrics. No minimum run threshold needed (personal use only).
See `documentation/analytic_plans.md` for the full list of 11 analyses (a–k).

**Status:** Core pipeline is built. Remaining analyses are tracked in `documentation/todo.md`.

### Phase 2 — Comparative Analysis at Ring 8
Case-control comparison: Ring 8 losses vs. Ring 8 wins, focusing on card composition differences.

**Gating condition: Do not start until there are 50+ Ring 8 runs in the dataset.**
As of 3/20/2026 there are ~26 Ring 8 runs. Full data entry (~115 total runs) should unlock this.

### Phase 3 — Predictive Modeling
ML evaluation. Kaplan-Meier survival curves for ring completion.



---

## Standing Analytical Caveats — Apply to Every Analysis

**1. Covenant level is the primary confounder.**
A 40% win rate at Covenant 1 is fundamentally different from 40% at Covenant 4. All Phase 1 analyses are unadjusted — covenant stratification is deferred until 300+ runs. Every win rate output should note this caveat. Never interpret win rates without flagging covenant level.

**2. Card data is an end-of-run snapshot (endogeneity).**
Deck composition partly reflects how far the run got, not just how it was built. Runs that lasted longer had more opportunities to draft. Always use `cards_added_per_ring = total_cards / ring_reached` as the normalized metric, not raw card counts.

**3. Small N for subgroup analyses.**
At ~115 total runs, most per-clan-pair cells have 0–2 observations. Flag any group with fewer than 5 runs as "insufficient data." No significance testing until cells are adequately populated. Treat all Phase 1 outputs as descriptive only.

**4. Sparse clan combinations.**
There are 132+ ordered clan pair combinations. At current N, only the MT1/MT2 game-of-origin breakdown (4 aggregate cells) is feasible. Specific pair analysis requires a `HAVING COUNT(*) >= 5` filter.

**5. Champion Path variable is incomplete.**
Not recorded in the first ~15 runs; game only retains last 108 run logs. This analysis is deferred from Phase 1.

**6. All Analyses Stratified By Clan.**
Anytime an analysis is stratified by clan, i want things to be displayed in this order (and color for visuals).

        1 Banished (regular blue)
        2 Pyreborne (dark red)
        3 Luna Coven (violet)
        4 Underlegion (orange)
        5 Lazarus League (dark green)
        6 Hellhorned (red)
        7 Awoken (green)
        8 Stygian Guard (dark purple)
        9 Umbra (dark yellow)
        10 Melting Remnant (Light Blue)
        11 Wurmkin (Pink)
        12 Railforged (Gold)


---

## Domain Glossary

| Term | Meaning |
|---|---|
| **Clan** | A faction (e.g., Underlegion, Pyreborne). Each run has a primary and secondary clan. |
| **MT1 / MT2 clans** | Whether a clan originated in Monster Train 1 or Monster Train 2 |
| **Champion** | The hero unit for the primary clan. Two per clan: a starter champion and a Level 5 secondary. |
| **Pyreheart** | The passive modifier chosen at run start. Some unlock later and may skew toward higher covenants. |
| **Covenant rank** | Difficulty level. Higher = harder. Strong confounder for all analyses. |
| **Ring** | One of 8 floors/stages in a run. Ring 6 and 7 are typical chokepoints. |
| **cards_added_per_ring** | `total_cards / ring_reached` — the normalized card composition metric |
| **Upgrade encoding** | `X.Y` in CSV = X copies of the card, Y total upgrades across all copies |
| **`game_origin`** | MT1 vs MT2 column to be added to clan lookup — needed for clan combination analysis |
| **Clan unlock approximation** | First observed run with that clan minus 3 = estimated unlock run number |

---

## Covenant Rank Mechanics

Each covenant level is cumulative — all prior modifiers remain active. Caps at Covenant 10.

| Covenant | Change |
|---|---|
| **0** | Base difficulty. No modifiers. |
| **1** | Enemies have increased stats. 5 cards added to starting deck: 2 commons from primary clan, 2 commons from allied clan, 1 uncommon Banner Unit. |
| **2** | Battles have additional enemies (more units per wave). |
| **3** | Merchant reroll costs +50%. Purge (trash) costs scale 50% faster. **Upgrade costs are NOT affected.** |
| **4** | Non-flying bosses gain increased health/attack and an additional boss-specific mechanic. |
| **5** | 2 Vengeful Shards (Blight cards) added to starting deck permanently. |
| **6** | Calcified Ember mechanic: one of three offered draft cards is secretly marked — picking it adds a Calcified Ember (Blight) to your deck. |
| **7** | Preparation wave before Ring 7 and Ring 8 boss fights is removed. |
| **8** | Second round of enemy stat increases. |
| **9** | Pyre starts at 70% HP (takes 30% damage at run start). |
| **10** | Elite Chosen Enemies appear during Flying Boss battles. Hardest covenant — described as harder than MT1's Covenant 25. |

> **Note:** C4 boss-specific additional mechanics are not publicly documented — details are likely boss-type-specific and best learned in-game.

---

## EDA Interpretation Loop — Follow Every Time

After writing any SQL or Python section, always follow this loop before moving on. Do not skip it, do not drift from it in long sessions.

**Step 1 — Invite analysis.**
Tell the user the section is ready, then ask: *"What are you seeing?"* Wait for them to share observations. Do not pre-interpret or guess at findings.

**Step 2 — Respond to their interpretation.**
When the user shares results:
- Engage with what they observed — affirm, push back, or ask a clarifying question grounded in the data
- Flag limitations only when they materially change interpretation — do not repeat confounding caveats every entry
- Suggest 1–2 concrete next steps (follow-up query, Python visual, or journal entry)
- If a next step involves a Python visualization, scaffold it as a stub in the relevant notebook immediately

**Step 3 — Ask if they want to log it.**
If the finding is meaningful, ask: *"Want to log this to the journal?"* Then follow the log-decision skill.

**Step 4 — Propose the next section.**
Only after the loop is complete (or the user explicitly skips it).

The loop is: **build → user observes → discuss → log if warranted → next section.**

---

## What NOT to Do

- **Do not modify `data/Monster Train 2.xlsx` or `data/Monster Train 2.csv` directly.** The xlsx is the source of truth; the CSV is always derived from it via `refresh.py`.
- **Do not run `dbt build` or `dbt run` without activating `.venv` first.**
- **Do not start Phase 2 or Phase 3 code** until the gating conditions above are met.
- **Do not report raw card counts** without the `cards_added_per_ring` normalization.
- **Do not apply significance tests** to any Phase 1 subgroup that has fewer than 5 runs.
- **Do not interpret score as a run quality metric.** Score reflects leaderboard mechanics (gold remaining, run speed), not how well the run went. Use win/loss for quality.
- **Do not manually edit `stg_cards.sql` to add new cards** — `refresh.py` handles this automatically.
- **Ask 1 Question at a time** - if you have several questions, say so but ask them 1 at a time.
- **Build one section at a time** - when writing EDA files (SQL or Python), propose one section, wait for explicit approval ("yes", "build it", "go ahead"), then write it. A broad topic does not mean build everything at once. Never interpret a topic description as permission to build.
---

## Environment Notes (Windows)

- Shell: bash via Git Bash or WSL. Use forward slashes in paths.
- Python venv: `.venv/Scripts/activate` (bash) or `.venv\Scripts\Activate.ps1` (PowerShell)
- dbt must be run from the `transform/` directory: `cd transform && dbt build`
- DuckDB file: `data/mt2.duckdb` — close any open DuckDB connections before running `dbt build` or the pipeline will fail with a lock error
- dbt profile (`mt2`) lives in `C:\Users\chand\.dbt\profiles.yml`
