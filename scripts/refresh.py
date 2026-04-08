#!/usr/bin/env python3
"""
refresh.py — Daily Monster Train data pipeline

Run manually:
    python scripts/refresh.py
"""

import re
import subprocess
from pathlib import Path

import pandas as pd

# ── Paths ─────────────────────────────────────────────────────────────────────
ROOT       = Path(__file__).resolve().parent.parent
EXCEL_PATH = ROOT / "data" / "Monster Train 2.xlsx"
CSV_PATH   = ROOT / "data" / "Monster Train 2.csv"
DBT_DIR    = ROOT / "transform"
STG_CARDS  = DBT_DIR / "models" / "staging" / "stg_cards.sql"


# ── 1. Excel → CSV ────────────────────────────────────────────────────────────
def excel_to_csv() -> bool:
    """Returns True if new runs were found and CSV was updated, False otherwise."""
    print("\n[1/4] Checking for new runs...")
    df_excel = pd.read_excel(EXCEL_PATH)
    excel_rows = df_excel["date"].notna().sum()

    if CSV_PATH.exists():
        df_csv = pd.read_csv(CSV_PATH)
        csv_rows = df_csv["date"].notna().sum()
    else:
        csv_rows = 0

    print(f"      Excel: {excel_rows} runs  |  CSV: {csv_rows} runs")

    if excel_rows <= csv_rows:
        print("      No new runs detected. Nothing to do.")
        return False

    print(f"      {excel_rows - csv_rows} new run(s) found — converting Excel → CSV...")
    df_excel.to_csv(CSV_PATH, index=False)
    return True


# ── 2. Detect new cards and patch stg_cards.sql ───────────────────────────────
CARD_PREFIXES = ("equipment_", "unit_", "spell_", "room_", "blight_")


def col_to_card_type(col: str) -> str:
    if col.startswith("equipment_"): return "Equipment"
    if col.startswith("unit_"):      return "Unit"
    if col.startswith("spell_"):     return "Spell"
    if col.startswith("room_"):      return "Room"
    if col.startswith("blight_"):    return "Blight"
    return "Unknown"


def col_to_display_name(col: str) -> str:
    for prefix in CARD_PREFIXES:
        if col.startswith(prefix):
            col = col[len(prefix):]
            break
    return col.replace("_", " ").title()


def make_union_block(col: str, card_name: str, card_type: str) -> str:
    return (
        f"\n    union all\n\n"
        f"    select\n"
        f"        run_id,\n"
        f"        '{card_type}'  as card_type,\n"
        f"        '{card_name}'          as card_name,\n"
        f"        cast(floor(cast({col} as decimal)) as integer) as copies,\n"
        f"        0                                                              as upgrades\n"
        f"    from source\n"
        f"    where {col} is not null\n"
        f"      and cast({col} as decimal) > 0\n"
    )


def check_new_cards():
    print("\n[2/4] Checking for new card columns...")

    csv_cols = pd.read_csv(CSV_PATH, nrows=0).columns.tolist()
    csv_card_cols = {c for c in csv_cols if c.startswith(CARD_PREFIXES)}

    sql_text = STG_CARDS.read_text(encoding="utf-8")
    handled = set(re.findall(r'cast\((\w+) as decimal\)', sql_text))
    handled_card_cols = {c for c in handled if c.startswith(CARD_PREFIXES)}

    new_cols   = sorted(csv_card_cols - handled_card_cols)
    stale_cols = sorted(handled_card_cols - csv_card_cols)

    if stale_cols:
        print(f"      WARNING: {len(stale_cols)} column(s) in stg_cards.sql no longer exist in the CSV:")
        for col in stale_cols:
            print(f"        - {col}")
        print("      Remove or rename these blocks in stg_cards.sql manually.")

    if not new_cols:
        print("      No new cards — stg_cards.sql is up to date.")
        return

    print(f"      {len(new_cols)} new card column(s) detected:")
    new_blocks = []
    for col in new_cols:
        card_name = col_to_display_name(col)
        card_type = col_to_card_type(col)
        print(f"        + {col}  →  '{card_name}' ({card_type})")
        new_blocks.append(make_union_block(col, card_name, card_type))

    insert_marker = "\n)\n\nselect"
    if insert_marker not in sql_text:
        print("      ERROR: Could not locate insert point in stg_cards.sql. Manual update required.")
        return

    patched = sql_text.replace(insert_marker, "".join(new_blocks) + insert_marker, 1)
    STG_CARDS.write_text(patched, encoding="utf-8")
    print(f"      stg_cards.sql patched with {len(new_cols)} new block(s).")


# ── 3. dbt build ──────────────────────────────────────────────────────────────
def dbt_build():
    print("\n[3/4] Running dbt build...")
    result = subprocess.run(["dbt", "build"], cwd=DBT_DIR)
    if result.returncode != 0:
        print("      ERROR: dbt build failed. Continuing to next step.")
        return
    print("      dbt build complete.")


# ── Clan ordering (canonical display order per CLAUDE.md) ─────────────────────
CLAN_ORDER = [
    "Banished",
    "Pyreborne",
    "Luna Coven",
    "Underlegion",
    "Lazarus League",
    "Hellhorned",
    "Awoken",
    "Stygian Guard",
    "Umbra",
    "Melting Remnant",
    "Wurmkin",
    "Railforged",
]


# ── 4. Win/Loss statistics ────────────────────────────────────────────────────
def win_loss_stats():
    print("\n[4/4] Win/Loss Statistics")

    df = pd.read_csv(CSV_PATH)
    df = df[df["result"].isin(["Victory", "Loss"])].copy()
    df["win"] = df["result"] == "Victory"

    def table(group_col, data, clan_ordered=False):
        stats = (
            data.groupby(group_col)["win"]
            .agg(Wins="sum", Total="count")
            .assign(Losses=lambda x: x["Total"] - x["Wins"])
        )
        stats["Win%"] = (stats["Wins"] / stats["Total"] * 100).round(1)
        stats = stats[["Wins", "Losses", "Total", "Win%"]]
        if clan_ordered:
            ordered = [c for c in CLAN_ORDER if c in stats.index]
            remainder = [c for c in stats.index if c not in CLAN_ORDER]
            stats = stats.loc[ordered + remainder]
        else:
            stats = stats.sort_values("Win%", ascending=False)
        return stats

    combined = pd.concat([
        df[["primary_clan", "win"]].rename(columns={"primary_clan": "clan"}),
        df[["secondary_clan", "win"]].rename(columns={"secondary_clan": "clan"}),
    ]).dropna(subset=["clan"])

    sections = [
        ("WIN/LOSS BY CLAN (PRIMARY OR SECONDARY)", "clan",           combined,  True),
        ("WIN/LOSS BY PRIMARY CLAN",                "primary_clan",   df,        True),
        ("WIN/LOSS BY SECONDARY CLAN",              "secondary_clan", df,        True),
        ("WIN/LOSS BY HERO",                        "hero",           df,        False),
        ("WIN/LOSS BY COVENANT RANK",               "covenant_rank",  df,        False),
        ("WIN/LOSS BY PYRE HEART",                  "pyre_heart",     df,        False),
    ]

    for title, col, data, clan_ordered in sections:
        print("\n" + "=" * 50)
        print(title)
        print("=" * 50)
        print(table(col, data, clan_ordered=clan_ordered).to_string())


# ── Main ──────────────────────────────────────────────────────────────────────
def pipeline():
    excel_to_csv()
    check_new_cards()
    dbt_build()
    win_loss_stats()


if __name__ == "__main__":
    pipeline()
