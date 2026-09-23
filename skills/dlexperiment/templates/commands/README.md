# Command templates

These files are optional project-local slash command templates. To install them in a repository, copy the desired files into:

```text
<project>/.claude/commands/
```

Recommended set:

- `exp-start.md` → `/exp-start`
- `exp-log.md` → `/exp-log`
- `exp-analyze.md` → `/exp-analyze`
- `exp-next.md` → `/exp-next`
- `exp-wrap.md` → `/exp-wrap`
- `exp-auto.md` → `/exp-auto`
- `exp-compare.md` → `/exp-compare`

The skill can still be triggered naturally without these command files, but project-local commands make the workflow easier to invoke repeatedly.
