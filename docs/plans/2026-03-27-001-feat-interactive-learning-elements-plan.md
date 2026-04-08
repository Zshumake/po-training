---
title: "feat: Interactive Learning Elements (Annotated Explorers, Checkpoints, Case Scenarios)"
type: feat
status: active
date: 2026-03-27
origin: docs/brainstorms/2026-03-27-interactive-learning-elements-requirements.md
---

# Interactive Learning Elements

## Overview

Add three new interactive content block types to the P&O Training app to break up text walls and maximize active learning: **Annotated Image Explorers** (tap hotspots on diagrams), **Inline Self-Test Checkpoints** (quick-check questions between sections), and **Clinical Case Scenarios** (step-through patient vignettes with decision points).

## Problem Statement / Motivation

Residents report the app feels too textbook-like despite collapsible sections, embedded videos, and existing interactive widgets. The core issue: passive reading doesn't build the pattern recognition needed for boards. Residents need to interact with anatomical diagrams, test themselves inline, and practice clinical decision-making — all without leaving the module they're studying. (see origin: docs/brainstorms/2026-03-27-interactive-learning-elements-requirements.md)

## Proposed Solution

Build three new `ContentBlock` subclasses following the established pattern (define model → add renderer case → create widget → populate content files). Each block type is a self-contained widget that works within the existing collapsible section / tab / board-only infrastructure.

### Architecture Pattern (existing, reuse exactly)

```
1. Define block class in topic_content_model.dart
2. Add `if (block is XBlock)` case in topic_content_view.dart:_buildBlock()
3. Create widget in lib/features/learning/widgets/
4. Add block instances to module content .dart files
```

## Technical Approach

### Phase 1: Annotated Image Explorer

**New model** in `topic_content_model.dart`:
```dart
class HotspotData {
  final String id;
  final double xPercent;  // 0.0-1.0 relative to image
  final double yPercent;
  final String label;
  final String description;
  final String? clinicalSignificance;
  final Color pinColor;  // green for tolerant, red for sensitive, teal default
}

class AnnotatedImageBlock extends ContentBlock {
  final String title;
  final String imagePath;  // asset path or 'canvas:socket-ptb' for canvas-drawn
  final List<HotspotData> hotspots;
  final double aspectRatio;
}
```

**Widget** `lib/features/learning/widgets/annotated_image_explorer.dart`:
- `CustomPainter` draws the diagram (socket cross-sections, gait figures) OR loads an asset image
- Numbered pin overlays at hotspot coordinates using `Stack` + `Positioned`
- Tap pin → animated tooltip card slides in (only one visible at a time)
- Pinch-to-zoom via `InteractiveViewer` wrapper
- Pin colors distinguish categories (green = pressure-tolerant, red = pressure-sensitive)

**Canvas-drawn diagrams** (no external images needed):
- `SocketDiagramPainter` — anterior/posterior TT residual limb outline with labeled zones
- `GaitFigurePainter` — stick figure in side view showing limb positions
- Simple geometric shapes with labeled anatomical landmarks

**Priority content to populate** (R5):

| Module | Explorer | Hotspots |
|--------|----------|----------|
| Transtibial | PTB socket pressure areas | 7 tolerant (green) + 8 sensitive (red) |
| Transfemoral | Quad vs IRC socket comparison | 6 features each |
| Prosthetic Components | Prosthetic foot types | 5 foot types with mechanism labels |
| Gait Analysis | Normal vs Trendelenburg | Body segments with deviation markers |
| LE Orthoses | AFO types overlay | 4 AFO types with biomechanical effect labels |

**Tasks:**
- [ ] Add `HotspotData` and `AnnotatedImageBlock` to `topic_content_model.dart`
- [ ] Add renderer case in `topic_content_view.dart`
- [ ] Create `annotated_image_explorer.dart` widget with `InteractiveViewer` + `Stack` + `Positioned` pins
- [ ] Create `SocketDiagramPainter` for TT pressure areas (canvas-drawn)
- [ ] Create `GaitFigurePainter` for side-view stick figures (canvas-drawn)
- [ ] Populate 5 annotated images across priority modules
- [ ] Verify pinch-to-zoom works on web and mobile

### Phase 2: Inline Self-Test Checkpoints

**New model** in `topic_content_model.dart`:
```dart
class CheckpointBlock extends ContentBlock {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
}
```

**Widget** `lib/features/learning/widgets/checkpoint_widget.dart`:
- Card with question text + 4 tappable option tiles
- Single tap immediately reveals result (no submit button — R8)
- Correct: green highlight on selected + checkmark
- Incorrect: red highlight on selected + green highlight on correct + explanation
- After answering, card stays in answered state (no retry needed)
- Unscored, no tracking (R10)
- Styled distinctly from quiz: blue-gray card with "Check Your Understanding" header

**Content target:** 2-3 checkpoints per tab across all 14 modules (~80-100 total checkpoints)

