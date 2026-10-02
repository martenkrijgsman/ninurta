# Ninurta & Sharur — Game Design Document

Version 1 · 2 Oct 2026 · Task 1.1 in `docs/PLAN.md`

This document says **what the game is and how it plays**. It is the parent of the other Phase 1 specs, which go deeper on one area each:

| Topic | Detail lives in |
| --- | --- |
| Story, characters, chapters | `docs/story/story-bible.md` (1.2) |
| Sharur's personality and lines | `docs/story/sharur-voice.md` (1.3) |
| Signs, sign zones, sign-powers | `docs/design/tablet-mechanic.md` (1.4) |
| Exact timings, frames, damage numbers | `docs/design/combat-feel.md` (1.5) |
| The slice's rooms, enemies and boss | `docs/design/vertical-slice.md` (1.6) |

Where this document gives numbers, they are starting values for tuning, not final. Items marked **[proposal]** are Claude's suggestion and are not yet confirmed by the user; everything else is agreed.

---

## 1. The game in one paragraph

A side-scrolling pixel-art metroidvania. You are Ninurta, god of war and the hunt, armed only with Sharur, a talking mace who doubts you. Every level is a line of text on a clay tablet: you play between the ruling lines, the cuneiform signs of the story float behind you, and standing at the right word lets Sharur pull storm, lightning or flood out of it. A scholar at a desk is reading these tablets; we zoom from his lamp-lit study into the clay to play them. Combat is heavy and readable, traversal is flowing, and the game is forgiving: it wants you to feel mighty, not punished.

**Reference points:** combat weight of *Blasphemous*, traversal of *Prince of Persia: The Lost Crown* (with less demand on reflexes), framing of *Pentiment*.

## 2. Design pillars

From `docs/PLAN.md`; every design choice should serve at least one.

1. **The tablet is the level.**
2. **Heavy, readable combat.**
3. **Flowing traversal.**
4. **Scholarly, with licence.**
5. **Sharur's mouth.**

**Tie-breaker rule:** when two pillars pull in different directions, pick the option that keeps the player moving and laughing at Sharur over the one that is more "correct" or more punishing.

## 3. Core loop

### 3.1 Moment to moment (seconds)

Run → jump / slide / wall-jump across a register → meet enemies → read their wind-up → strike, parry or dodge → Sharur comments → keep moving.

### 3.2 Room to room (minutes)

Enter a room → solve its traversal or combat challenge → notice a sign in the background → invoke it if you know it (it opens a way, clears a hazard or empowers Sharur) → find a fragment or secret → reach the exit or a gate you can't pass yet (remember it for later) → at the next seal, decide where to join the fragments you've found.

### 3.3 Chapter (an hour or so in the full game; 20–30 minutes in the slice)

Pick a tablet from the scholar's desk → zoom in → explore its registers → learn one or two new sign-powers and new movement abilities → open the earlier gates → join fragments into the tablet's gaps to shape the boss arena → beat the chapter's boss → the boss becomes a trophy → zoom back out; the scholar reads what you just lived and adds to his notes.

### 3.4 Whole game

The Anzu myth frames the game: the bird Anzu has stolen the Tablet of Destinies and Ninurta must get it back. Earlier exploits (Lugal-e, Angim) are told as chapters on other tablets. Abilities carry across chapters, so returning to an old tablet with new powers opens its locked lines. Details belong to the story bible (1.2).

## 4. Controls (keyboard first)

All keys are rebindable (task 6.5). Gamepad comes later and maps 1:1.

| Action | Key | Gamepad (later) | Notes |
| --- | --- | --- | --- |
| Move | ← / → | Left stick | |
| Look up / aim up | ↑ | Up | Up-attack; enter doorways |
| Crouch / aim down | ↓ | Down | ↓ + attack in air = slam |
| Jump | Z | A | Hold for higher jump |
| Attack (Sharur) | X | X | Tap for combo; hold to charge a smash |
| Slide | C | RB | Ground only; under low gaps and through enemies |
| Parry | V | LB | Short window; perfect parry opens a riposte |
| Invoke sign | S | Y | Only at a sign zone (see §5.3) |
| Heal | A | B | Uses one offering charge |
| Map | Tab | Back | Also where fragments are joined, at a seal (see §5.4) |
| Pause | Esc | Start | |

Arrows under the right hand, the action keys along Z X C V with A and S just above them for the less frequent actions. Decided 2 Oct 2026.

## 5. Ninurta's kit

### 5.1 Movement

| Ability | When you get it | What it does |
| --- | --- | --- |
| Run | Start | Fast, with a short acceleration so it feels weighty but not sluggish |
| Variable jump | Start | Tap = short hop, hold = full jump; coyote time and jump buffering make it forgiving |
| Slide | Start | Blasphemous-style dodge: a fast low slide along the ground. Passes under low gaps and through enemies, with a brief window where most attacks miss. Ground only |
| Wall slide and wall jump | Unlocked midway through the slice | Slide slowly down walls; kick off to climb shafts |
| Glide | Full game | Hold jump in the air to spread Ninurta's wings and fall slowly; steer left and right. Not in the slice |
| Later abilities | Full game | Candidates: air dash, double jump on a gust, ground pound that breaks clay, swim in floodwater, climb along ruling lines |

