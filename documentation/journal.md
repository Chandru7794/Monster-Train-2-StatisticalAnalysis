# Monster Train 2 — Analysis Journal

Running log of findings, interpretations, decisions, and open questions from EDA sessions.

---

## 2026-04-03

### W/L by Primary Clan — Initial Observations
**Type:** Finding, Interpretation, Open Question
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 1a
**N:** 76 runs (incomplete dataset; ~130 total runs exist, remainder not yet entered)

Banished is 8W-8L as primary. This is likely an underestimate of true ability — the first 10–15 runs were learning runs while getting acquainted with MT2 vs MT1. Win rate expected to improve once full dataset is entered and early runs can be contextualized.

Pyreborne is 2W-10L as primary. Poor performance attributed primarily to Lord Fenix as hero. Lord Fenix is a 3-pip size unit with low base health, creating a fundamental deck-building constraint — many cards and strategies don't support him well. Candidate for card composition analysis once clan card data is fully entered.

Underlegion is 6W-4L. Consistent with intuition — this is the clan where the game started clicking. Likely the easiest clan for this player.

Lazarus League is 3W-5L, which is surprising given they feel like the second-easiest clan after Underlegion. Possible explanation: if Lazarus League runs cluster at higher covenant levels or later in the run history, difficulty increase could suppress win rate. To investigate.

The remaining clans (Stygian Guard, Umbra, Melting Remnant, Wurmkin, Railforged) are all near .500 with very small N. No conclusions drawn.

---

### W/L by Secondary Clan — Initial Observations
**Type:** Finding, Interpretation, Open Question
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 1b
**N:** 76 runs (incomplete dataset)

Banished is notably poor as secondary. Likely partially driven by Pyreborne being primary in many of those runs, but enough non-Pyreborne pairings exist that it's not solely explained by that. Hypothesis: Banished cards need to be the primary focus of the deck to function — they don't support other clans' engines well as secondary.

Pyreborne is strong as secondary — nearly the mirror of its poor primary performance. Suggests Pyreborne cards work better as a support package bolted onto another clan's engine than as the primary focus.

The Banished/Pyreborne mirror (strong primary/weak secondary vs. weak primary/strong secondary) is the most notable pattern in the data so far. Likely a fundamental mechanic difference. Card composition analysis is the right place to test this.

Luna Coven struggles similarly in both primary and secondary roles.

Underlegion is surprisingly poor as secondary. Likely because player comfort with Underlegion is built around running them as primary — their core mechanics don't translate as well when supplementing someone else's plan.

Lazarus League as secondary performs more in line with intuition — more consistent than their primary win rate suggested.

Hellhorned and Awoken combined are 7W-4L as secondary, notably better than as primary. Similar pattern to Pyreborne — may function better as a support package.

---

### W/L by Clan Either Role — Initial Observations
**Type:** Finding, Interpretation, Open Question
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 1c
**N:** 76 runs (incomplete dataset)

Banished and Pyreborne have identical combined records despite very different primary/secondary splits. Likely coincidence at this sample size — the splits average out, not a meaningful finding on its own.

Luna Coven has been played less than Lazarus League, Hellhorned, and Underlegion in total appearances. Consistent with intuition — one of least favorite clans to play.

Underlegion has a good record relative to other high-appearance clans.

From Underlegion onward in the list, most clans are at approximately .500. This matches player intuition of reaching a consistent 1-in-2 win rate as the game clicked, even as covenant level increased. Note: these numbers are not mutually exclusive (runs count toward both primary and secondary), so this is a qualitative observation only.

Surprised by the number of Wurmkin appearances already — player dislikes them but has played them as much as Umbra and Melting Remnant.

**Statistical testing decision:** When full dataset is entered (130+ runs), run Fisher's Exact test with Bonferroni correction (12 comparisons) comparing each clan's win rate against all other clans combined. Run separately for primary role and secondary role. Do not use the combined either-role view for testing — runs appear twice, violating independence. Flag all results as exploratory given sample size constraints.

