# /log-decision — Log an Analysis Entry to the Journal

The user wants to document something in the analysis journal. The topic is:

> $ARGUMENTS

## What to do

Append a structured entry to `documentation/journal.md`. If the file does not exist yet,
create it with a header before appending. Group entries under a date heading (`## YYYY-MM-DD`);
if that date heading already exists, add the new entry under it.

Entries can be any of these types — use whichever fits:
- **Finding:** something observed in the data
- **Interpretation:** what a finding means or implies
- **Decision:** a choice made about how to analyze or model something
- **Question:** something unresolved that needs more data or thought
- **Next Step:** a concrete follow-up action that came out of analysis

A single journal entry can contain multiple types — e.g. a finding + interpretation + next step.

### Entry format

```markdown
## YYYY-MM-DD

### <Short Title>
**Type:** Finding | Interpretation | Decision | Question | Next Step (pick all that apply)
**Source:** <SQL file, Python file, or conversation — what produced this>

<Body: what was observed, what it means, what was decided, what's unresolved>

**N:** <state the number of runs this is based on>
**Next Steps:** <concrete follow-up, or "none identified">
```

## Writing rules

- **Be specific.** "Banished win rate is 45% (N=11) as primary" beats "Banished does okay."
- **Always state N.** Every finding needs a sample size.
- **Keep it concise.** Audit trail, not a paper.
- **Write in past tense** for findings and decisions. Present tense is fine for open questions.
- **Link to the source file** if the finding came from a specific file in `eda/`.
- **Append new entries below existing ones** within the same date heading — chronological order top to bottom.
- **Next Steps lives once at the bottom of the file**, not inside each entry. Every time you log a new entry, update the Next Steps section using this priority order:
  1. **Delete** any step that has already been completed
  2. **Update** an existing step if new information adds to it (don't create a duplicate)
  3. **Add** a new step only if it's genuinely new and not covered by an existing one

## After appending

Tell the user what was logged. Then check: does this entry imply any updates needed to
`documentation/todo.md` or `documentation/analytic_plans.md`? If yes, flag them explicitly.
