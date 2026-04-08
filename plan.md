# P&O (Prosthetics & Orthotics) Training App - Implementation Plan

## Enhancement Summary

**Deepened on:** 2026-03-21
**Research agents used:** Flutter Expert, PM&R Board Content Researcher, UI/UX Designer, Spec Flow Analyzer, Architecture Strategist, Best Practices Researcher

### Key Improvements
1. Audio assets must be AAC/M4A (not WAV) — 94% size reduction (175MB → ~11MB)
2. Content gaps identified: shoe modifications, partial foot amputations, suspension systems, pressure-tolerant/sensitive anatomy, functional outcome measures need explicit coverage
3. Sealed classes for ContentBlock (Dart 3 exhaustive switch) + extracted block widgets for maintainability
4. Quiz flow gaps resolved: post-results actions, mid-quiz abandonment, module-specific quizzes, difficulty filtering
5. Flashcard "Needs Work" cards re-appended to session queue for reinforcement
6. Podcast player needs dedicated StatefulWidget with proper dispose() lifecycle
7. 10 essential board-review tables identified that must be included

### New Considerations Discovered
- AudioPlayer resource leak in existing apps (create on tap, never dispose) — fix in P&O
- Module colors should use `List<Color>` indexed by module position, not 14 named constants
- Content block widgets should be split into separate files (reduces TopicContentView from 527 to ~40 lines)
- Consolidate all models into `lib/data/models/` (existing apps split between core/models and data/models)
- `ThemeExtension` is the official Material 3 approach for 14+ custom colors

---

## Overview

Build a Flutter-based P&O Training application following the identical architecture as the existing TBI, SCI, and CVA Training modules. The app serves as a board-review and rotation training tool for PM&R residents and fellows.

## Architecture (match existing pattern exactly)

- **Framework:** Flutter with Material Design 3
- **Dependencies:** just_audio ^0.9.36, url_launcher ^6.3.1, cupertino_icons ^1.0.8
- **Directory structure:** lib/core/, lib/data/, lib/features/learning/
- **Models:** QuizQuestion, ModuleModel, Flashcard, PodcastEpisode, TopicData/ContentBlock system
- **Widgets:** QuizSessionView, ContentCard, FlashcardView, TopicContentView
- **Theme:** Clinical color palette with module-specific colors

### Research Insights: Architecture

**Continue the exact pattern for P&O. Do not extract a shared package yet.**
- Four apps is the inflection point where extraction becomes justified, but P&O should not be the vehicle for that refactor. Ship P&O using the proven pattern, then extract `medical_training_core` as a separate effort afterward.
- Each app can be modified independently without coordination overhead. A shared package creates coupling that a small team should avoid during active development.

**Low-risk improvements to adopt in P&O:**

1. **Sealed classes for ContentBlock (Dart 3):**
```dart
// Instead of abstract class with open hierarchy:
sealed class ContentBlock { }
class HeaderBlock extends ContentBlock { ... }
class PearlBlock extends ContentBlock { ... }
// Compiler enforces exhaustive switch — catches missing cases at compile time
```

2. **Consolidate models into `lib/data/models/`** — the existing apps split QuizQuestion into `core/models/` and other models into `data/models/`. Put everything in `data/models/`.

3. **Use `const` constructors for all data objects** — allows Dart to canonicalize objects at compile time, reducing runtime memory allocation across 14 modules of content.

4. **Extract content block widgets into separate files:**
```
lib/core/widgets/content_blocks/
├── header_block_widget.dart
├── pearl_block_widget.dart
├── table_block_widget.dart
├── bullet_card_block_widget.dart
├── comparison_card_block_widget.dart
├── mnemonic_block_widget.dart
├── medication_card_block_widget.dart
├── scale_block_widget.dart
└── content_block_registry.dart  ← maps Type → Widget builder
```
This reduces TopicContentView from ~527 lines to ~40 lines. Each block is independently testable. Adding a new P&O-specific block (e.g., `GaitDeviationBlock`) requires one new file + one registry entry.

5. **Do NOT add Riverpod/Provider/Bloc.** The app has exactly three pieces of mutable state (quiz session, flashcard session, audio player), all widget-local and ephemeral. StatefulWidget is correct.

6. **Module colors as indexed List:**
```dart
static const List<Color> moduleColors = [
  Color(0xFF3B82F6), // Fundamentals
  Color(0xFF8B5CF6), // LE Orthoses
  // ... 12 more
];
// Access: AppTheme.moduleColors[module.colorIndex]
```

