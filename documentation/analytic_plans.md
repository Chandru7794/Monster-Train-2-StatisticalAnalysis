# Monster Train 2 — Analytic Plan

*Last updated: 3/20/2026*

---

## Overview

The goal of this project is to build a rigorous, personal analysis of Monster Train 2 run data — starting with descriptive reporting, moving into comparative analysis, and eventually building a predictive model. The project has three phases that must be completed in order.

> **Important caveat across all phases:** Covenant level is a strong confounder for nearly every analysis. All Phase 1 results are unadjusted. See [limitations.md](limitations.md) for full documentation.

---

## Phase 1 — Automated Reporting

**What it is:** A script that reads the Monster Train 2 CSV, appends any new cards to `stg_cards` (one row per card × run), and generates a statistical report of win/loss rates and summary statistics. No minimum run threshold — all data is shown since this is for personal use.

The eventual capstone of Phase 1 is a set of **Odds Ratios** from a logistic regression, giving a single interpretable summary of what predicts winning. The model specification will be defined before building it (see todo below).

### Analyses Included

**a. W/L by Clan**
Win rate for each clan, broken down three ways: as primary clan, as secondary clan, and combined. Also broken down by MT1 clans vs. MT2 clans.

**b. W/L by Clan Combination**
Two levels of detail:
- *By game of origin:* aggregate across the 4 combinations (MT1+MT1, MT1+MT2, MT2+MT1, MT2+MT2). Also test whether MT1-primary + MT2-secondary performs differently than the reverse.
- *By specific pair:* show only combinations with 5+ runs; label all others as "insufficient data." Revisit full pairwise breakdown at 300+ runs.

**c. W/L by Champion**
Within each primary clan, split W/L by the two available champions. Also split by starter champion (unlocked with clan) vs. secondary champion (unlocked at clan Level 5).
> *Champion Path (Level III vs. multi-path) is deferred — variable was not recorded in the first ~15 runs and the game only retains the last 108 run logs.*

**d. W/L by Pyreheart**
Straightforward win rate per pyreheart. Note that some pyrehearts are unlocked later in progression and may skew toward higher covenant levels — flag this in any write-up.

**e. W/L by Covenant Level**
Win rate at each covenant level. This is also the primary confounding variable in all other analyses.

**f. W/L Conditional on Reaching Each Ring**
"Given I survived to ring N, what was my win rate?" Reported for each ring. Ring 6 and 7 are expected to be chokepoints; at higher covenants, Rings 1 and 3 may also become difficult.

**g. W/L by Card Composition**
Card data is an end-of-run snapshot. To control for the fact that longer runs produce larger decks, the primary metric is `cards_added_per_ring = total_cards / ring_reached`. Reported separately for: primary clan cards, secondary clan cards, common cards, units, and spells.

**h. Upgrade Density**
Upgrades are stored as `X.Y` (copies.total_upgrades) and need to be decoded into two separate variables. The key metric is upgrade density relative to deck size and ring reached.

**i. Rolling W/L Over Time**
Rolling win rate using a 10–20 run window, tracked two ways: by run number (primary) and by calendar date. Also broken out by clan to show learning curves — a positive trend slope per clan indicates improvement; a flat line indicates plateau.

**j. Clan Selection Frequency**
For each clan, the % of eligible runs (i.e., after estimated unlock) where that clan was selected, split by primary vs. secondary role. The unlock point is approximated as first observed run with that clan minus 3.

**k. Time-to-Beat on Wins**
Average wall-clock run time on winning runs, stratified by clan. Score is excluded — it reflects leaderboard mechanics (gold remaining, run speed) rather than run quality.

---

## Phase 2 — Comparative Analysis at Ring 8

**What it is:** A focused comparison of card composition between runs that *lost* at Ring 8 vs. runs that *won* at Ring 8. This is a case-control design — by conditioning on both groups reaching Ring 8, drafting opportunities are equalized, which partially controls for the end-of-run snapshot problem.

**Gating condition:** Begin when there are 50+ Ring 8 runs in the dataset. As of 3/20/2026 there are 26 Ring 8 runs across 54 entered runs; full data entry (~115 total runs) should provide enough to start.

**Approach:** Compare distributions of card composition metrics (% by clan origin, % units vs. spells, upgrade density, cards-per-ring) between the two groups. This is descriptive/exploratory — the goal is to identify signals, not establish significance.

---

## Phase 3 — Predictive Modeling

**What it is:** A model that predicts the probability of winning a run given card attribute weightings, clan information, and covenant level. The goal is not to predict wins from clan choice alone — that is too coarse. The value is in understanding how deck *composition* interacts with context to drive outcomes.

**Gating condition:** Do not start until Phase 1 descriptive analysis is complete and 300+ runs are logged.

**Approach:**
1. Start with **penalized logistic regression (Lasso)** — interpretable coefficients, built-in feature selection, and robust at small N.
2. Evaluate tree-based ensemble methods (random forest, gradient boosting) only after the logistic regression baseline is established. These methods will overfit at N < 300 given the high feature dimensionality — document this evaluation explicitly.
3. A **Kaplan-Meier survival curve** for ring-by-ring run completion probability will complement the regression model.
4. Per-clan models are possible once per-clan sample sizes are adequate.

**Feature set:** To be formally defined before any modeling begins. Candidate features include: `covenant_rank`, `primary_clan`, `secondary_clan` (or MT1/MT2 origin flags), `pyreheart`, `cards_added_per_ring` by clan/common, `upgrade_density`, `% units vs % spells`, and tag composition variables (once the card lookup table is built).

---

---

## Phase 1 — To-Do

### Automation 
- [x] Write `refresh.py` script that converts excel to csv, adds new cards to `stg_cards.sql` and runs descriptives
- [ ] Automate above

### Data Preparation
- [ ] Finish entering remaining ~70 runs into the CSV
- [ ] Add `game_origin` column (MT1 vs MT2) to clan lookup table
- [ ] Create clan unlock lookup table — use first observed run with that clan minus 3 as the estimated unlock run

### Analyses to Build
- [ ] W/L by clan — primary, secondary, and combined; also aggregated by MT1 vs. MT2 clans
- [ ] W/L by clan combination — MT1/MT2 game-origin breakdown (4 cells); MT1-primary vs. MT2-secondary asymmetry test; specific pairs with 5+ run filter
- [ ] W/L by champion — within each primary clan; split by starter vs. Level 5 secondary champion
- [ ] W/L by pyreheart
- [ ] W/L by covenant level
- [ ] W/L conditional on reaching each ring (rings 1–8)
- [ ] Card composition — `cards_added_per_ring` normalized metric; broken out by primary clan cards, secondary clan cards, commons, units, spells
- [ ] Upgrade density — decode `X.Y` encoding into `copies` and `total_upgrades`; normalize by deck size and ring reached
- [ ] Rolling W/L — 10–20 run window, by run number and by calendar date
- [ ] Learning curve by clan — rolling W/L trend per clan over run number
- [ ] Clan selection frequency — % of eligible runs per clan, split by primary vs. secondary role
- [ ] Time-to-beat on wins — by clan

### Deferred from Phase 1
- **Champion Path analysis** — data incomplete (not recorded in first ~15 runs; game only retains last 108 run logs)
- **Odds Ratio model spec** — define feature table and logistic regression specification before building; not a priority until descriptive analyses are done
- **Score analysis** — excluded; reflects leaderboard mechanics, not run quality
