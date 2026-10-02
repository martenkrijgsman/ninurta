# Ninurta & Sharur — Project Plan

Exported 2 Oct 2026 from the living plan doc. The Claude Doc is the master copy; this file is the copy build agents read.

## Vision

A pixel-art metroidvania where Ninurta, god of war and the hunt, fights his way through the lines of a cuneiform tablet with Sharur, a talking mace who doubts him. The first goal is a polished vertical slice: one chapter that proves the game is fun, built with free tools, step by step, with Claude doing the building and the user directing.

**Design pillars**

1. **The tablet is the level.** Play happens between the ruling lines of a clay tablet. The signs floating behind Ninurta are both the story's text and his source of power: stand at the right word and Sharur draws lightning, wind or flood out of it.
2. **Heavy, readable combat.** Blasphemous-style weight: visible wind-ups, hit-stop, parries, knockback. Damage is forgiving, not punishing.
3. **Flowing traversal.** Lost Crown-style platforming with wall-jumps and a Blasphemous-style slide (gliding on Ninurta's wings comes in the full game), generous checkpoints and no cheap deaths.
4. **Scholarly, with licence.** Pentiment-style framing: a scholar reads the tablets and we zoom in to play them. Real sources, real cuneiform, creative liberties where they serve the game. Broken tablets become mechanics.
5. **Sharur's mouth.** An irreverent shit-talker who wants Ninurta to win but has to be convinced he deserves it. His arc is the emotional spine.

**What the vertical slice must prove** (roughly 20–30 minutes of play)

- The scholar's study and the zoom into a tablet
- One chapter of about 8–12 rooms with the full movement kit
- Three enemy types and one boss
- Two sign-powers unlocked through the tablet mechanic
- Dialogue that appears in cuneiform and resolves into English
- Music, sound, saving, and a Windows build friends can download

## Key decisions

| Area | Choice | Why |
| --- | --- | --- |
| Engine | Godot 4, current stable, standard (non-.NET) build | Free, MIT licence, 2D-first, text-based project files |
| Code language | GDScript | Godot's own language; simplest for agents and readable for the user |
| Game resolution | 640 × 360, scaled ×3 to 1080p and ×4 to 1440p | Blasphemous-like pixel density; whole-number scaling keeps pixels crisp. Ninurta about 48 px tall (to confirm in Phase 1) |
| Version control | Private GitHub repo, Git LFS for art and audio | Every change is saved, reviewable and undoable |
| Builder | Claude Code in the desktop app, working in the repo on the user's PC | It can run Godot, tests and builds locally |
| Design partner | The Claude project chats | Specs, story, decisions; keeps the plan current |
| Automated tests | GUT (Godot Unit Test) addon | Agents check their own work before the user playtests |
| Dialogue | Dialogue Manager addon (free, MIT) | Dialogue lives in text files agents can write |
| Pixel art editor | Pixelorama or LibreSprite (both free) | Clean-up of generated sprites |
| Cuneiform font | Noto Sans Cuneiform (SIL Open Font Licence) as the source for a hand-cleaned pixel sign set | Free to ship commercially; Unicode-correct |
| Audio tools | AI music generation, LMMS, Audacity, jsfxr, CC0 sound libraries | All free or permitted |
| Input | Keyboard first (arrows, Z jump, X attack, C slide, V parry, S invoke, A heal), gamepad later | Godot's input map makes adding a pad cheap |
| Platform | Windows PC (Ryzen 5700X, 32 GB RAM, RTX 3070) | |

## How we work

The user directs, Claude builds, and every task ends with something playable or checkable. The user's hands-on work is limited to installing things, playtesting, and saying what they want changed in plain English.

**The loop, for every task**

1. Pick the next unticked task in this plan.
2. The user opens Claude Code on the repo and says: "Do task 2.3 from the plan."
3. The agent reads `CLAUDE.md` and the relevant spec, builds the task, runs the tests, and commits to its own branch.
4. The user presses Play in Godot (or runs the build) and reacts.
5. The agent adjusts, then merges, and ticks the task in this file.

**Task-sizing rules**

- One system per task, touching roughly five files or fewer.
- Each task states its done-criteria and ends runnable, with a commit.
- Tuning values live in one settings file, so feel changes are quick edits rather than new tasks.
- If a task turns out bigger than expected, the agent stops, splits it, and adds the new tasks to this plan.

**Repo layout**

- `game/` the Godot project
- `docs/` the plan, design doc, specs and story bible
- `art-source/` and `audio-source/` raw and generated assets before import
- `tools/` helper scripts (palette conversion, sprite sheets, builds)
- `CLAUDE.md` standing rules for every agent: conventions, how to test, keep `CREDITS.md` current

## Build phases

Phases 2–7 run in order in grey boxes; art (A) and audio (B) tasks run in parallel from Phase 1 and are swapped in during Phase 8.

### Phase 0 — Setup

- [x] 0.1 Install Godot 4 (standard build), Git for Windows and Git LFS
- [x] 0.2 Create a private GitHub repo for the game
- [x] 0.3 Install the Claude desktop app and open Claude Code on the repo folder
- [x] 0.4 Agent: scaffold the repo (folders, `.gitignore`, LFS rules, `CLAUDE.md`, this plan in `docs/`), and an empty Godot project with 640 × 360 pixel-perfect settings. Done when it opens in Godot
- [x] 0.5 Agent: add GUT, one sample test and a one-command test runner
- [x] 0.6 Agent: Windows export preset and build script. Done when the user can double-click an `.exe`

### Phase 1 — Design documents (in the Claude project)

- [x] 1.1 Game design document v1: core loop, controls, ability list, progression (`docs/design/GDD.md`)
- [ ] 1.2 Story bible: Anzu as the frame, Lugal-e and Angim chapters, the scholar, characters
- [ ] 1.3 Sharur voice bible: personality rules, his arc, 30 sample lines
- [ ] 1.4 Tablet mechanic spec: registers, sign zones, invocation, first 6–8 sign-powers
- [ ] 1.5 Combat feel spec: wind-up and recovery timings, hit-stop, parry window, damage values
- [ ] 1.6 Vertical slice spec: room list, enemies, boss, powers, story beats

### Phase 2 — Movement (grey boxes)

- [ ] 2.1 Player scene, state machine, run, gravity, variable-height jump
- [ ] 2.2 Coyote time, jump buffering, corner forgiveness
- [ ] 2.3 Wall slide and wall jump
- [ ] 2.4 Slide: Blasphemous-style ground dodge, under low gaps and through enemies
- [ ] 2.5 Glide (deferred to the full game; skip for the slice)
- [ ] 2.6 Camera: smooth follow, look-ahead, room bounds
- [ ] 2.7 Movement test level plus one tuning file for all movement values
- [ ] 2.8 Feel pass: user plays, lists changes, agent tunes

### Phase 3 — Combat

- [ ] 3.1 Hitboxes, hurtboxes, health and damage components
- [ ] 3.2 Sharur three-hit combo with wind-up, active and recovery frames
- [ ] 3.3 Hit-stop, screen shake, knockback
- [ ] 3.4 Charged smash, air attack, downward slam
- [ ] 3.5 Parry and riposte
- [ ] 3.6 Player hurt, death and checkpoint respawn (forgiving)
- [ ] 3.7 Enemy base: patrol, aggro, telegraphed attacks; training dummy
- [ ] 3.8 Three grey-box enemy types: melee, ranged, flying
- [ ] 3.9 Combat feel pass

### Phase 4 — The tablet mechanic

- [ ] 4.1 Tablet frame: ruling lines as the top and bottom of play, stacked registers, moving between lines
- [ ] 4.2 Background sign layer drawn from a text data file, with parallax
- [ ] 4.3 Sign zones: detect when Ninurta stands at a word, highlight it, show a prompt
- [ ] 4.4 Invocation: Sharur draws on the sign; a data table maps signs to powers
- [ ] 4.5 First two sign-powers (placeholders, e.g. storm wind and lightning)
- [ ] 4.6 Power unlocking and persistence
- [ ] 4.7 Broken tablets: gaps in the text as traversal gaps and secrets; fragments that restore lines and open paths
- [ ] 4.8 Joining: two-faced fragments slotted into sockets at a cylinder seal, choosing which face is up; joins change the room straight away and are saved (see GDD §5.4)

### Phase 5 — Dialogue and text

- [ ] 5.1 Dialogue Manager set-up; Sharur's in-combat barks
- [ ] 5.2 Speech bubbles that show cuneiform first, then resolve into English, with a style per speaker
- [ ] 5.3 Pixel cuneiform pipeline: render signs from the font, clean up, import as a sign atlas
- [ ] 5.4 Scholar's notes: a codex of signs found, with transliteration and translation

### Phase 6 — Metroidvania structure

- [ ] 6.1 Rooms, transitions and spawn points
- [ ] 6.2 Save and load
- [ ] 6.3 Ability gates
- [ ] 6.4 Map screen shaped like a tablet, filling in as you explore
- [ ] 6.5 Pause menu and settings (volume, key rebinding)
- [ ] 6.6 Collectibles and health upgrades

### Phase 7 — The scholar's frame

- [ ] 7.1 Scholar's study scene
- [ ] 7.2 Zoom transition from desk to tablet to gameplay
- [ ] 7.3 Chapter select from tablets on the desk
- [ ] 7.4 Scholar narration between chapters

### Phase 8 — Vertical slice content

- [ ] 8.1 Grey-box layout of the slice's rooms from the spec
- [ ] 8.2 Place enemies, signs and secrets
- [ ] 8.3 Boss: moveset and phases
- [ ] 8.4 Write and wire the slice's dialogue
- [ ] 8.5 Swap in final art
- [ ] 8.6 Swap in music and sound
- [ ] 8.7 Friends playtest and fix pass

### Phase 9 — Ship the slice

- [ ] 9.1 Bug and performance pass
- [ ] 9.2 Windows build on an unlisted itch.io page
- [ ] 9.3 Gather feedback and decide what comes next (full game, Steam)

## Art sub-project

All art is pixel art at 640 × 360, locked to one shared palette (about 32 colours from clay, bitumen, lapis lazuli, carnelian, gold, gypsum, plus storm whites and blues). Ninurta's design starts from the Nimrud relief: horned crown, braided beard, tasselled kilt, wings that will become his glide in the full game.

Pipeline: user sketch or description → AI concept → script snaps to palette and pixel grid → clean-up in Pixelorama → script exports sprite sheets and Godot import settings.

- [ ] A.1 Style guide and palette, with a mood board of reliefs and tablets
- [ ] A.2 Tooling scripts: palette snap, grid downscale, sprite-sheet packing
- [ ] A.3 Ninurta concept, then idle and run sprites
- [ ] A.4 Ninurta's full animation set: jump, fall, wall slide, slide, attacks, parry, hurt, death, invoke
- [ ] A.5 Sharur: weapon design, in-hand sprite, talking portrait
- [ ] A.6 Tablet tileset: clay surfaces, ruling lines, cracks, broken edges
- [ ] A.7 Pixel sign set: the first 60 or so cuneiform signs the slice needs
- [ ] A.8 Parallax backgrounds for the slice chapter
- [ ] A.9 Three enemies and the boss
- [ ] A.10 Interface: health, power selector, speech bubbles, map
- [ ] A.11 Scholar's study and the scholar's portrait
- [ ] A.12 Effects: lightning, wind, hit sparks, dust

## Audio sub-project

Broadly Mesopotamian: lyre, frame drums, reed pipes and voice, in the spirit of the Hurrian hymn reconstructions and Peter Pringle's Gilgamesh performances (mood references only; we make our own music).

- [ ] B.1 Audio direction: instruments, moods per area, reference list
- [ ] B.2 Sound effects: footsteps, mace impacts, parry, slide, sign invocation
- [ ] B.3 Music: scholar's study theme, slice exploration track, combat layer, boss theme
- [ ] B.4 Adaptive music in Godot: layers that fade in when combat starts
- [ ] B.5 Voices: decide between voiced "blips" or AI voice acting for Sharur
- [ ] B.6 Mix and loudness pass

## Sources, licensing and accuracy

- Ancient texts (Anzu, Lugal-e, Angim) are free to use; modern editions and translations (e.g. ETCSL, published Anzu translations) are copyrighted. Consult them, write our own English.
- Pick one sign period for consistency (recommendation: Neo-Assyrian).
- Layard's relief drawing and the 1884 Rawlinson and Pinches plate are out of copyright.
- Noto Sans Cuneiform and MIT-licensed addons allow commercial use; list every third-party item in `CREDITS.md`.
- AI-generated assets are allowed; keep a log of which assets were generated (storefronts such as Steam ask for disclosure).
- Keep a short "liberties taken" note per chapter.

## Open questions (Phase 1)

- Working title ("Ninurta & Sharur" is a placeholder)
- Slice chapter and boss (recommendation: Lugal-e chapter ending with Asag; alternative: Anzu prologue)
- Angim as a trophy hub in Nippur
- The scholar: 19th-century decipherer or present-day Assyriologist
- Script period (recommendation: Neo-Assyrian)
- Sign-power list (candidates: storm wind, lightning, flood, mountain or stone)
- Sharur's voice: blips or AI voice acting

## Decisions log

| Date | Decision |
| --- | --- |
| 2 Oct 2026 | Windows PC only; keyboard first |
| 2 Oct 2026 | Vertical slice first, metroidvania structure |
| 2 Oct 2026 | Full pixel art; AI-generated assets allowed |
| 2 Oct 2026 | Damage is forgiving; combat weight comes from wind-ups, hit-stop and parries |
| 2 Oct 2026 | Godot 4 as the engine |
| 2 Oct 2026 | Step-based plan with no deadlines |
| 2 Oct 2026 | GDD v1: Ninurta starts with run and jump only; wall jump, dash and glide (his wings) unlock in the slice |
| 2 Oct 2026 | Sign-powers are invoked at sign zones and leave Sharur a short combat charge |
| 2 Oct 2026 | Keyboard layout: arrows + Z/X/C/V, S invoke, A heal |
| 2 Oct 2026 | Checkpoints are cylinder seals; beaten bosses become trophies; no skipping boss phases on retry |
| 2 Oct 2026 | Revised: start kit is run, jump and a Blasphemous-style ground slide; wall jump is the slice's only movement unlock; glide moves to the full game |
| 2 Oct 2026 | Obverse/reverse folded into broken tablets: two-faced fragments joined into sockets at seals, shaping boss arenas (and later whole levels). New task 4.8 |