## Source Material

Two PDFs available in the P&O Training directory:
- Cuccurullo Prosthetics and Orthotics chapter.pdf
- DeLisas Physical Medicine and Rehabilitation Principles and Practice, 6th Edition P&O.pdf

---

## P&O Content Modules (14 modules, board-review level, PM&R focused)

### Research Insights: Board Content Priority

**Tier 1 — Most Frequently Tested (ensure maximum depth):**
1. Prosthetic gait deviations (transtibial AND transfemoral) — causes, prosthetic vs patient
2. AFO types and biomechanics — indications/contraindications for each
3. Energy expenditure by amputation level — classic percentages
4. K-level system — definitions and prosthetic component eligibility
5. Cervical orthosis motion restriction hierarchy
6. Socket designs — PTB vs TSB, quadrilateral vs ischial containment
7. Body-powered vs myoelectric prosthetics

**Tier 2 — Commonly Tested:**
8. Spinal orthosis indications by fracture level
9. Amputation levels and nomenclature (Chopart, Lisfranc, Symes)
10. Normal gait cycle phases and muscle activation
11. Prosthetic feet types comparison
12. Suspension systems
13. UE orthoses by nerve injury (radial, ulnar, median)

**Content Gaps to Address (not in original plan):**
- Shoe modifications and therapeutic footwear — frequently tested, needs explicit home in Module 2
- Partial foot amputations (Chopart, Lisfranc, transmetatarsal, Symes) — add to Module 5 or 6
- Prosthetic suspension systems — deserves dedicated subsection in Modules 6 and 7
- Pressure-tolerant and pressure-sensitive anatomy — critical for socket design questions
- Functional outcome measures (AMP, 6MWT, TUG, Houghton Scale, L-Test) — add to Module 13
- Normal gait cycle fundamentals — ensure Module 9 covers normal BEFORE deviations

---

### Module 1: P&O Fundamentals
- Terminology and definitions
- Biomechanical principles (lever arms, moments, ground reaction forces)
- Normal gait cycle phases (stance: heel strike, foot flat, midstance, heel off, toe off; swing: acceleration, midswing, deceleration)
- Gait parameters (cadence, step length, stride length, velocity)
- Prescription principles and team approach

### Module 2: Lower Extremity Orthoses
- AFO types: solid ankle, articulated, posterior leaf spring, ground reaction (floor reaction)
- AFO biomechanics and indications
- KAFO: stance control, drop-lock, offset knee joints
- HKAFO and RGO for paraplegia
- **Shoe modifications: rocker bottom, metatarsal bar, Thomas heel, SACH heel, heel/sole wedges, lifts** *(expanded — high yield)*
- Foot orthoses: UCBL, custom molded, metatarsal pads

**Board Pearl:** FRO creates knee extension moment, requires intact quads. Indicated for crouch gait (CP, myelomeningocele). Contraindicated if knee recurvatum.

### Module 3: Upper Extremity Orthoses
- Wrist-hand orthoses (WHO): resting hand, functional position, tenodesis
- Static vs dynamic splinting principles
- **UE orthoses by nerve injury** *(high yield):*
  - Radial nerve palsy → wrist drop splint (dorsal wrist cock-up)
  - Ulnar nerve palsy → anti-claw splint (MCP flexion block)
  - Median nerve palsy → opponens splint
  - Combined high median-ulnar → functional position splint
- Elbow orthoses: hinged, turnbuckle
- Shoulder orthoses: airplane splint, gunslinger
- SCI-specific upper extremity orthoses by level
- Fracture bracing

### Module 4: Spinal Orthoses
- Cervical orthoses: soft collar, Philadelphia, Miami J, Aspen, SOMI, halo vest
- **Cervical orthosis motion restriction comparison table** *(highest-yield table in P&O)*
- Thoracolumbar orthoses: TLSO (Jewett, CASH, custom molded), LSO (Knight, chair-back, Williams)
- Sacroiliac orthoses
- Indications by fracture type and level

**Board Pearl:** SOMI provides best flexion control (93%) but poor extension (42%). Halo is gold standard overall, especially upper C-spine. TLSO covers T6 to L3-4; above T6 not adequately managed by TLSO.

**Board Pearl:** Williams Flexion LSO limits extension — indicated for spondylolisthesis, lumbar stenosis, facet arthropathy.

