# /ml-experiment — ML Experiment Scaffold

The user wants to run or plan an ML experiment. Their topic is:

> $ARGUMENTS

## Core Rule

Same as sql-eda: **one section at a time, one question at a time, build only after explicit approval.**

---

## Gating Check — Do This First

Before writing any code, check the gating conditions in CLAUDE.md (Phase 2 and Phase 3 each have run count requirements). Read `data/Monster Train 2.csv` and count current runs. If gating conditions aren't met, tell the user and offer to sketch the experiment or plan the feature table instead.

## Available Packages

Only `pandas`, `matplotlib`, `numpy` are installed. For ML, `scikit-learn` needs to be installed (`pip install scikit-learn`).

Intended modeling stack: Lasso logistic regression first, then tree-based ensembles only after the baseline is established.

## Standard Experiment Header

```python
"""
ML EXPERIMENT: <topic>
Date: YYYY-MM-DD
Status: <PROTOTYPE / EXPLORATORY>

Research Question:
    <what are you trying to predict or learn>

Target Variable:
    result (binary: Victory=1, Loss=0)

Features Being Tested:
    - <list specific features and why>

Exclusions:
    - score: leaderboard mechanic, not run quality
    - raw card counts: use cards_added_per_ring instead

N Available: <count from data>
N Required: <state threshold for this analysis>
"""
```

## Script Structure

Use these section comments:
- `# --- DATA LOADING & FILTERING ---`
- `# --- FEATURE ENGINEERING ---`
- `# --- DESCRIPTIVE CHECK ---`
- `# --- MODEL ---`
- `# --- EVALUATION ---`
- `# --- INTERPRETATION ---`

## Feature Engineering Rules

- `cards_added_per_ring = total_cards / ring_reached`
- Decode upgrade encoding: `copies = floor(X.Y)`, `upgrades = round((X.Y % 1) * 10)`
- Covenant rank as numeric

## Evaluation at Small N

- Use stratified k-fold or leave-one-out cross-validation
- Report AUC-ROC, not just accuracy
- Note overfitting risk explicitly

## After the Experiment

Append a summary to `documentation/journal.md` covering: what was tested, what the result was, and what the next experiment should be.
