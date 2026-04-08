---
date: 2026-03-23
topic: ui-overhaul-interactivity
focus: Fix unreadable colors, break up text walls, add visual/interactive learning (images, videos, charts, diagrams)
---

# Ideation: P&O Training App UI Overhaul

## Codebase Context

- **Framework:** Flutter (Dart), dark theme ("Surgical Precision"), Material 3
- **Content system:** 14 module content files using block types (HeaderBlock, TextBlock, PearlBlock, BulletCardBlock, TableBlock, ComparisonCardBlock, MnemonicBlock, ScaleBlock, MedicationCardBlock, NumberedListBlock, CustomWidgetBlock)
- **Rendering:** `TopicContentView` renders blocks as a flat ListView — pure vertical scroll of text
- **Critical pain points:**
  1. BulletCardBlock uses light backgrounds (e.g., `Color(0xFFE3F2FD)`) on a dark theme — text becomes invisible
  2. ComparisonCardBlock same issue — bright backgrounds with hard-to-read text
  3. No ImageBlock, VideoBlock, or DiagramBlock in the content model
  4. No interactivity — every block is static text
  5. CustomWidgetBlock exists in model but is never rendered (not handled in `_buildBlock()`)
  6. Tables require horizontal scrolling — hard to read on mobile
  7. No collapsible/expandable sections — walls of text with no hierarchy control
  8. No progress tracking or spaced repetition
  9. No search functionality across content

## Ranked Ideas

### 1. Fix Color System: Dark-Theme-Safe Block Rendering
**Description:** Replace all hardcoded light `backgroundColor` values in BulletCardBlock and ComparisonCardBlock with dark-theme-compatible colors. Create a `BlockColorScheme` utility that maps theme colors to proper dark backgrounds (e.g., `Colors.blue` -> `Color(0xFF1A2332)` instead of `Color(0xFFE3F2FD)`). Audit all 14 content files.
**Rationale:** This is the #1 usability blocker. Users literally cannot read content. Every other improvement is moot if text is invisible.
**Downsides:** Requires touching all 14 content files or building an auto-mapping layer.
**Confidence:** 95%
**Complexity:** Low
**Status:** Unexplored

### 2. Visual Learning: Image & Diagram Content Blocks
**Description:** Add `ImageBlock` and `AnnotatedImageBlock` to the content model. Create an `assets/images/po/` directory organized by module. Add prosthetic device photos, socket diagrams, gait phase illustrations, anatomical overlays, and orthosis type images. For gait analysis, create animated SVG/Lottie gait cycle diagrams showing each phase.
**Rationale:** P&O is inherently visual — you can't learn what a PTB socket or C-Leg looks like from text. Residents need to recognize devices on sight. This is the gap between "study guide" and "actually useful training tool."
**Downsides:** Image assets need sourcing (Creative Commons medical images, custom illustrations, or AI-generated). Storage size increases. Need to be careful about copyright.
**Confidence:** 90%
**Complexity:** High
**Status:** Unexplored

### 3. Gait Video Integration
**Description:** Add `VideoBlock` to the content model with embedded video player. Curate YouTube/Vimeo links to clinical gait videos (Trendelenburg, steppage, circumduction, prosthetic gait deviations). Build a `VideoPlayerWidget` that plays inline with content. Include slow-motion replay and annotation overlays marking key observations.
**Rationale:** "You can't explain a gait — you have to watch it." This is the single most impactful change for the gait analysis modules. Board questions describe gait patterns; residents must recognize them visually.
**Downsides:** Video hosting/streaming adds complexity. YouTube links may break. Offline mode needs video caching. Copyright concerns for clinical videos.
**Confidence:** 85%
**Complexity:** High
**Status:** Unexplored

### 4. Collapsible Content Sections with Visual Hierarchy
**Description:** Replace flat ListView with expandable/collapsible sections. HeaderBlocks become section dividers that expand to reveal their content blocks. Add a "Board Essentials" toggle that shows only PearlBlocks and key tables, hiding detailed text. Implement a mini table-of-contents sidebar or floating navigation.
**Rationale:** Current layout is a wall of text. Users can't scan, can't find specific info, can't focus on high-yield content. Collapsible sections let users drill into what they need.
**Downsides:** Changes the fundamental content rendering model. Need to group blocks under headers programmatically.
**Confidence:** 88%
**Complexity:** Medium
**Status:** Unexplored

### 5. Interactive Gait Cycle Diagram
**Description:** Implement the `CustomWidgetBlock.gaitDeviationAnalyzer` and `CustomWidgetBlock.gaitCyclePhase` types. Build an interactive gait cycle widget where users tap each phase (IC, LR, MSt, TSt, PSw, ISw, MSw, TSw) to see muscle activity, joint angles, GRF, and common deviations for that phase. Animate a walking figure across the cycle.
**Rationale:** The gait cycle is THE most tested P&O topic. An interactive diagram connecting phases -> muscles -> deviations -> causes is worth more than 10 pages of text tables.
**Downsides:** Complex Flutter animation work. Custom painter or Rive/Lottie animations needed.
**Confidence:** 82%
**Complexity:** High
**Status:** Unexplored

### 6. Interactive Prosthetic Component Selector
**Description:** Build the `CustomWidgetBlock.socketSelectionGuide`, `kLevelClassifier`, and `prostheticFeetComparison` widgets. Create a "Prosthetic Prescription Builder" where users select amputation level -> K-level -> and the app recommends socket, suspension, foot, and knee options with images of each. Include a comparison mode.
**Rationale:** This turns passive reading into active clinical reasoning practice. Residents prescribe prosthetics — the app should simulate that workflow.
**Downsides:** Complex UI. Needs prosthetic component images. Logic for recommendations.
**Confidence:** 78%
**Complexity:** High
**Status:** Unexplored

### 7. Responsive Table Redesign
**Description:** Replace `DataTable` with custom card-based table rendering for mobile. Wide tables become scrollable cards with column headers pinned. Add zebra striping, row highlighting on tap, and the ability to tap a row for expanded detail. For comparison tables (PTB vs TSB, Quad vs IRC), use side-by-side card layouts instead of table rows.
**Rationale:** Current tables are unusable on phone screens — horizontal scroll with tiny text. Tables are the most information-dense blocks and the most broken.
**Downsides:** Custom table widget is non-trivial. Need to handle varying column counts.
**Confidence:** 85%
**Complexity:** Medium
**Status:** Unexplored

## Rejection Summary

| # | Idea | Reason Rejected |
|---|------|-----------------|
| 1 | Full 3D prosthetic models | Too expensive for the value; images suffice for board prep |
| 2 | AI-powered gait analysis from camera | Scope creep; separate product, not a study tool feature |
| 3 | Social features / study groups | Not aligned with core purpose; adds complexity |
| 4 | Dark mode / light mode toggle | Already dark; light mode is a nice-to-have, not a fix |
| 5 | Gamification / XP points | Superficial engagement vs actual learning improvement |
| 6 | Voice narration of content | NotebookLM already handles this via podcasts |
| 7 | AR prosthetic overlay | Cool but impractical for board study |
| 8 | Spaced repetition engine | Already have flashcards; full SRS is a separate effort |

## Session Log
- 2026-03-23: Initial ideation — 15 generated, 7 survived. Focus: readability fixes, visual/interactive learning, breaking text walls.