### Module 5: Prosthetic Components
- Prosthetic feet: SACH, single-axis, multi-axis, dynamic response/energy-storing
- Prosthetic ankles and rotators
- Prosthetic knees: single-axis, polycentric, hydraulic, pneumatic, microprocessor
- Socket designs: PTB, TSB, ischial containment, quadrilateral
- Suspension systems: sleeve, pin-lock, suction, vacuum, anatomic
- **Partial foot prosthetics: Chopart, Lisfranc, transmetatarsal, Symes** *(added — commonly tested)*

**Board Pearl:** Symes amputation preserves heel pad for distal weight-bearing, longer lever arm than transtibial, but bulbous distal end creates fitting challenges.

### Module 6: Transtibial Prosthetics
- Residual limb assessment and shaping
- Socket design: PTB (patellar tendon bearing), TSB (total surface bearing)
- **Pressure-tolerant areas:** patellar tendon, medial tibial flare, lateral shaft of fibula, popliteal fossa *(board favorite)*
- **Pressure-sensitive areas:** fibular head, tibial crest, tibial condyles, distal tibia *(board favorite)*
- Alignment: bench, static, dynamic
- Liner selection (silicone, gel, pelite)
- **Suspension systems for TT:** pin-lock, sleeve, suction, supracondylar *(expanded)*
- Common gait deviations and causes

### Module 7: Transfemoral Prosthetics
- Socket design: quadrilateral vs ischial containment (IRC/narrow ML)
- **Pressure-tolerant and pressure-sensitive areas** *(explicitly called out)*
- Knee unit selection by activity level
- Alignment principles
- Hip disarticulation and hemipelvectomy prosthetics
- **Suspension systems for TF:** suction, silesian belt, hip joint/pelvic band *(expanded)*
- Common gait deviations and causes

**Board Pearl:** Ischial containment socket captures ischial tuberosity within socket — better ML stability and femoral adduction control vs quadrilateral.

**Board Pearl:** Lateral trunk bending toward prosthetic side is the most common TF gait deviation (weak hip abductors or prosthesis too short).

### Module 8: Upper Extremity Prosthetics
- Body-powered prosthetics: cable systems, terminal devices (hook vs hand)
- Myoelectric prosthetics: electrode placement, signal processing
- Hybrid systems
- Terminal devices: voluntary opening vs voluntary closing
- Partial hand prosthetics
- Activity-specific prosthetics

**Board Pearl:** VO hooks open with cable pull, close with rubber bands (most common body-powered). VC hooks close with cable pull (better proprioception). Body-powered offers better feedback/durability; myoelectric offers better cosmesis.

### Module 9: Gait Analysis & Deviations
- **Normal gait cycle review** *(must come first — foundation for deviations)*
- Prosthetic gait deviations: lateral trunk bending, vaulting, circumduction, abducted gait, uneven step length, terminal impact, medial/lateral whip
- **Two separate gait deviation tables:** TT deviations and TF deviations, each with columns: deviation, prosthetic cause, patient cause, phase of gait *(highest-yield tables)*
- Orthotic gait deviations
- Instrumented gait analysis basics
- **Energy expenditure by amputation level table** *(classic board content):*
  - Traumatic TT: ~25% increase
  - Vascular TT: ~40% increase
  - Traumatic TF: ~68% increase
  - Vascular TF: ~100% increase
  - Bilateral TF: >200% increase

**Board Pearl:** "The higher the level, the higher the energy cost." Vascular etiology always costs more than traumatic at the same level.

### Module 10: Materials & Fabrication
- Thermoplastics: low-temperature vs high-temperature
- Thermosets and laminates
- Carbon fiber and composites
- Metals: steel, aluminum, titanium
- Casting and measurement techniques
- CAD/CAM and 3D printing in P&O

### Module 11: Pediatric P&O
- Congenital limb deficiencies: classification (transverse vs longitudinal)
- Terminal vs intercalary deficiencies
- Growth considerations in prosthetic design
- **Prosthetic fitting milestones:** UE at 6 months (sitting), LE when pulling to stand (9-12 months) *(board favorite)*
- Common pediatric orthoses (Pavlik harness, Denis Browne bar)
- Scoliosis bracing (Milwaukee, Boston, Charleston)
- **Terminal bony overgrowth** in children — may require surgical revision *(commonly tested)*

