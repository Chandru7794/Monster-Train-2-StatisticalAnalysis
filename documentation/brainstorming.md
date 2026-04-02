# Notes from 3/16/2026

# Initially i want this to be a post hoc statistical analysis looking at the following things

---

## Win Loss Percentage By Clan (Stratified by Total, Primary Clan, Secondary Clan)
> **Notes:** Already implemented in SQL. Consider adding a minimum run threshold (e.g. 5+ runs) before reporting percentages — small samples will produce misleading rates.
> **Question:** Do you want to eventually control for covenant level here? A 40% win rate with Clan A at Covenant 4 is very different from 40% at Covenant 1.
> **Answer** Yes but not yet.  Put "controlling for covenant in all analyses" on a to-do list for me (make a new .md file)
---

## Win Loss Percentage by Clan Combination (Total, and which clan specifically is the primary and which is the secondary)
> **Note:** You're right that full pairwise coverage is not feasible at ~120 runs across 132+ ordered combinations. At this sample size, most cells will have 0-2 observations which is too sparse for any reliable inference.
> **Recommendation:** Focus on your most-played 8-10 combinations only, with a count filter. Flag combinations with < 5 runs as "insufficient data". Revisit when you hit 300+ runs.
> **Statistical caveat:** Treat these as descriptive only — no significance testing until cells are adequately populated.
> **Answer** I actually think an interesting thing i could do is break it down by game.  So Monster Train 1 Primary with Monster Train 2 Secondary.  Or the primary is the individual clan and the secondary is which game it came from?

---