Wall jump is the slice's one movement unlock; the start kit is run, jump and slide (decided 2 Oct 2026, replacing an earlier plan with three unlocks). One unlock gives the 8–12 rooms room to breathe: the first half of the chapter is built around running, jumping and sliding, the wall jump arrives around the middle, and the second half re-opens earlier shafts with it. Glide is saved for the full release, where it can headline a chapter of its own.

### 5.2 Combat with Sharur

Sharur is the only weapon. Every attack has a visible wind-up, a short active window, and a recovery you're committed to; this is where the weight comes from.

| Move | Input | Role |
| --- | --- | --- |
| Three-hit combo | X, X, X | Bread and butter; third hit knocks back |
| Charged smash | Hold X, release | Slow, huge hit; breaks guards and cracked clay |
| Air attack | X in the air | Sideways swing; one per jump |
| Up-attack | ↑ + X | For flyers |
| Downward slam | ↓ + X in the air | Lands with a shockwave; also a traversal tool |
| Parry | V | Timed block; a perfect parry staggers the enemy |
| Riposte | X right after a perfect parry | Heavy finisher with long hit-stop |
| Slide | C | Dodge and reposition; cancels recovery only late in a swing |

Hit-stop, screen shake and knockback on every hit; exact frame counts are for the combat feel spec (1.5).

### 5.3 Sign-powers

Sign-powers are the game's signature. The short version (full rules in 1.4):

- Cuneiform signs are drawn in the background of every register. Most are scenery and story. Some are **sign zones**: when Ninurta stands at one he knows, it glows and the invoke prompt appears.
- **Invoking** makes Sharur draw the power out of the sign: a gust that lifts you, lightning that destroys a barrier, a flood that raises water so you can swim higher.
- You **learn** a sign by finding it whole (often after a boss or a puzzle) and having the scholar read it; until then it shows as unread and can't be invoked.
- After an invocation, Sharur holds a charge of that power for a few seconds, usable as a special attack (decided 2 Oct 2026). Powers matter in combat as well as traversal, but you can't spam them anywhere: fights near the right signs play differently.

Candidate powers (to be chosen in 1.4): storm wind, lightning, flood, mountain/stone. The slice uses two.

### 5.4 Broken tablets and joins

Tablets in the game are damaged like real ones, and putting them back together is the game's meta-progression. Assyriologists call fitting a fragment back onto its tablet a **join**; the game borrows the word.

**Gaps.** A broken edge or chipped-out patch of text (a *lacuna*) is a physical gap in the level: a missing floor, a cut-off line, a hole in a wall. Some gaps are plain obstacles; others are **sockets** that take a fragment.

**Fragments.** You find fragments in rooms, behind secrets and on tougher enemies. Each fragment is a small piece of terrain with signs on it. Like a real tablet, every fragment has two faces, an **obverse** and a **reverse**, with different contents: one face might carry a ledge and a wind sign, the other a wall and a flood sign.

**Joining.** At any cylinder seal, open the tablet map and drag fragments into sockets on that tablet, choosing which face is up. The level changes straight away: platforms appear, sign zones are added, walls close off a route or open one. Joins can be undone and rearranged at any seal, so nothing is a permanent mistake.

**Two kinds of fit.**

- A **true join** fits exactly one socket and restores the original text. It opens a shortcut or secret and fills in a line of the scholar's translation. These work like keys.
- A **loose fragment** fits several sockets. Where you put it and which face you show is a tactical choice. These work like loadouts.

**Boss fights are where this shines.** Every boss arena has two or three sockets, with a seal at the door. Before a fight (or after a defeat) you decide how to build the arena: an obverse ledge to stay above a ground-pounding boss, a reverse wall to block a ranged boss's volleys, a lightning sign in the middle for Sharur to charge from. Different joins mean genuinely different fights, which also makes the game forgiving without making bosses weaker.

**In the full game** the same system can scale up to whole registers: rebuilding a line of the tablet one way or another changes the route through it, and returning to an old tablet with new fragments opens new versions of it. This replaces the earlier idea of separate obverse and reverse levels (decided 2 Oct 2026).

Exact rules (socket sizes, how many fragments, how faces are shown, how joins are saved) belong to the tablet mechanic spec (1.4).

## 6. Health, healing, death

The game is forgiving by design.

- **Health:** 5 segments at the start **[proposal]**; most enemy hits cost 1, bosses' big moves 2.
- **Healing:** a few offering charges (e.g. 3), used with A; a short, interruptible animation. Refilled at every checkpoint.
- **Checkpoints:** frequent, at least one every two or three rooms and always right before a boss. A checkpoint is a cylinder seal that Ninurta rolls into the clay (decided 2 Oct 2026). Seals are also where you rearrange fragment joins (§5.4).
- **Death:** respawn at the last checkpoint with full health. Nothing is lost: no dropped currency, no corpse run. Enemies in nearby rooms respawn.
- **Pits and hazards:** falling in costs 1 segment and puts you back on the last safe ledge, not the checkpoint.
- **Bosses:** if you die, retry from the seal at the door with full health. Bosses don't get easier and their phases aren't skipped; instead you can rejoin fragments at that seal to try a different arena and approach.