### Module 12: Advanced/Microprocessor Technology
- Microprocessor knees: C-Leg, Genium, Rheo Knee
- Powered prosthetics: powered ankle, powered knee
- Osseointegration
- Targeted muscle reinnervation (TMR)
- Pattern recognition myoelectric control
- Implantable myoelectric sensors

### Module 13: Amputation Surgery & Rehabilitation
- Amputation levels and nomenclature
- Surgical principles: myodesis vs myoplasty
- Pre-prosthetic rehabilitation program
- Rigid vs soft dressings
- Phantom limb pain vs residual limb pain
- K-levels (Medicare Functional Classification Levels K0-K4)
- Prosthetic training and gait training
- **Functional outcome measures:** AMP, 6MWT, TUG, Houghton Scale, L-Test *(added — appears on boards)*

### Module 14: P&O in Special Populations
- Dysvascular/diabetic amputations
- Charcot foot and total contact casting
- Sports prosthetics and running blades
- Military/trauma amputations
- Bilateral amputations
- Geriatric considerations
- **Cancer-related amputations** *(added)*

---

## 10 Essential Board-Review Tables

These tables must be implemented as `TableBlock` content blocks:

1. **Cervical Orthosis Motion Restriction Comparison** — Soft collar through Halo, columns: Flexion %, Extension %, Lateral Bending %, Rotation %
2. **AFO Types Comparison** — Solid, PLS, Articulated, FRO; columns: Motion controlled, Indication, Contraindication, Key biomechanical effect
3. **Prosthetic Feet Comparison** — SACH through microprocessor; columns: Mechanism, K-level, Advantages, Disadvantages
4. **Socket Design Comparison** — TT (PTB vs TSB) and TF (Quad vs IRC) with pressure areas
5. **K-Level Classification Table** — K0-K4 definitions and component eligibility
6. **Energy Expenditure by Amputation Level** — Traumatic vs vascular at each level
7. **Transtibial Gait Deviations** — Deviation, prosthetic cause, patient cause, phase
8. **Transfemoral Gait Deviations** — Same format as TT table
9. **UE Orthosis by Nerve Injury** — Radial, ulnar, median, combined
10. **Body-Powered vs Myoelectric Comparison** — Weight, cost, durability, feedback, cosmesis, grip strength

---

## Features

### Board Review Quiz

- 75+ board-level multiple-choice questions
- Questions distributed across all 14 modules
- 3 difficulty levels: basic, intermediate, board
- Detailed explanations with clinical pearls
- Random 10-question quiz from home screen

#### Research Insights: Quiz Flow

**Post-results dialog must include:**
- "Back to Home" button (primary)
- "Try Again" button (secondary — generates new 10 random questions)
- "Review Missed" button (shows only incorrectly answered questions with explanations)

**Mid-quiz abandonment:**
- Back button/gesture triggers confirmation dialog: "Leave quiz? Your progress will be lost."
- Two options: "Leave" and "Continue Quiz"

**Question selection algorithm:**
- Default mix: 3 basic, 4 intermediate, 3 board-level questions per 10-question session
- Ensure at least 7 unique modules represented in each 10-question session
- No duplicate questions within a session

**Module-specific quizzes (add to plan):**
- From ModuleContentScreen, add a "Quiz This Module" button
- Filters quiz bank to questions tagged with that module's ID
- Same QuizSessionView, different question source

**Answer behavior:**
- First tap highlights selection (teal border), does NOT lock in
- "Submit" button or second tap on same option locks in the answer
- This prevents accidental taps from locking incorrect answers

### Flashcard Decks (4 decks)
1. P&O Fundamentals & Orthoses
2. Prosthetic Components & Design
3. Gait Analysis & Deviations
4. Amputation Rehab & Special Populations

#### Research Insights: Flashcard Flow

**"Needs Work" behavior:**
- Cards marked "Needs Work" are re-appended to the end of the current session queue
- User sees them again before session ends
- Session summary shows: X knew it, Y needed work (on first pass), Z total cards

**Card ordering:** Random shuffle at session start (not fixed order)

**Post-summary dialog:**
- "Back to Home" button
- "Replay Deck" button (re-shuffles and starts over)
- "Review Needs Work" button (replays only cards marked Needs Work)

**Mid-deck abandonment:** Same confirmation pattern as quiz

