---
date: 2026-03-27
topic: interactive-learning-elements
---

# Interactive Learning Elements

## Problem Frame
PM&R residents using the P&O Training app encounter walls of text in content modules. Even with collapsible sections, embedded videos, and the gait cycle widget, the learning experience still feels too passive and textbook-like. Residents need to *see* prosthetic components, *interact* with anatomical diagrams, and *test themselves* inline to actually retain board-level material. The goal is to make every module feel like an interactive learning session, not a reading assignment.

## Requirements

### Annotated Image Explorers
- R1. Build a reusable `AnnotatedImageExplorer` content block that displays an image with numbered hotspot pins overlaid at specific coordinates
- R2. Tapping a hotspot pin reveals a tooltip/card showing: label, description, and clinical significance
- R3. Only one tooltip is visible at a time (tapping a new pin closes the previous)
- R4. Image must support pinch-to-zoom on mobile and scroll-zoom on web
- R5. Populate annotated explorers for three priority content areas:
  - **Socket pressure areas**: PTB/TSB cross-section with pressure-tolerant (green pins) and pressure-sensitive (red pins) areas labeled
  - **Prosthetic components**: Exploded/labeled views of prosthetic feet types, knee units, suspension systems
  - **Gait deviations**: Side-view figures showing normal vs. abnormal gait patterns with hotspots on the deviation (e.g., lateral trunk bend, vaulting, circumduction)

### Inline Self-Test Checkpoints
- R6. Build a `CheckpointBlock` content block that presents 1-2 quick-check questions embedded between content sections
- R7. Questions show as a styled card with the question text and 3-4 answer options
- R8. Tapping an answer immediately reveals whether it's correct with a brief explanation (no "submit" button needed)
- R9. Correct answers show green highlight; incorrect show red with the correct answer highlighted
- R10. Checkpoints are NOT scored or tracked — they are pure learning aids with zero pressure
- R11. Place checkpoints after key teaching sections in every module (target: 2-3 per tab)

### Clinical Case Scenarios
- R12. Build a `CaseScenarioBlock` content block that presents a short clinical vignette with a step-through interaction
- R13. Each scenario has 2-3 decision points presented sequentially (not all at once)
- R14. At each decision point, the resident selects from 3-4 options
- R15. After selecting, the scenario reveals the outcome of that choice and advances to the next decision point
- R16. Final screen shows a summary: what they chose, what was optimal, and a clinical pearl explaining why
- R17. Scenarios cover high-yield board topics: prosthetic prescription for a given patient profile, AFO selection for a given diagnosis, identifying gait deviations from a description

## Success Criteria
- Every content module has at least one interactive element beyond text/tables (explorer, checkpoint, or scenario)
- A resident can go through a module tab and encounter an interactive element within the first 2-3 scroll lengths
- Socket pressure areas explorer covers all 7 pressure-tolerant and 8 pressure-sensitive areas from the reference text
- Self-test checkpoints are low-friction (tap answer, see result, move on — no navigation required)

## Scope Boundaries
- No user accounts or progress persistence — all interactions are session-only
- No AI-generated questions — all checkpoint and scenario content is hand-authored in Dart data files
- No external image hosting — images are either SVG/Canvas-drawn or bundled assets
- No drag-and-drop interactions in this round (future enhancement)
- No scoring or gamification — these are learning aids, not assessments

## Key Decisions
- **Hotspot tap-to-reveal** over layer toggles or quiz mode: simpler interaction, lower cognitive load, works well on mobile
- **Canvas-drawn diagrams** over photos: we can programmatically place hotspots without needing actual medical photography (which has licensing issues)
- **Inline checkpoints are unscored**: removing pressure maximizes willingness to engage; the quiz feature handles scored assessment

## Outstanding Questions

### Deferred to Planning
- [Affects R1][Technical] Best approach for canvas-drawn anatomical diagrams vs. SVG assets vs. simple shape illustrations
- [Affects R5][Needs research] Minimum set of annotated images needed per module for meaningful coverage
- [Affects R12][Technical] Whether case scenarios should support branching paths or linear reveal only

## Next Steps
-> /ce:plan for structured implementation planning