## 7. Progression

| What | How you get it | What it does |
| --- | --- | --- |
| Movement abilities | Story moments and bosses | Open new areas (the metroidvania gates) |
| Sign-powers | Learning whole signs | Open sign-locked gates; add a combat charge |
| Tablet fragments | Hidden in rooms, dropped by tougher enemies | Joined into gaps: shortcuts, secrets and different boss arenas (§5.4) |
| Health upgrades | Hidden or earned from mini-challenges | +1 health segment each (e.g. every 4 pieces = 1 segment) |
| Offering upgrades | Hidden | +1 healing charge |
| Trophies | Beating bosses (as in Lugal-e and Angim, where Ninurta's slain foes become trophies) | Hung in a hub; each grants a small passive bonus (decided 2 Oct 2026) |
| Scholar's notes | Automatically, as you meet signs and characters | The codex: sign, transliteration, translation, a line of commentary |

There is no shop, currency or experience in v1. Everything that makes you stronger is something you **find or earn**, and every one of them is visible on the map once found.

## 8. World structure

| Level of structure | In the game |
| --- | --- |
| The scholar's study | Main menu and hub between chapters; tablets on the desk are chapter select |
| Tablet | One chapter / one area of the world |
| Register (a line of text) | A horizontal band of play bounded by ruling lines; the basic level unit |
| Room | A screen-sized or slightly larger section of a register; the unit the camera locks to |

- **Moving between registers:** through breaks in the ruling lines, through broken edges, and up or down the tablet's sides. The ruling lines are solid floors and ceilings by default.
- **Map:** shaped like the tablet itself; rooms fill in as you explore, gates and found items are marked.
- **Camera:** smooth follow with look-ahead in the direction you face, locked to room bounds. The 640 × 360 frame should usually show one register with a sliver of the ones above and below.

## 9. Enemies and bosses (overview)

Every enemy telegraphs: a readable wind-up pose and a sound before each attack. Three archetypes are enough for the slice; the vertical slice spec will name them and draw them from the myths (Asag's stone warriors, demons, birds of Anzu).

| Type | Behaviour | Teaches |
| --- | --- | --- |
| Melee | Walks, closes in, heavy telegraphed swing | Spacing and parrying |
| Ranged | Keeps distance, throws or spits | Closing distance with the slide; parrying projectiles **[proposal]** |
| Flying | Swoops in arcs | Up-attacks and air attacks |
| Boss | Several phases; each phase adds or changes one attack | Everything above, under pressure |

## 10. Presentation

- **Resolution:** 640 × 360, whole-number scaled. Ninurta about 48 px tall.
- **Art:** pixel art in one ~32-colour palette from clay, bitumen, lapis, carnelian, gold, gypsum and storm blues and whites. Ninurta designed from the Nimrud relief (horned crown, braided beard, tasselled kilt, wings).
- **Text:** all speech appears first in cuneiform and resolves into English. Each speaker has a bubble style; Sharur's is the rudest.
- **Music:** lyre, frame drum, reed pipe and voice; exploration track with a combat layer that fades in.
- **Sharur's voice:** blips or AI voice acting (open; task B.5).

## 11. Scope of version 1 (the vertical slice)

**In:** the scholar's study and zoom; one tablet chapter of 8–12 rooms; run, jump and slide from the start, with wall jump unlocked midway; two sign-powers with their combat charge; three enemy types and a boss; cylinder-seal checkpoints; broken-tablet gaps and a small joining system (a few true joins, three or four loose fragments, a boss arena with two or three sockets); health upgrades; one boss trophy; saving; map; dialogue in cuneiform; music and sound; Windows build.

**Out for now:** glide, gamepad, more than one chapter, joins that rebuild whole registers, the trophy hub as a place you visit, achievements, languages other than English, Steam.

## 12. Decisions made in this document (2 Oct 2026)

- Ninurta starts with run, jump and a Blasphemous-style slide; wall jump is the slice's one movement unlock; glide waits for the full game.
- Sign-powers are invoked at sign zones and leave Sharur with a short combat charge.
- Keyboard layout: arrows to move, Z jump, X attack, C slide, V parry, S invoke, A heal.
- Checkpoints are cylinder seals; beaten bosses become trophies.
- No skipping boss phases on retry.
- Obverse/reverse is folded into broken tablets: two-faced fragments joined into sockets at seals, shaping boss arenas in the slice and possibly whole levels later.

## 13. Still open

- Slice chapter and boss, the scholar, title, script period: story bible (1.2) and slice spec (1.6).
- Which two sign-powers the slice uses, and the joining rules in detail: tablet mechanic spec (1.4).
- Where exactly the wall jump is found: slice spec (1.6).
- What the trophy hub is (Angim in Nippur is the candidate): story bible (1.2).