### Podcast Support (4 episodes)
1. Orthotic Principles Board Review
2. Prosthetic Components Board Review
3. Gait Analysis Board Review
4. Amputation Rehab Board Review

#### Research Insights: Podcast Implementation

**Critical: Convert WAV to AAC/M4A before bundling.**
```bash
ffmpeg -i input.wav -c:a aac -b:a 128k -movflags +faststart output.m4a
```
This reduces ~175MB of audio to ~11MB. AAC has native hardware decoding on iOS and Android.

**Dedicated PodcastPlayerScreen (fix AudioPlayer lifecycle leak):**
- Create a StatefulWidget with `AudioPlayer` in `initState()` and `dispose()` in `dispose()`
- Include: play/pause, seek bar, position/duration display, playback speed (1x, 1.25x, 1.5x, 2x)
- Audio stops when navigating away (simplest implementation — background audio requires `audio_service` package and is not worth the complexity for 4 episodes)

**`just_audio ^0.9.36` is the correct choice.** No better alternative exists. Only gotcha: on web, use `setUrl()` instead of `setAsset()`.

### Content Block Types (matching existing apps)
- HeaderBlock - Section titles
- TextBlock - Body paragraphs
- PearlBlock - Board pearls (amber highlight)
- BulletCardBlock - Key points with colored backgrounds
- TableBlock - Comparison/reference tables
- ComparisonCardBlock - Side-by-side comparisons (e.g., PTB vs TSB socket)
- NumberedListBlock - Step sequences
- MnemonicBlock - Memory aids
- MedicationCardBlock - Drug info (phantom pain meds, etc.)
- ScaleBlock - Assessment scales (K-levels, etc.)
- CustomWidgetBlock - Interactive tools (kLevelClassifier, socketSelectionGuide, gaitDeviationAnalyzer)

#### Research Insights: Content Block Visual Hierarchy

Each block type differentiated by three properties — left border color, icon, background tint:

| Block Type | Left Border | Icon | Background |
|---|---|---|---|
| Clinical Pearl | Amber #F59E0B | Lightbulb | Amber/5% |
| Mnemonic | Purple #8B5CF6 | Brain | Purple/5% |
| Key Point | Teal #14B8A6 | Star | Teal/5% |
| Warning/Pitfall | Red #EF4444 | Warning | Red/5% |
| Table | Navy #1E3A5F | Grid | White |
| Board Tip | Blue #3B82F6 | Graduation cap | Blue/5% |

- Left border: 4px width
- Block header label: 13sp, ALL-CAPS, letter-spacing 0.5px, in border color
- No shadows on content blocks (compete when stacked)
- Tables: 14sp cells, 14sp semibold headers, horizontal dividers, pin first column on horizontal scroll

### Content Readability

- Body text: 16sp minimum (not 14sp), line height 1.5x (24sp)
- Heading hierarchy: H1 22sp semibold, H2 18sp semibold, H3 16sp medium
- Spacing: 4px base unit. Between paragraphs: 16px. Between sections: 32px. Heading to content: 12px.
- Max content width: cap at 640px on tablets (prevents lines too long to scan)
- Tables scroll horizontally with visible scroll indicator

---

## Color Palette (P&O themed)

### Primary Colors
- Primary Navy: #1B2A4A
- Accent Teal: #0D9488
- Warning Amber: #F59E0B
- Danger Red: #DC2626
- Success Green: #16A34A

### Special Block Colors
- Pearl Background: #FEF3C7, Border: #F59E0B
- Mnemonic Background: #EDE9FE, Border: #7C3AED
- Avoid Background: #FEE2E2, Border: #DC2626

### Module Colors (14 distinct, stored as indexed List)
1. Fundamentals: #3B82F6 (Blue)
2. LE Orthoses: #8B5CF6 (Purple)
3. UE Orthoses: #0EA5E9 (Cyan)
4. Spinal Orthoses: #6366F1 (Indigo)
5. Prosthetic Components: #DC2626 (Red)
6. Transtibial: #7C3AED (Violet)
7. Transfemoral: #EA580C (Orange)
8. UE Prosthetics: #0D9488 (Teal)
9. Gait Analysis: #E11D48 (Rose)
10. Materials: #2563EB (Blue)
11. Pediatric: #9333EA (Purple)
12. Advanced Tech: #059669 (Emerald)
13. Amputation Rehab: #F97316 (Orange)
14. Special Populations: #0891B2 (Cyan)

---

