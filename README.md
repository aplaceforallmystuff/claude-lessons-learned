# Lessons Learned

*Structured retrospective analysis that turns incidents into systematic improvements.*

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-6C5CE7)

![Lessons Learned](docs/images/claude-lessons-learned-architecture-diagram.png)

A Claude Code skill for structured retrospective analysis that transforms incidents into systematic improvements.

## Demo Video

[![Turn Every Failure Into a Fix](https://img.youtube.com/vi/ps-w7cBz9Ew/maxresdefault.jpg)](https://www.youtube.com/watch?v=ps-w7cBz9Ew)

Watch the skill run a live post-mortem on social media integration issues - tracing root causes, identifying fixes, and implementing them directly.

## Why

When things go wrong, the typical response is:

- Quick fixes that don't address root causes
- "Be more careful next time" (which doesn't work)
- Lessons that get forgotten
- Same mistakes repeated

This skill provides a structured framework for turning problems into durable improvements.

## Install

```bash
# In Claude Code:
/plugin marketplace add aplaceforallmystuff/marketplace
/plugin install claude-lessons-learned@aplaceforallmystuff
```

<details>
<summary>Manual install (without the marketplace)</summary>

```bash
# Clone the repository
git clone https://github.com/aplaceforallmystuff/claude-lessons-learned.git

# Copy to your Claude Code skills directory
cp -r claude-lessons-learned/skills/lessons-learned ~/.claude/skills/
```
</details>

## Use cases

Use it when:

- An incident or rollback just happened and you need a real post-mortem, not a shrug
- You catch yourself asking "what went wrong?" or "how do we prevent this?"
- A mistake keeps recurring and quick fixes haven't stopped it
- A near-miss exposed a gap worth encoding before it bites for real
- You want the fix written into a skill, guard, or doc — not just noted and forgotten

## How It Works

The skill guides you through a 7-phase retrospective process:

| Phase | Focus | Output |
|-------|-------|--------|
| 1. Definition | What happened? | Incident summary |
| 2. Timeline | Sequence of events | Chronological table |
| 3. Root Cause | 5 Whys analysis | Fundamental issue |
| 4. Factors | What contributed? | Factor matrix |
| 5. Classification | What type of fix? | Fix type decision |
| 6. Implementation | Encode the fix | Actual changes made |
| 7. Verification | How to test? | Success criteria |

### Key Principle: Implement, Don't Recommend

The skill enforces a critical rule: **don't just recommend fixes - implement them**.

This means:
- Creating or updating skills with new guards
- Adding documentation to prevent knowledge gaps
- Building automation for forgotten manual steps
- Encoding checklists for multi-step verification

## Example

The skill activates when you say:

- "lessons learned"
- "what went wrong"
- "post-mortem"
- "retrospective"
- "how do we prevent this"
- "that shouldn't have happened"

It then walks the 7 phases and produces a retrospective. Illustrative output:

```markdown
# Lessons Learned: Premature GitHub Push

**Date:** 2025-01-04
**Severity:** Medium
**Status:** Resolved

## Incident Summary

Pushed code to public GitHub repo before sanitizing personal references.

## Timeline

| Time | Action | Actor | Outcome |
|------|--------|-------|---------|
| 14:32 | Created skill file | Claude | Success |
| 14:35 | Committed changes | Claude | Success |
| 14:36 | Pushed to GitHub | Claude | Personal path exposed |
| 14:38 | User noticed issue | User | Alerted |
| 14:42 | Reverted and re-pushed | Claude | Resolved |

## Root Cause

Missing sanitization step in publishing workflow.

## Fixes Implemented

| Fix | Type | Location | Status |
|-----|------|----------|--------|
| Add sanitization guard | Skill | ~/.claude/skills/publish-guard/ | Created |
| Update prep-repo to require sanitization | Doc | CLAUDE.md | Updated |

## Lessons

1. Always run sanitization check before any public push
2. Encode mandatory steps as guards, not reminders
```

## Common Incident Patterns

| Pattern | Symptom | Typical Fix |
|---------|---------|-------------|
| **Premature Action** | Action before approval | Add explicit approval gate |
| **Sequence Error** | Wrong step order | Encode dependency chain |
| **Missing Validation** | Bad data passed through | Add validation checkpoint |
| **Context Carryover** | Prior session assumptions | Verify context at start |
| **Scope Creep** | Did more than requested | Ask before expanding |

## Fix Types

| Type | When to Use | Example |
|------|-------------|---------|
| **Skill** | Recurring workflow needs structure | Create new SKILL.md |
| **Guard** | Action requires checkpoint | Add approval gate |
| **Documentation** | Knowledge gap | Update CLAUDE.md |
| **Automation** | Manual step forgotten | Create hook/script |
| **Checklist** | Multiple steps need verification | Add to skill |

## Anti-Patterns to Avoid

| Don't | Why | Instead |
|-------|-----|---------|
| Assign blame | Creates defensiveness | Focus on process |
| Single-cause thinking | Oversimplifies | Use 5 Whys |
| Just recommend | Lessons forgotten | Implement during retrospective |
| Vague fixes | "Be careful" doesn't work | Encode specific changes |
| Skip verification | No way to know if fixed | Define success criteria |

## Related Skills

Part of the [aplaceforallmystuff](https://skills.sh/aplaceforallmystuff) skills collection:

- **[think-first](https://github.com/aplaceforallmystuff/claude-think-first)** — Mental model application before significant decisions
- **[rfu-audit](https://github.com/aplaceforallmystuff/claude-rfu-audit)** — 11-gate utility validation before investing effort
- **[creation-guard](https://github.com/aplaceforallmystuff/claude-creation-guard)** — Prevent duplicate artifacts before creating new ones

## License

MIT — see [LICENSE](LICENSE).

---

**The goal: Every mistake makes the system stronger, not just the memory longer.**
