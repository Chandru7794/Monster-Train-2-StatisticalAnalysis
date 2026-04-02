# Monster Train 2 — Analysis Limitations

---

## Single-Player Data Only
All data comes from a single player's runs. Results describe individual performance patterns and cannot be generalized to other players, playstyles, or skill levels.

---

## Covenant Level Confounding
Covenant level is a strong confounder for nearly every analysis. A 40% win rate with Clan A at Covenant 4 is a fundamentally different result than 40% at Covenant 1. All current Phase 1 analyses are **unadjusted** — covenant level stratification is deferred to a future phase (target: 300+ runs). Every win rate in Phase 1 should be interpreted with this caveat in mind.

---

## End-of-Run Card Snapshot Endogeneity
Card composition is recorded at the end of the run, not at a fixed mid-run checkpoint. This creates a directional bias: runs that progressed further had more opportunities to draft or trash cards, meaning deck composition partly reflects *how far the run got*, not just *how the run was built*. The `cards_added_per_ring` normalization mitigates this but does not fully resolve it. The Phase 2 Ring 8 case-control design (comparing Ring 8 losses vs. Ring 8 wins) is the cleanest approach available given current data structure, since both groups faced the same drafting opportunities up to that point.

---

## Small N for Subgroup Analyses
At ~115 total runs (as of 3/20/2026), most subgroup analyses (per-clan champion, specific clan pair combinations, individual pyrehearts) will have very small cell counts. These analyses are **descriptive only** — no significance testing should be applied until cells are adequately populated. Flag any group with fewer than 5 runs as "insufficient data" in reporting.

---

## Sparse Clan Combination Cells
There are 132+ ordered clan pair combinations possible. At current sample size, the vast majority of specific pairs will have 0–2 observations. The MT1/MT2 game-of-origin breakdown (4 aggregate cells) is feasible now; specific pair analysis requires a minimum count filter and should be revisited at 300+ runs.

---

## Champion Path Variable Sparsity
Champion Path data was not recorded in the first ~15 runs, and the game only retains the last 108 runs in its logs. This makes champion path analysis incomplete and potentially biased toward more recent runs. This variable is deferred from Phase 1 reporting until data coverage improves.

---

## What Is NOT a Limitation
- **Recording bias**: Run data is transcribed directly from in-game run logs at time of play, not from memory. There is no retrospective recall bias.
