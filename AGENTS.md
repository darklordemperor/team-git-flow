# Team Git Flow Test Instructions

## Purpose

This repository is a test project for practicing the team's Git workflow. The source diagram is
stored at [`docs/team-git-flow.jpg`](docs/team-git-flow.jpg).

Follow the branch and tagging rules in this file when working in this repository. Do not replace
this experiment with standard Git Flow conventions unless the user explicitly asks for that
change.

## Branches

All six branches are long-lived in this experiment:

| Branch    | Role                                                                                        |
| --------- | ------------------------------------------------------------------------------------------- |
| `main`    | Production branch and the equivalent of `master` in the diagram; it is the default branch.  |
| `dev`     | Integration branch for completed feature work.                                              |
| `feature` | Shared branch for feature development. Do not create `feature/*` branches during this test. |
| `release` | Branch for preparing and stabilizing a normal release.                                      |
| `staging` | CI/CD validation and staging-environment branch.                                            |
| `hotfix`  | Branch for urgent production fixes.                                                         |

Test release flow commit

Do not delete these branches after merges while this Git-flow experiment is active.

## Normal feature and release flow

1. Start feature work from the current `feature` branch and pull its latest remote state.
2. Commit and push feature updates to `feature`; do not create another feature branch.
3. Merge the completed `feature` work into `dev` through a pull request when possible.
4. Merge the release candidate from `dev` into `release`.
5. Merge `release` into `staging` and complete CI/CD or manual validation.
6. Merge the validated release into `main`.
7. Merge any release-only corrections back into `dev` and `feature` when applicable.
8. Create and push a new annotated version tag on the validated `main` commit.

## Hotfix flow

1. Prepare the urgent fix on `hotfix`, using the current production state from `main` as the base.
2. Merge `hotfix` into `staging` and validate it.
3. Merge the validated hotfix into `main`.
4. Merge the same fix back into `dev`, `feature`, and `release` when applicable.
5. Create and push a new annotated patch-version tag on the resulting `main` commit.

## Version and tag rules

- Treat tags as immutable markers. Never move or overwrite an existing remote tag.
- A tag does not update or merge a branch; commits and merges do that.
- Update the Flutter `version` in `pubspec.yaml` before tagging a release.
- Use a new semantic version for every tagged release, such as `v0.1.0`, `v0.2.0`, or `v0.2.1`.
- Normal releases usually increment the minor or major version. Hotfixes increment the patch version.
- Create tags only after validation and the final merge into `main`, not for every intermediate feature commit.

Example:

```bash
git switch main
git pull --ff-only origin main
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

## Safety and verification

- Before changing branches, run `git status -sb` and preserve unrelated work.
- Fetch or pull the relevant remote branch before starting a merge.
- Prefer pull requests for merges so the flow is visible on GitHub.
- Do not force-push `main`, `dev`, `release`, `staging`, or `hotfix`.
- Do not create or push a release tag without explicit user approval.
- For Dart or Flutter changes, run `dart analyze` and `flutter test` before merging forward.
- Report the source branch, target branch, commit, tag, and verification result after each flow test.