---

### Clan Combinations — Initial Observations
**Type:** Finding, Interpretation, Open Question
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 2
**N:** 76 runs (incomplete dataset)

Banished + Pyreborne at 15.8% of all runs is expected — they were the only two clans available early. Banished + Luna Coven at 9.2% vs. Pyreborne + Luna Coven at only 2.6% is notable given Luna was available to both equally — suggests a clear preference for pairing Banished with Luna over Pyreborne with Luna.

Underlegion + Pyreborne at 7.9% vs. Banished + Underlegion at 3.9%. Two plausible explanations: (1) Pyreborne felt like a fun secondary and Underlegion felt like a safe primary, or (2) attempts to win as Pyreborne primary by leaning on a familiar secondary before realizing Underlegion doesn't translate well to the secondary role. The poor Underlegion secondary performance may be partially confounded by how often it was paired with Pyreborne primary.

Wurmkin appearing with Pyreborne and Melting Remnant appearing with Underlegion reinforces the observation that Banished without their champion doesn't feel natural as a secondary pairing — the player gravitates away from Banished secondary when experimenting with newer clans.

**Open question:** Is Underlegion's poor secondary performance driven specifically by Pyreborne pairings, or is it consistent across all primaries?

---

### W/L by Time/Run Segments — Initial Observations
**Type:** Finding, Interpretation, Open Question
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 3
**N:** 76 runs (incomplete dataset)

Clear improvement in win rate over time. Feb 2026 is noticeably better than Dec 2025 and Jan 2026, even as covenant level has increased. Player attributes this to genuine skill improvement rather than difficulty decrease.

Game didn't fully click until mid-January — visible in both win rate and play frequency picking up around that time. Increased play volume in mid-February coincides with external circumstances (not purely engagement-driven).

Lazarus League was the top-played clan in Feb 2026, which surprises the player given they don't feel particularly strong affinity for the clan. Consistent with earlier observation that feel vs. actual play frequency diverges for Lazarus League.

Rolling win rate over time identified as the most useful way to visualize the learning curve — better than fixed 10-run segment comparisons. Flagged as Python line chart.

Statistical comparison of win rates across time periods deferred — not a current priority.

---

---

## 2026-04-04

### W/L by Covenant Level — Initial Observations
**Type:** Finding, Interpretation, Decision
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 4a
**N:** 79 runs

**Covenant 0 (4 runs):** Almost never played here — started at 0 briefly then immediately moved to 1. Negligible sample, disregard.

**Covenant 1 (45 runs):** The bulk of the dataset by a wide margin. Player stayed here far too long, not out of difficulty but inertia/comfort. Win rate here is lower than skill level because i was improving during this portion — all other covenants should be understood relative to this period.

**Covenant 2 (18 runs):** Significant drop in run count, but win rate notably improved despite increased difficulty. Player attributes this to genuine skill acceleration during this period. The smaller N relative to Covenant 1 reflects a faster willingness to push difficulty once skill clicked.

**Covenant 3 (11 runs):** Relatively quick transition through this level. Covenant 3 didn't feel meaningfully harder than Covenant 2 — the difficulty delta was small enough that it didn't require much time to adjust. Win rate remained solid.

**Covenant 4 (1 run):** Single loss. This was a felt difficulty spike — player went back to Covenant 3 after a few more losses after this.. This data point is meaningless on its own. Covenant 4 analysis deferred until more runs are accumulated.

**Decision:** Covenant 4 should be excluded from any aggregate covenant-trend analysis until there are at least 5 runs. Flag all covenant-level outputs with the Covenant 1 sample-size caveat — 45/79 runs at a single covenant level means overall win rates are heavily weighted by that period.