## Win Loss Percentage By Champion
> **Question:** How many unique champions are there? If it's large relative to your run count, same sparsity problem as clan combinations applies. Consider grouping by clan + champion rather than champion alone.
> **Answer** There are two per clan.  I think this would just be a subanalysis of looking at primary clan (so if underlegion has 20 runs, i'd want to see how i did with Bolete and with Madame Lionsmane)

---

## Win Loss By Pyreheart
> **Note:** Straightforward — already started. Watch for confounding: certain pyrehearts may be unlocked later and therefore only appear at higher covenant levels, inflating or deflating their apparent win rate.
> **Answer** Good point

---

## Win Loss By Covenant Level
> **Notes:** Covenant level is likely a strong confounder for almost every other analysis. Consider adding it as a stratification variable rather than just a standalone analysis.
> **Recommendation:** When you build the predictive model later, covenant level should probably be one of your first features.
> **Question:** Do you play each covenant level roughly evenly, or are you concentrating on certain levels? Uneven distribution will affect how much signal you can extract per level.
> **Answer** I play at a certain covenant level until i feel like I can reliably beat it with every clan.  Though currently, im on Covenant 4 and i can beat it consistently with Underlegion but not with any other clan so i may move onto Covenant 5 just with Underlegion.

---

## Win Loss Conditional on Getting Past a Certain Ring By Clan
> **Note:** This is survival analysis framing — you're asking "given I survived to ring N, what's my probability of completing the run?" This is well-suited to a Kaplan-Meier style visualization when you get to the modelling phase.
> **Caution:** This will be heavily clan-dependent and sample-size constrained. "How likely am I to win if I got past ring 6?" is a great question but you'll need enough runs that reach ring 6 per clan to get stable estimates.
> **Clarification needed:** Is ring 6 consistently your chokepoint across all clans, or is it clan-specific? The SQL analysis suggests ring 6 is rough for you generally — worth confirming.
> **Answer** In general i find Ring 6 and Ring 7 to be two of the tougher ones.  But I've heard that at higher covenants, Ring 1 and 3 can be brutal as well.

---

## W/L Based on Card Composition (% Primary Clan, % Secondary Clan, % Common)
> **Note:** This is a good idea but the card count is an endogenous variable — you draft more cards the further you get in a run, so a run that ended at ring 3 will naturally have fewer cards than one that reached ring 7. Be careful about interpreting raw card counts.
> **Recommendation:** Normalize by ring reached (as you noted) or only compare runs that reached the same ring. Cards-per-ring is a cleaner metric than raw card count.
> **Question:** Are you tracking the cards at end-of-run, or at a consistent point mid-run? End-of-run snapshots conflate "built a big deck because I won" with "big deck caused me to win."
> **Answer** At end of run (thats the only data i have).  The plan is to divide the number of cards by ring # i ended at.  This is imperfect but what i think would be useful is "how many cards did i add/subtract per ring"
---

## Tag/Mechanic Composite Profile Per Run (pyregel, rage, quick, etc.)
> **Note:** This is the most ambitious analysis on this list and has real potential for the predictive model phase. Essentially you're building run-level features from card/relic tags.
> **Clarification needed:** How are you planning to link cards to tags — manually via a lookup table? That's a significant data entry effort. Worth building the tag reference table carefully and completely before doing the analysis.
> **Statistical note:** You'll end up with a high-dimensional feature space (many tags). For retrospective analysis, focus on a handful of hypothesized important tags. For the model, regularization (Lasso/Ridge) will help with this.
> **Answer** Yes this will be manually.  I think the way i'd want to statistically analyze these is almost 1 at a time.  Like how well does a Pyregel dominant strategy compare with a non-pyregel strategy for the Pyreborn.
> **Items to flag on each card**
    -what clan its from
    -what its base cost is
    -if its a unit, what its attach, defense, and its space required is
    -what are its tags (apply damage, pyregel, damage shield, etc)
    -whether its a starter card, a common card, uncommon card, or rare card


---

## W/L Over Time (Rolling Average)
> **Note:** A 10 or 20-run rolling win rate is probably more readable than a cumulative average, which converges and becomes less sensitive over time.
> **Interesting extension:** Rolling win rate *stratified by clan* — did you improve with specific clans at specific points in time? This could reveal when a playstyle "clicked."
> **Question:** Do you want to track calendar time or run number? Run number is probably more meaningful since you may go weeks between sessions.
> **Answer** Both.

---

## % of Time Playing a Clan After First Unlock
> **Note:** This is a selection frequency analysis, not a win rate analysis — both are valid but answer different questions. Knowing you *avoid* Pyreborne even when available is itself a meaningful datapoint.
> **Implementation note:** You'll need a lookup table mapping which run number each clan was unlocked on for your account, so you can filter to only runs where that clan was available. This is a one-time manual entry but important for correctness.
> **Clarification needed:** Do you know the exact run numbers when each clan unlocked for you, or will you need to approximate from your run log?
> **Answer** No i don't know the exact point and its probably a bit problematic but not too big of an issue.  Generally speaking, within 5 runs of unlocking a certain clan, i played as them.  So using their first run - 3 is generally a good rule of thumb.

---

## Average Score and Time-to-Beat on Wins, Stratified by Clan
> **Note:** Score on wins is interesting but may be heavily influenced by covenant level. A covenant 1 win will likely score lower than a covenant 4 win regardless of clan efficiency.
> **Recommendation:** Either control for covenant level or use score-relative-to-expected as your metric.
> **Question:** Is "time to beat" wall-clock time or in-game turns/rings? If it's wall-clock, it will be noisy due to AFK time, breaks, etc.
> **Answer** its wall-clock but i make sure to close the run when im taking a break to preserve that data.  Longest i think ive waited over the course of 130 runs is like 2 minutes.

---

## Effect of Card Count on Run Outcome
> **Note:** Same endogeneity caveat as card composition above — cards-per-ring is the right normalization.
> **Clarification needed:** What is your starting card count at each covenant level? If it's consistent, you can compute "cards added per ring" as a cleaner feature.
> **Interesting angle:** Is there an optimal deck size? Some players win with lean decks, others with large engines. Your data might reveal your personal optimum.
> **Answer** Precisely what i want to see and i think it will change with covenant level.

---

## Effect of Upgrades on Run Outcome
> **Note:** The 2.4 encoding (2 copies, 4 total upgrades) is clever but will need to be decoded before analysis. You'll want total upgrades as one variable and copy count as another — they likely have independent effects.
> **Question:** Are upgrades normalized by deck size or ring reached? A run with 10 upgrades in a 15-card deck is very different from 10 upgrades in a 40-card deck.
> **Answer** Upgrades are not normalized...its literally number of upgrades.  so a good measure would likely take into account deck size as well and the ring number.

---

## Relic Acquisition Order
> **Note:** Order of acquisition is interesting for sequencing analysis ("did getting relic X early predict winning?") but it conflates two things: the relic's inherent strength and how early in the run you got it.
> **Clarification needed:** Are you tracking *which* relic was picked at each slot, or just that a relic was picked? The identity of the relic matters much more than its position for most analyses.
> **Future model note:** For the predictive model, "had relic X by ring 3" is a more useful feature than "relic 2 was X."
> **Answer** Not sure yet, i generally find this to be the least interesting idea i've had.




# Update on 3/20/2026

> After beginning the work i think there are three phases of analyses.

>  **#1 Automated Reporting on WL and Statistics and Visuals**:  What I want is to have a script that automatically reads my "Monster Train 2" csv and then updates "stg_cards" with any cards that are not already in "stg_cards".   It also should then generate a statistical report primarily looking at win % but also summary statistics.  It should be done based on the following, knowing full well that a rigorous analysis should be adjusted for these things.  My thought is the final analysis could be a series of Odds Ratios for how likely it is to win but i have to think that through.

>**a** W/L By Clan for each Clan Broken Down by whether it was the Primary, Secondary, or Either, and by Clan Combination.  We don't need to limit to a minimum # of runs before reporting since this is just for me, i just want to see summary statistics.  Additionally breaking it down by MT1 Clans and MT2 Clans will be interesting as well.
>**b** W/L By Champion.  I also have a "Path" or "Champion Path" variable that I eventually would want to stratify this by (not necessarily which path but sometimes, you take a path up to Level III while other times you will have a multi-path with one as I and the other as II.  I think that could be an interesting look.)  Additionally, each clan has a primary champion who is unlocked with the clan and a secondary champion who is unlocked at Level 5 for the clan, i think that could be useful as well.
>**c**:  W/L By Pyreheart
>**d**:  W/L By Covenant Level
>**e**:  W/L Conditional on Getting Past a Certain Ring
>**f**:  W/L Based on Card Composition (% Primary Clan, % Secondary Clan, # of units and # of spells, etc)


>  **#2 Comparative Statistic Analysis at breaking down a run by card composition**:
This would be a more advanced version of #1 and will subset to JUST those runs that got to atleast Ring 8.  I'd want to then compare those runs where i lost in Ring 8 vs those I won in Ring 8 and see if I can tease out differences in card distribution for the runs.


>  **#3 Predictive Modeling that looks at breaking down a run by card composition**:
This needs to be though through but im not so much interested in being able to predict whether or not i win a given run  if i choose a specific clan combination (i think that gets too simplistic).  I'd want to be able to predict if i have a certain weighting of card attributes (like 20% are high cost cards or 50% are spells), plus information about covenant and clans, etc, whether or not a win is likely.