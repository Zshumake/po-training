---
date: 2026-03-27
topic: interactive-learning-modalities
focus: non-reading, non-quiz interactive learning avenues
---

# Ideation: Interactive Learning Modalities Beyond Reading & Quizzes

## Codebase Context
Flutter web/mobile P&O Training app with 14 modules. Already has: embedded YouTube videos, interactive gait cycle widget, prosthetic prescription builder, annotated image explorers (canvas-drawn with hotspots), checkpoint questions, clinical case scenarios, flashcards, quizzes, collapsible sections, board-only toggle. Dark surgical theme. Session-only state (no persistence yet).

## Ranked Ideas

### 1. Visual Flowchart Decision Trees
**Description:** Interactive decision tree diagrams for key clinical algorithms — AFO selection, prosthetic foot by K-level, cervical orthosis by fracture level. Tap through decision nodes to reach the answer.
**Rationale:** Board questions are structured as decision trees. Flowcharts encode the logic visually rather than as text.
**Downsides:** Each flowchart needs custom authoring. Canvas rendering complexity.
**Confidence:** 90%
**Complexity:** Medium
**Status:** Selected for implementation

### 2. Spaced Repetition "Daily Board Bite"
**Description:** Daily notification with one high-yield board concept using spaced repetition logic. Resurfaces concepts the resident got wrong or hasn't seen recently.
**Rationale:** Distributed practice is the #1 evidence-based study strategy.
**Downsides:** Requires local persistence (Hive/SharedPreferences). Notification setup per platform.
**Confidence:** 82%
**Complexity:** Medium
**Status:** Selected for implementation

### 3. Comparison Mode (Side-by-Side Split Screen)
**Description:** "Compare" feature showing two topics side-by-side — PTB vs TSB, Quad vs IRC, body-powered vs myoelectric.
**Rationale:** Board questions test differentiation. Side-by-side viewing makes differences pop.
**Downsides:** Complex on narrow mobile screens. Works best on tablet/web.
**Confidence:** 75%
**Complexity:** Medium
**Status:** Selected for implementation

### 4. "Spot the Deviation" Gait Analysis Game
**Description:** Video clips or animated stick figures showing gait patterns. Resident identifies which deviation is present.
**Rationale:** Pattern recognition requires seeing the deviation — can't learn gait from text alone.
**Downsides:** Need curated video clips or sophisticated animation.
**Confidence:** 92%
**Complexity:** High
**Status:** Unexplored

### 5. Audio Narration Toggle (TTS)
**Description:** "Listen" button on each section that reads content aloud via device TTS.
**Rationale:** Transforms dead time (commuting) into study time. No content authoring needed.
**Downsides:** TTS quality varies. Medical terminology pronunciation may be poor.
**Confidence:** 88%
**Complexity:** Low
**Status:** Unexplored

### 6. Board Review "Speed Round" Timer Mode
**Description:** Timed quiz — 60 seconds per question, 20 questions. Mimics board exam time pressure.
**Rationale:** Builds exam stamina. Identifies weak spots (slow questions = gaps).
**Downsides:** May increase anxiety.
**Confidence:** 85%
**Complexity:** Low
**Status:** Unexplored

### 7. "Explain It Back" Voice Recording
**Description:** Record yourself explaining a concept. Replay later for self-assessment.
**Rationale:** Generation effect — explaining in your own words is strongest active recall.
**Downsides:** Requires microphone. Some may find it awkward.
**Confidence:** 70%
**Complexity:** Medium
**Status:** Unexplored

## Rejection Summary

| # | Idea | Reason Rejected |
|---|------|-----------------|
| 1 | AR overlay for prosthetic components | Too expensive, niche hardware |
| 2 | AI-powered study plan generator | Requires backend/API |
| 3 | Collaborative study rooms | Requires networking, accounts |
| 4 | Haptic feedback for pressure areas | Not supported on web |
| 5 | 3D rotating prosthetic models | WebGL complexity, marginal over annotated diagrams |
| 6 | Crossword/word search puzzles | Low educational value, feels juvenile |
| 7 | Mind map generator | Duplicates collapsible sections |

## Session Log
- 2026-03-27: Initial ideation — 14 candidates generated, 7 survived. User selected #1 (Flowcharts), #2 (Spaced Rep), #3 (Comparison Mode) for implementation.
