# team-git-flow

A minimal Flutter project for testing the team's Git workflow.

## Branch model

| Branch | Purpose |
| --- | --- |
| `main` | Production branch (the `master` role in the team diagram) |
| `dev` | Integration branch for completed development work |
| `feature` | Team's long-lived feature work branch |
| `release` | Release preparation branch |
| `staging` | CI/CD staging environment branch |
| `hotfix` | Urgent production-fix branch |

All six branches begin at the same initial commit. A commit or merge changes branch history; a tag does not.

## Version tags

Create a new immutable tag only for a meaningful version or deployment, for example:

```bash
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

Do not repeatedly move an existing tag to newer feature commits. If the version changes, create a new tag.

## Verification

```bash
dart analyze
flutter test
```