**Covenant mechanics clarification (researched 2026-04-04):** C3 increases reroll and purge costs by 50% — upgrade costs are unaffected. The C4 difficulty spike is explained by bosses gaining increased HP/attack plus an unknown boss-specific mechanic, not a resource cost change. C1 is the analytical baseline (C0 is disregarded). C1 itself has a hidden starting-deck burden: 5 cards added each run (2 primary commons, 2 allied commons, 1 uncommon Banner Unit), which is relevant context for any card composition analysis at this covenant level.


### Runs to 5th Win per Covenant
**Type:** Finding, Interpretation
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 4b
**N:** 79 runs

| Covenant | Runs to 5th Win | Implied Win Rate to That Point |
|---|---|---|
| C1 | 17 | ~29% |
| C2 | 9 | ~56% |
| C3 | 11 | ~45% |
| C4 | N/A (0 wins) | — |

C1 required 17 runs to accumulate 5 wins — a slow early period consistent with the learning curve. C2 reached 5 wins in 9 runs despite being a harder covenant, the clearest data signal of skill improvement. C3 reached 5 wins in all 11 runs played — not because it was a struggle, but because player moved to C4 out of boredom once they'd satisfied themselves at C3.

**Confounders:** Win rate improvement across covenants is not purely skill — clan level (mastery progression that unlocks additional cards and relics) increases over time and is correlated with run number and covenant progression. Higher clan levels mechanically expand draft options, which independently improves win rate. These three factors (skill, clan level, covenant difficulty) cannot be cleanly separated at current N.

**Streak run ID limitation:** Streaks are identified as consecutive runs *within* a covenant level, ordered by run_id. The run_ids within a streak are not necessarily contiguous overall — runs at other covenant levels may fall in between. Section 4d correctly identifies exact run_ids rather than using a range, but streak runs should not be assumed to be back-to-back calendar sessions.

---

### W/L by Pyreheart — Initial Observations
**Type:** Finding, Interpretation
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 5a
**N:** 79 runs

Bogwurm's Growth (12W-14L) was the primary pyreheart during the period where the game started clicking. Wyngh's Spirit (8W-14L) was the earlier default, used before skill solidified. Fhyra's Greed (11 runs) and Lifemother's Pyre (8 runs) are the current preferences — both have promising win rates but small N.  These will increase as I input more and more runs. All four pyrehearts are entangled with the learning curve; earlier pyrehearts carry more low-skill runs, later ones more high-skill runs.

Player's current settled rotation (outside this dataset): Fhyra's Greed and Lifemother's Pyre, with occasional Bogwurm's Growth. This is useful context for interpreting pyreheart distributions in future data.

---

### Ring Survival — Initial Observations
**Type:** Finding, Interpretation, Open Question
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 6a, 6b
**N:** 79 runs

Reached Ring 6 in 74/79 runs — nearly universal. Ring 6 is the primary chokepoint: 22/74 runs (30%) die there. Ring 7 survival rate is lower than Ring 8, which is the final boss (Seraph). Rings 7 and 8 use distinct encounters despite similar naming conventions.

**Ring 6:** Stryx and Hallow are the killers (62% survival combined) vs. Cael which is much more manageable (78% survival). The Ring 6 chokepoint is largely a Stryx/Hallow problem.

**Ring 3:** All 3 losses are to Fleshweaver, none to Arkion despite roughly equal encounter frequency. Fleshweaver appears to be genuinely harder, not just more common.

**Ring 8 (Seraph variants):** Only 1 loss to Dominion, 2 to Savagery. Entropy is the toughest Seraph variant currently — saps units. Player expects this pattern to shift at higher covenants where Dominion (corruption) and Savagery (rage/melee weakness) may become harder.

**Data note:** Corrupted Mass appearing in Ring 3 (1 run) is a data entry error — will be corrected.

**Open question:** Clan × encounter survival for Rings 6–8 — do certain clans consistently struggle against specific bosses?