## Implementation Phases

### Phase 1: Project Setup & Core Architecture
- Initialize Flutter project
- Set up directory structure matching TBI/SCI/CVA pattern
- Create all model classes (copy from existing, rename)
- **Use sealed classes for ContentBlock**
- **Consolidate all models into lib/data/models/**
- Set up theme with P&O color palette
- Create pubspec.yaml with dependencies
- **Extract content block widgets into separate files with registry map**

### Phase 2: Content Development
- Extract content from both PDFs
- Create 14 module content files with TopicData
- **Ensure all 10 essential board-review tables are included**
- **Address content gaps: shoe modifications, partial foot, suspension systems, pressure areas, outcome measures**
- Write 75+ quiz questions with explanations
- Create flashcard decks
- Structure content with appropriate block types
- **Use const constructors for all data objects**

### Phase 3: UI Implementation
- Home screen with gradient header and module grid
- Module content screen with tab navigation
- **Add "Quiz This Module" button on module screens**
- Quiz session view with **post-results actions (Home/Retry/Review Missed)**
- **Add mid-session abandonment confirmation dialogs**
- Flashcard view with **"Needs Work" re-queue behavior**
- **Dedicated PodcastPlayerScreen with proper lifecycle and speed controls**

### Phase 4: Audio & Assets
- **Convert all podcast WAV files to AAC/M4A with ffmpeg**
- **Compress images to WebP format**
- Integrate audio assets
- Test audio playback on all target platforms

### Phase 5: Polish & Testing
- Cross-platform testing (iOS, Android, Web, macOS)
- Content review for clinical accuracy
- UI/UX refinement
- **Table rendering on narrow screens (horizontal scroll)**
- **Portrait-only orientation lock**

---

## Navigation Structure

```
HomeScreen
├── Board Review Quiz → QuizSessionView (10 random, mixed difficulty)
│   └── Results Dialog → Home / Retry / Review Missed
├── Flashcards Modal
│   ├── Fundamentals & Orthoses → FlashcardView
│   ├── Prosthetic Components → FlashcardView
│   ├── Gait Analysis → FlashcardView
│   └── Amputation Rehab → FlashcardView
│       └── Summary Dialog → Home / Replay / Review Needs Work
├── Podcasts Modal
│   ├── Orthotic Principles → PodcastPlayerScreen
│   ├── Prosthetic Components → PodcastPlayerScreen
│   ├── Gait Analysis → PodcastPlayerScreen
│   └── Amputation Rehab → PodcastPlayerScreen
└── Module Grid (14 modules)
    └── ModuleContentScreen
        ├── TopicContentView (tabbed)
        └── "Quiz This Module" → QuizSessionView (module-filtered)
```

---

## Key Board-Review Mnemonics & Memory Aids

Include these as `MnemonicBlock` content:

- **"The higher the level, the higher the energy cost"** — fundamental amputation energy principle
- **"SOMI Stops forward Motion"** — SOMI best for flexion control
- **"FRO = Floor Reaction = knee Extension"** — but requires intact quads
- **"Vascular costs more than Traumatic"** — at every amputation level
- **Pressure-tolerant = muscular/soft; Pressure-sensitive = bony prominences** — socket design principle
- **VO = rubber bands close; VC = cable closes** — terminal device mechanics
- **Pediatric milestones: UE at 6mo (sitting), LE at 9-12mo (pulling to stand)** — prosthetic fitting timing

---

## Decisions Made (from Spec Flow Analysis)

| Decision | Resolution |
|---|---|
| Post-quiz results actions | Home + Retry + Review Missed |
| Mid-session abandonment | Confirmation dialog before losing progress |
| "Needs Work" flashcard behavior | Re-append to end of current session queue |
| Flashcard order | Random shuffle at session start |
| Quiz difficulty mix | 3 basic + 4 intermediate + 3 board per 10-question session |
| Module-specific quizzes | Yes, via "Quiz This Module" button |
| Audio format | AAC/M4A (not WAV) |
| Background audio | No (stops when navigating away) |
| Audio files location | Embedded as Flutter assets |
| Podcast controls | Play/pause, seek bar, position, speed (1x/1.25x/1.5x/2x) |
| Orientation | Portrait only |
| Table rendering | Horizontal scroll with indicator |
| Persistence | None (session-only, matching existing apps) |
| State management | StatefulWidget only (no Riverpod/Provider) |
