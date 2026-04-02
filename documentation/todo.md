# Monster Train 2 - Analysis To-Do List

---

## Data Entry
- [ ] Finish entering remaining ~70 runs into the CSV
- [ ] Create a clan unlock lookup table — use "first run with that clan - 3" as the estimated unlock run number for each clan

---

## SQL / Descriptive Analysis (Current Phase)

- [ ] Champion subanalysis — within each primary clan, split W/L by the two champions (e.g. Bolete vs Madame Lionsmane for Underlegion); additionally split by starter champion vs. Level 5 unlocked secondary champion
- [ ] Pyreheart W/L — note that some pyrehearts may be unlocked later and skew toward higher covenant levels; flag this in any write-up
- [ ] Clan combination W/L — two approaches:
  - **By game of origin:** categorize each clan as MT1 or MT2, then analyze W/L across the 4 combinations (MT1+MT1, MT1+MT2, MT2+MT1, MT2+MT2) — feasible now at current sample size; also test whether MT1 primary + MT2 secondary differs from MT2 primary + MT1 secondary
  - **By specific pair:** implement with a `HAVING COUNT(*) >= 5` filter; label anything below as "insufficient data"; revisit at 300+ runs
  - Requires adding a `game_origin` column (MT1 vs MT2) to the clan lookup
- [ ] Ring survival analysis — W/L conditional on reaching each ring; stratify by clan once sample size allows
- [ ] Card composition analysis — compute `cards_added_per_ring = total_cards / ring_reached` as the normalized metric; do this separately for primary clan cards, secondary clan cards, and commons
- [ ] Upgrade density analysis — compute upgrades relative to deck size and ring reached; decode the `X.Y` encoding into `copies` and `total_upgrades` as separate columns
- [ ] Rolling W/L over time — implement both by run number (primary) and by calendar date; use a 10 or 20-run window
- [ ] Learning curve by clan — for each clan, plot rolling W/L over run number and fit a simple trend line; a positive slope = improving, flat = plateau or inconsistency
- [ ] Clan selection frequency — % of eligible runs where each clan was chosen (using unlock approximation), stratified by whether they were primary or secondary
- [ ] Time-to-beat on wins — stratified by clan; hold off on covenant-controlling until later phase; note: score excluded as it reflects leaderboard mechanics (gold remaining, run speed) rather than run quality
- [ ] Champion Path analysis — **DEFERRED**: path variable not recorded in first ~15 runs and game only retains last 108 run logs; revisit when data coverage improves

---

## Future Phase: Covenant-Controlled Analyses
> Add covenant level as a stratification variable to all analyses below once sample size supports it.
> At ~300+ runs this becomes feasible for most metrics.

- [ ] Clan W/L stratified by covenant level
- [ ] Champion W/L stratified by covenant level
- [ ] Pyreheart W/L stratified by covenant level
- [ ] Card composition and deck size optima — expected to vary by covenant level
- [ ] Ring survival rates by covenant level (Ring 1 and 3 may become chokepoints at higher covenants)

---

## Data Preparation (When Ready)

- [ ] Build tag/mechanic lookup table manually (pyregel, rage, quick, etc.) mapping each card/relic to its relevant tags
  - Start with Pyreborne cards/pyregel as the first test case
  - Prioritize tags you have a hypothesis about before building the full table
- [ ] Decide on relic tracking approach — whether to analyze relic identity, acquisition order, or both; currently low priority

---

## dbt Project (Learning + Production Skills)
> Goal: learn production dbt patterns using this project as a sandbox. Use dbt-duckdb adapter.

- [x] Build a `stg_runs` staging model — clean and cast raw CSV columns (fix mixed types, standardize result values, etc.)
- [ ] Add to `stg_runs` a transformed `challenge` and `hero_path` column
- [ ] Build mart models on top of staging:
  - `mart_clan_wl` — clan win/loss aggregations
  - `mart_ring_survival` — ring-by-ring survival rates
  - `mart_champion_wl` — champion subanalysis
- [ ] Add dbt tests for data quality:
  - `result` must be 'Victory' or 'Loss'
  - `covenant_level` must be between 1-25
  - `primary_clan` and `secondary_clan` must be in the known clan list
  - `primary_clan` and `secondary_clan` must not be the same value
- [ ] Add dbt documentation (model descriptions, column descriptions)
- [ ] Use dbt's lineage graph to visualize raw → staging → mart flow

---

## Modelling Phase (Future)
> Do not start until descriptive analysis is complete and 300+ runs are logged.

- [ ] Define logistic regression model specification for Odds Ratio endpoint before building — write out explicit feature table: `covenant_rank`, `primary_clan`, `secondary_clan` (or MT1/MT2 origin flags), `pyreheart`, `cards_added_per_ring` (total and by clan/common), `upgrade_density`, `% units vs % spells`, tag composition variables
- [ ] Start with penalized logistic regression (Lasso) as the baseline model — interpretable coefficients, handles feature selection, degrades gracefully at small N
- [ ] Evaluate tree-based ensemble methods (random forest, gradient boosting) only after logistic regression baseline is established; note that these methods will overfit at N < 300 given the high feature dimensionality relative to sample size — document this evaluation explicitly
- [ ] Covenant level should be one of the first features in any predictive model
- [ ] Kaplan-Meier survival curve for ring-by-ring run completion probability
- [ ] Per-clan models once per-clan sample sizes are adequate