**Tasks:**
- [ ] Add `CheckpointBlock` to `topic_content_model.dart`
- [ ] Add renderer case in `topic_content_view.dart`
- [ ] Create `checkpoint_widget.dart` with tap-to-reveal interaction
- [ ] Write checkpoint questions for Tier 1 modules first (fundamentals, TT, TF, gait, LE orthoses)
- [ ] Write checkpoint questions for remaining modules
- [ ] Add `CheckpointBlock` to `_isBoardBlock()` predicate so checkpoints show in board-only mode

### Phase 3: Clinical Case Scenarios

**New model** in `topic_content_model.dart`:
```dart
class CaseDecisionPoint {
  final String prompt;
  final List<String> options;
  final int optimalIndex;
  final String explanation;
}

class CaseScenarioBlock extends ContentBlock {
  final String title;
  final String vignette;  // patient presentation
  final List<CaseDecisionPoint> decisionPoints;  // 2-3 sequential decisions
  final String summaryPearl;
}
```

**Widget** `lib/features/learning/widgets/case_scenario_widget.dart`:
- Card with patient vignette at top (always visible)
- Decision points revealed sequentially (R13) — `PageView` or animated reveal
- Each decision: select option → see outcome → advance to next
- Final screen: summary table (your choice vs optimal) + clinical pearl (R16)
- "Reset Case" button to try again
- Styled with stethoscope icon, clinical blue-green gradient header

**Content target:** 1-2 cases per module for high-yield topics (~20-25 total cases)

**Priority scenarios** (R17):
- TT prosthetic prescription for diabetic K2 patient
- TF socket selection for young traumatic amputee
- AFO selection for stroke patient with foot drop
- Cervical orthosis selection for C5 fracture
- Gait deviation identification from clinical description
- UE orthosis for radial nerve palsy
- Pediatric prosthetic fitting timeline decisions
- Energy expenditure counseling for bilateral TT

**Tasks:**
- [ ] Add `CaseDecisionPoint` and `CaseScenarioBlock` to `topic_content_model.dart`
- [ ] Add renderer case in `topic_content_view.dart`
- [ ] Create `case_scenario_widget.dart` with sequential reveal + summary
- [ ] Write case scenarios for Tier 1 topics (8 priority scenarios above)
- [ ] Write case scenarios for remaining modules
- [ ] Add `CaseScenarioBlock` to `_isBoardBlock()` predicate

### Phase 4: Content Population (Parallel)

Populate all three block types across all 14 modules using parallel agents, each handling a group of modules:

| Agent | Modules | Explorers | Checkpoints | Cases |
|-------|---------|-----------|-------------|-------|
| 1 | Fundamentals, Gait Analysis | 2 | 6 | 3 |
| 2 | Transtibial, Transfemoral | 2 | 6 | 4 |
| 3 | LE Orthoses, Spinal Orthoses | 2 | 6 | 3 |
| 4 | UE Orthoses, UE Prosthetics | 1 | 6 | 3 |
| 5 | Prosthetic Components, Materials | 2 | 4 | 2 |
| 6 | Pediatric, Special Pops, Amputation Rehab, Advanced Tech | 1 | 8 | 5 |

## Acceptance Criteria

- [ ] Every module has at least one interactive element beyond text/tables (R per origin)
- [ ] Annotated image explorers cover all 7 pressure-tolerant and 8 pressure-sensitive TT socket areas
- [ ] Self-test checkpoints require single tap with immediate feedback (no submit button)
- [ ] Case scenarios present decision points sequentially, not all at once
- [ ] All new block types work with existing board-only toggle
- [ ] All new block types work within collapsible sections
- [ ] Pinch-to-zoom works on annotated images (web and mobile)
- [ ] `flutter analyze` passes with zero issues after all changes

## Success Metrics

- A resident encounters an interactive element within 2-3 scroll lengths of any tab
- Socket pressure area explorer covers all 15 areas from Cuccurullo reference
- 80+ checkpoint questions across all modules
- 20+ clinical case scenarios across high-yield topics

## Dependencies & Risks

- **Canvas-drawn diagrams** are simpler to implement than sourcing medical images (no licensing), but require more dev effort upfront. Deferred to planning: exact rendering approach per diagram.
- **Content volume** is the main bottleneck — ~100 checkpoints + ~25 cases + ~10 explorers is significant authoring work. Mitigated by parallel agent authoring.
- **No external dependencies needed** — all widgets use core Flutter (CustomPainter, InteractiveViewer, AnimationController, PageView).

## Sources & References

- **Origin document:** [docs/brainstorms/2026-03-27-interactive-learning-elements-requirements.md](docs/brainstorms/2026-03-27-interactive-learning-elements-requirements.md) — Key decisions: hotspot tap-to-reveal interaction, canvas-drawn diagrams, unscored checkpoints, linear case scenario reveal
- **Existing widget patterns:** `lib/features/learning/widgets/gait_cycle_widget.dart` (AnimationController + phase selection), `lib/features/learning/widgets/prescription_builder_widget.dart` (nested selectors + data display)
- **Block model:** `lib/data/models/topic_content_model.dart` (lines 1-225)
- **Renderer:** `lib/features/learning/topic_content_view.dart` (lines 300-327, _buildBlock method)
- **UI ideation:** `docs/ideation/2026-03-23-ui-overhaul-ideation.md` (#2 Visual Learning ranked 90% confidence)
