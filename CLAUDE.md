# CLAUDE.md — standing rules for every agent

This repo is **Ninurta & Sharur**, a pixel-art metroidvania built in Godot 4 with GDScript.
The user directs; you build. **The user does not code.**

## Before you start

1. **Read `docs/PLAN.md` first.** It is the master plan: vision, key decisions, repo layout and the task list. Read any spec in `docs/` that the task mentions.
2. **Do one task per session.** The user will say something like "Do task 2.3 from the plan". Do that task and nothing else. If you spot other problems, note them in your summary instead of fixing them.
3. **If the task is bigger than expected**, stop, split it into smaller tasks, add them to `docs/PLAN.md`, and tell the user.

## Staying in sync with the design chats

Design work (specs, story, decisions) happens in separate Claude project chats, which write their results straight into `docs/` on this computer or push them to GitHub. So:

- **At the start of every session**, run `git status` and `git pull`. If there are uncommitted changes in `docs/` that you did not make, they came from a design chat: read `docs/CHANGELOG.md` to see what changed, then commit them on a branch called `docs/sync-<date>` and merge it into `main` before starting your task (docs-only changes don't need a playtest).
- **Read the newest entries of `docs/CHANGELOG.md`** before you start, so you know about recent decisions.
- **At the end of every task**, add a line to the top of `docs/CHANGELOG.md`: date, `[code]`, task number, and one line on what changed. Also log any decision the user made during the session in the plan's Decisions log.
- `docs/PLAN.md` is the master plan for everyone. Tick tasks there; never keep a separate task list anywhere else.

## Git workflow

- **Work on a branch named after the task**, for example `task/2.3-wall-jump`. Never commit straight to `main`.
- **Run the tests before every commit.** All tests must pass. From the repo root:
  `powershell -NoProfile -ExecutionPolicy Bypass -File tools/run-tests.ps1` (exit code 0 = all passed).
  Tests use GUT and live in `game/tests/` (files named `test_*.gd`, extending `GutTest`). Add tests for every new system. The user can double-click `run-tests.bat` instead.
- **Windows build:** `powershell -NoProfile -ExecutionPolicy Bypass -File tools/build-windows.ps1` makes `builds/windows/NinurtaSharur.exe` (the user can double-click `build-windows.bat`). Test files are excluded from the build.
- Commit in small, clearly described steps. Push the branch when the task is done.
- Merge into `main` only after the user has playtested and said it's good. Then **tick the finished task in `docs/PLAN.md`** (`- [ ]` becomes `- [x]`).
- Images, audio, fonts and `.aseprite`/`.pxo` files go through Git LFS (see `.gitattributes`). Never commit build output or the `.godot/` folder.

## Project conventions

- Godot project lives in `game/`. Version: Godot 4.7.2 standard (non-.NET) build, at `C:\Tools\`.
- Code is GDScript only. Use static typing.
- Resolution is 640 × 360, scaled by whole numbers. Keep textures on nearest-neighbour filtering. Never use fractional scaling.
- Tuning values (speeds, timings, damage) go in one settings file per system, so feel changes are quick edits.
- Keep tasks small: one system per task, roughly five files or fewer.
- Raw and generated assets go in `art-source/` and `audio-source/` before they are imported into `game/`. Helper scripts go in `tools/`.

## Credits and AI assets

- **Keep `CREDITS.md` current.** Every third-party item (addon, font, sound, library) gets a line: name, author, licence, link.
- **Log every AI-generated asset in `docs/ai-assets.md`**: file path, what it is, the tool used, date, and whether it was cleaned up by hand. Storefronts like Steam require this disclosure.

## Talking to the user

- **Explain everything in plain English.** No jargon without a short explanation. The user does not read code.
- End every task with: what you built, how to check it in Godot (exact clicks and keys), what to look out for, and anything you need them to decide.
- When something fails, say so plainly and say what you'll do about it.