### Primary Clan × Encounter Survival (Rings 6–8)
**Type:** Finding, Interpretation, Open Question
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 6c
**N:** 79 runs (most clan × encounter cells have 1–3 runs — treat as directional only)

**Cael (Ring 6):** Clans played early and often generally perform well. Pyreborne is an exception at 4/6. Later-unlocked clans (e.g. Melting Remnant at 1/2) show lower rates — likely reflects Cael getting harder at higher covenants rather than a clan-specific weakness. Cannot separate covenant difficulty from clan comfort at this N.

**Stryx (Ring 6):** Most clans are below 70% survival. Underlegion is an exception — tentative signal, directionally credible given Underlegion's unit-stacking kit which suits pushing through a specific encounter type. Awoken and Stygian Guard also above 70% but too small to call.

**General:** The clan × encounter table is hard to scan. A simpler clan × ring view (without encounter breakdown) is needed as a first pass before diving into encounter-level detail.

### Primary Clan × Ring Survival (Rings 6–8)
**Type:** Finding, Interpretation
**Source:** [eda/mt2_wl_exploration.sql](../eda/mt2_wl_exploration.sql) — Section 6c
**N:** 79 runs (small per-clan cells — treat as directional)

**Ring 6:** Pyreborne, Hellhorned, and Lazarus League all struggle here. Most other clans are reasonably solid.

**Ring 7:** Luna Coven nearly matches Underlegion — when their engine gets going they're hard to stop. Hellhorned, Awoken, and Umbra are 100% at Ring 7 but on very small samples.

**Ring 8 (Seraph):** Banished 8/8 — standout result. Pyreborne 2/2 but only 2 runs, meaning their struggles are exposed earlier in the run before reaching here. Luna Coven drops to 4/7 and Underlegion 6/8 — both fall off from Ring 7. Hellhorned and Umbra continue performing well. Awoken struggles against Seraph (likely a DPS-check problem — Awoken is a healing/card draw clan that survives well through mid-rings but lacks the direct damage to finish a boss fight). This is a "good at surviving, bad at finishing" pattern.

**Hellhorned pattern:** Struggles at Ring 6 but excels at Rings 7–8. Likely high-variance — either the engine clicks and they dominate, or they die early. Runs that beat Ring 6 are the ones that assembled their kit; other clans can limp through Ring 6 without a complete engine.

---

## Next Steps

- Check whether Lazarus League runs cluster at higher covenant levels or later run numbers
- When champion analysis is built, split Pyreborne by Lord Fenix vs. other hero immediately
- Revisit all win rates (clan, pyreheart, champion) once full dataset is entered (~130 runs)
- SQL: Ring survival analysis — W/L conditional on reaching each ring; watch for chokepoint shifts by covenant level
- SQL: Champion W/L — split by primary/secondary champion within each clan; confirm data column availability before building
- SQL: MT1/MT2 clan origin breakdown — requires adding `game_origin` column to clan lookup first
- SQL: Clan level W/L — confirm clan level columns exist in `stg_runs` before building
- SQL: Pyreheart W/L by covenant (5b) — run and interpret
- Python visual: Rolling win rate line chart — most useful way to visualize learning curve; 10-20 run window
- Python visual: Run count heatmaps (Section 7 stubs in wl_exploration.ipynb) — Covenant×Pyreheart, Primary×Secondary clan, Primary clan×Pyreheart, Covenant×Primary clan, MT1/MT2 origin 2×2 (needs game_origin first)
- Python visual: Banished secondary win rate when Pyreborne is primary vs. any other primary; same for Underlegion secondary
- Python visual: Clan play frequency over time — requires manually entering estimated clan unlock dates
- Card analysis (when card data is complete): investigate Banished primary-focus dependency and Pyreborne support-role hypothesis
- Statistical testing (when full dataset entered): Fisher's Exact test with Bonferroni correction per clan vs. all others; primary and secondary role separately
