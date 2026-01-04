# Contributing to Claude Lessons Learned

Thanks for your interest in improving the lessons-learned skill!

## Ways to Contribute

### Add Incident Patterns

If you've identified recurring incident patterns:

1. Describe the pattern (symptom, root cause, typical fix)
2. Provide an example scenario
3. Suggest where in the skill it should be added

### Improve the Process

The 7-phase framework can be refined:

- Better questions to ask at each phase
- More effective templates
- Improved guidance on fix classification

### Expand Fix Types

Help categorize more fix types:

- New categories of fixes
- Better criteria for classification
- Examples of each type

### Add Anti-Patterns

Document more things to avoid:

- Common mistakes in retrospectives
- Why they're problematic
- What to do instead

## Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b add-pattern`)
3. Make your changes to `skills/lessons-learned/SKILL.md`
4. Test with a real or hypothetical incident
5. Submit a pull request

## Guidelines

### Keep It Actionable

The skill emphasizes implementation over recommendation:

- Every pattern should have a concrete fix type
- Fixes should be encodable (skills, docs, hooks)
- Vague advice like "be more careful" is not acceptable

### Focus on Systems, Not People

Retrospectives should:
- Identify process gaps
- Improve workflows
- Create durable guards

They should NOT:
- Assign blame
- Focus on individual mistakes
- Create guilt or defensiveness

### Maintain the Phase Structure

The 7-phase flow is intentional:
1. Facts first (Definition, Timeline)
2. Analysis next (Root Cause, Factors)
3. Action last (Classification, Implementation, Verification)

Changes should respect this sequence.

## Questions?

Open an issue for discussion before major changes.
