# Monster Cards — Development and Branch Guide

_Last reviewed: 24 October 2026_

## Project direction

Monster Cards is one game with a shared Python/Pygame codebase. The goal is to support **desktop and browser (Pygbag)** without maintaining two separate versions of the gameplay code.

The university submission is preserved by the `uni-submission-v1` Git tag. Future development does not need to remain frozen at that version.

## Branches

| Branch | Purpose | Status |
| --- | --- | --- |
| `main` | Stable, tested releases of Monster Cards | Keep stable; update from `dev` when ready |
| `dev` | Main line of active development | Day-to-day development; preferred default while pre-v1 |
| `web-pygbag` | Original experimental browser port, including browser-specific changes and troubleshooting docs | **Keep as a reference** until integration is complete |
| `gh-pages` | Generated browser build published by GitHub Pages | **Deployment output only**; do not develop the game here |
| `feat/*` | Short-lived branches for isolated work | Merge back into `dev` when tested |

### Tags

- `uni-submission-v1` marks the original university submission (`3ae24e9`).
- A tag preserves that historical version even after `main` moves forward.
- Use future tags for meaningful release milestones; branches are for ongoing work.

## Normal development workflow

1. Start from an up-to-date `dev` branch.
2. Make a small change on `dev`, or create a `feat/*` branch for larger work.
3. Test the change and commit it.
4. Merge feature work back into `dev`.
5. Once a release is tested, merge `dev` into `main`.
6. Tag the release if appropriate.

**Documentation follows the same workflow as code.** A document committed on `dev` will come to `main` with the next merge. You do not need to cherry-pick it just to keep the branches in sync.

## Browser integration — planned work

**Target:** Both launch methods work from the same development branch, sharing game logic, assets and UI wherever possible.

- [ ] Review actual differences between `dev` and `web-pygbag` before copying code.
- [ ] Create `feat/pygbag-integration` from `dev`.
- [ ] Bring over the root Pygbag entry point and asynchronous game-loop support.
- [ ] Preserve a working desktop launcher and test both platforms after changes.
- [ ] Consolidate repeated browser-platform checks where doing so improves clarity.
- [ ] Convert or otherwise resolve browser audio compatibility.
- [ ] Investigate browser Quit behaviour and slow initial loading independently.
- [ ] Reproduce and diagnose the reported later-round browser crash using its traceback.
- [ ] Write a new integration/build guide while keeping the original browser-port notes untouched.
- [ ] Merge the tested integration into `dev`.
- [ ] Retire `web-pygbag` **only after** its useful code and documentation are safely incorporated.

The two original Pygbag documents currently live in `web-pygbag/docs/`. They are historical references, not instructions to rerun every command without review.

## GitHub Pages deployment

The live browser site is served from the **root of `gh-pages`**:

https://nievyx.github.io/monster-cards/

The branch contains generated files such as `index.html`, `.nojekyll`, and packaged game assets. Do not run Pygbag from `gh-pages` or edit its generated output as the primary source of truth.

The previous deployment used a manual build and Git worktree. **Do not blindly repeat old force-push instructions** from the initial Pygbag notes; verify the current build and deployment process first.

## Next session — starting point

1. Review `git diff main dev` to decide whether the updated desktop launcher is ready for `main`.
2. Commit this document on `dev` (and link it from `README.md` if useful).
3. Inspect `dev` vs `web-pygbag`, one file at a time, before beginning the integration.

**Guiding principle:** One game, two launch targets, one shared development history.
