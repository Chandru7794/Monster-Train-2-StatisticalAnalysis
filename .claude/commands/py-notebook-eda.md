# /py-notebook-eda — Python Notebook EDA

The user wants to build or extend a Jupyter notebook EDA. Their topic is:

> $ARGUMENTS

## Core Rule

Same as sql-eda: **one cell/section at a time, one question at a time, build only after explicit approval.**

---

## Context

- Format: Jupyter notebooks (`.ipynb`) in `eda/`
- Available packages: `pandas`, `matplotlib`, `numpy` only. Do NOT use seaborn, plotly, or sklearn unless the user explicitly installs them.
- Data source: read from `data/Monster Train 2.csv` directly. Do NOT connect to DuckDB from Python unless user explicitly requests it.
- Code style: developmental data science — clear, readable, direct. No classes, no abstraction layers, no error handling beyond what's needed to run.
- Every analysis cell must be preceded by a markdown cell describing what is being done and why.
- Clan ordering and colors must always be used for any clan-based visual.

## Clan Color Map

```python
CLAN_ORDER = [
    "Banished", "Pyreborne", "Luna Coven", "Underlegion",
    "Lazarus League", "Hellhorned", "Awoken", "Stygian Guard",
    "Umbra", "Melting Remnant", "Wurmkin", "Railforged",
]

CLAN_COLORS = {
    "Banished":        "#4472C4",
    "Pyreborne":       "#8B0000",
    "Luna Coven":      "#7030A0",
    "Underlegion":     "#E36C09",
    "Lazarus League":  "#375623",
    "Hellhorned":      "#FF0000",
    "Awoken":          "#00B050",
    "Stygian Guard":   "#3F006B",
    "Umbra":           "#7F6000",
    "Melting Remnant": "#92CDDC",
    "Wurmkin":         "#FF99CC",
    "Railforged":      "#B8860B",
}
```

## Standard Setup Cell (always the first code cell in any notebook)

```python
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
import numpy as np

ROOT = Path("..").resolve()
CSV_PATH = ROOT / "data" / "Monster Train 2.csv"

CLAN_ORDER = [
    "Banished", "Pyreborne", "Luna Coven", "Underlegion",
    "Lazarus League", "Hellhorned", "Awoken", "Stygian Guard",
    "Umbra", "Melting Remnant", "Wurmkin", "Railforged",
]

CLAN_COLORS = {
    "Banished": "#4472C4", "Pyreborne": "#8B0000", "Luna Coven": "#7030A0",
    "Underlegion": "#E36C09", "Lazarus League": "#375623", "Hellhorned": "#FF0000",
    "Awoken": "#00B050", "Stygian Guard": "#3F006B", "Umbra": "#7F6000",
    "Melting Remnant": "#92CDDC", "Wurmkin": "#FF99CC", "Railforged": "#B8860B",
}

df = pd.read_csv(CSV_PATH)
df = df[df["result"].isin(["Victory", "Loss"])].copy()
df["win"] = df["result"] == "Victory"
```

## Plot Conventions

- Horizontal bar charts for clan comparisons (long clan names read better horizontally)
- Use `CLAN_ORDER` to control axis order, `CLAN_COLORS` to set bar colors
- `fig.tight_layout()` and `plt.show()` at the end of every figure
- Rolling win rate: 10-run window default (`df["win"].rolling(10).mean()`)
- Print a summary of key numbers after each plot so output is readable without the visual

## Notebook Structure Convention

Each analysis section follows this pattern:
1. **Markdown cell** — what is being done, what question it answers, any known limitations
2. **Code cell** — the analysis or plot

When scaffolding a new notebook, create all markdown cells first as a skeleton. Only add code cells when the user approves a specific section.

---

## After Building Each Cell — Interpretation Loop

After writing a section, follow this loop before moving on:

**Step 1 — Invite analysis.**
Tell the user the cell is ready to run and ask: *"What are you seeing?"*
Wait for them to share observations. Do not pre-interpret.

**Step 2 — Respond to their interpretation.**
- Affirm or push back based on what the plot can and can't show
- Flag limitations relevant to what they observed
- Suggest 1–2 concrete next steps

**Step 3 — Ask if they want to log it.**
If the finding is meaningful: *"Want to log this to the journal?"*
If yes, follow `/log-decision` to append to `documentation/journal.md`.

**Step 4 — Propose the next cell.**
Only after the loop is complete (or user explicitly skips it).
