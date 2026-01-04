---
name: lessons-learned
description: Conduct structured retrospective analysis for incidents, mistakes, and near-misses. Transforms problems into systematic improvements.
use_when: After incidents, mistakes, rollbacks, or when user says "what went wrong", "lessons learned", "post-mortem", "retrospective", or "how do we prevent this"
---

# Lessons Learned

Structured retrospective analysis for incidents, mistakes, and near-misses. Transforms problems into systematic improvements.

## Objective

Analyze incidents using a structured framework, identify root causes, and encode preventive measures directly into skills, guards, or documentation. The goal is systematic improvement, not blame.

## Process

### Phase 1: Incident Definition

**Capture the facts first, analysis later.**

```markdown
## Incident Summary

**What happened:** [Factual description of the event]
**When:** [Date/time]
**Impact:** [What was affected, scope of damage]
**Resolution:** [How it was fixed/rolled back]
**Time to resolution:** [How long to fix]
```

### Phase 2: Timeline Reconstruction

Build a chronological sequence of events:

```markdown
## Timeline

| Time | Action | Actor | Outcome |
|------|--------|-------|---------|
| HH:MM | [What was done] | [Claude/User] | [Result] |
| HH:MM | [Next action] | [Claude/User] | [Result] |
```

**Key questions:**
- What was the trigger?
- Where did the sequence diverge from expected?
- What was the point of no return?

### Phase 3: Root Cause Analysis

Use the **5 Whys** technique:

```markdown
## Root Cause Analysis

1. Why did [incident] happen?
   → Because [immediate cause]

2. Why did [immediate cause] happen?
   → Because [deeper cause]

3. Why did [deeper cause] happen?
   → Because [systemic issue]

4. Why did [systemic issue] exist?
   → Because [process gap]

5. Why did [process gap] exist?
   → Because [root cause]

**Root Cause:** [The fundamental issue to address]
```

### Phase 4: Contributing Factors

Identify all factors that contributed (not just the root cause):

| Category | Factor | Contribution |
|----------|--------|--------------|
| **Process** | Missing checkpoint, unclear workflow | [How it contributed] |
| **Communication** | Ambiguous instructions, assumed consent | [How it contributed] |
| **Technical** | Missing guard, no validation | [How it contributed] |
| **Context** | Session continuation, prior assumptions | [How it contributed] |
| **Human** | Fatigue, time pressure, overconfidence | [How it contributed] |

### Phase 5: Fix Classification

Classify the fix by type and encode it appropriately:

| Fix Type | When to Use | How to Encode |
|----------|-------------|---------------|
| **Skill** | Recurring workflow needs structure | Create SKILL.md in ~/.claude/skills/ |
| **Guard** | Action requires mandatory checkpoint | Add to skill with explicit approval gate |
| **Documentation** | Knowledge gap caused the issue | Update CLAUDE.md or relevant docs |
| **Automation** | Manual step was forgotten | Create hook or script |
| **Checklist** | Multiple steps need verification | Add to existing skill or create new one |

### Phase 6: Fix Implementation

**Don't just recommend fixes - implement them.**

```markdown
## Fixes Implemented

| Fix | Type | Location | Status |
|-----|------|----------|--------|
| [Description] | Skill/Guard/Doc | [File path] | Created |
| [Description] | Skill/Guard/Doc | [File path] | Updated |
```

### Phase 7: Verification

How will we know the fix works?

```markdown
## Verification

**Test scenario:** [How to test the fix]
**Success criteria:** [What "fixed" looks like]
**Review date:** [When to check if fix is working]
```

## Output Template

```markdown
# Lessons Learned: [Incident Title]

**Date:** YYYY-MM-DD
**Severity:** [Low/Medium/High/Critical]
**Status:** [Resolved/Monitoring/Open]

## Incident Summary

[Brief description]

## Timeline

| Time | Action | Actor | Outcome |
|------|--------|-------|---------|

## Root Cause

[The fundamental issue]

## Contributing Factors

- [Factor 1]
- [Factor 2]

## Fixes Implemented

| Fix | Type | Location | Status |
|-----|------|----------|--------|

## Prevention

[How this prevents recurrence]

## Lessons

1. [Key takeaway 1]
2. [Key takeaway 2]
```

## Common Incident Patterns

### Pattern: Premature Action

**Symptom:** Action taken before user approval
**Root cause:** Implied consent interpreted as explicit consent
**Fix:** Add explicit approval gate to relevant skill

```markdown
## Approval Gate Template

Before [ACTION]:
1. Show user exactly what will happen
2. Ask: "Ready to [action]? (yes/no)"
3. Wait for explicit "yes" or "proceed"
4. Only then execute
```

### Pattern: Sequence Error

**Symptom:** Steps executed in wrong order
**Root cause:** Missing dependency chain in workflow
**Fix:** Encode sequence in skill with numbered steps

### Pattern: Missing Validation

**Symptom:** Bad data or invalid state passed through
**Root cause:** No validation checkpoint
**Fix:** Add validation step to skill or create pre-flight check

### Pattern: Context Carryover

**Symptom:** Assumptions from prior session caused issue
**Root cause:** Session state incorrectly assumed to persist
**Fix:** Add explicit context verification at task start

### Pattern: Scope Creep

**Symptom:** Did more than requested, caused unintended effects
**Root cause:** Interpreted task scope too broadly
**Fix:** Ask clarifying questions before expanding scope

## Anti-Patterns

**Don't do these:**

| Anti-Pattern | Problem | Instead |
|--------------|---------|---------|
| Blame assignment | Creates defensiveness, misses systemic issues | Focus on process, not people |
| Single-cause thinking | Oversimplifies, misses contributing factors | Use 5 Whys, identify multiple factors |
| Recommendation without action | Lessons forgotten, issue recurs | Implement fixes during retrospective |
| Vague fixes | "Be more careful" doesn't prevent recurrence | Encode specific, verifiable changes |
| Skip verification | No way to know if fix worked | Define success criteria and review date |

## Success Criteria

The retrospective is complete when:

- [ ] Incident clearly defined with timeline
- [ ] Root cause identified (not just symptoms)
- [ ] Contributing factors documented
- [ ] At least one fix implemented (not just recommended)
- [ ] Fix is encoded in appropriate location (skill, doc, hook)
- [ ] Verification criteria defined
- [ ] Key lessons summarized
