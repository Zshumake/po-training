# Medical Content Audit — Prosthetics Modules

**Audit date:** 2026-04-07
**Auditor:** Medical content auditor (PM&R board review)
**Files audited:**
- `lib/data/module_contents/transtibial_content.dart`
- `lib/data/module_contents/transfemoral_content.dart`
- `lib/data/module_contents/ue_prosthetics_content.dart`
- `lib/data/module_contents/prosthetic_components_content.dart`

**Sources cross-referenced:**
- Internal reference chapters (`reference-text/04-Transtibial-Prosthetics.md`, `05-Transfemoral-Prosthetics.md`, `06-Upper-Limb-Prosthetics.md`, `14-Outcomes-Energy-Expenditure.md`)
- VA/DoD CPG for Rehabilitation of Individuals with Lower Limb Amputation (January 2025)
- CMS LCD L33787 (updated September 2024)
- Manufacturer technical data (TASKA, Ottobock, Össur)

Severity key:
- **CRITICAL** — board-relevant factual error; residents could miss a question
- **MAJOR** — misleading or internally contradictory
- **MINOR** — imprecise wording, dated info, or cosmetic

---

## 1. `transtibial_content.dart`

### CRITICAL
None identified. Pressure-tolerant and pressure-sensitive anatomy, PTB vs TSB, PTB-SC/PTB-SC-SP indications, liner mechanical properties, suspension biomechanics, K-level/foot matching, energy expenditure table, and gait-deviation table all cross-check accurately against the reference chapter and the VA/DoD CPG 2025.

### MAJOR
None identified.

### MINOR

1. **Componentry-by-K-level table (approx line 500–509): "Foot K2: Flex foot / Multiaxis"**
   - Content currently: `['Foot', 'SACH', 'Flex foot / Multiaxis', 'Energy-storing', 'High-activity / Sport']`
   - Issue: "Flex foot" is ambiguous. "Flex-Foot" is Össur's brand name for carbon-fiber ESAR dynamic-response feet, which are K3 components. The reference chapter specifies the K2 entry as "Flexible keel / Multi-axis" (SAFE II / flexible-keel category).
   - Severity: **MINOR** (potentially confusing wording).
   - Fix suggestion: change to "Flexible keel / Multi-axis".

2. **Contralateral-limb loss figure (approx line 595–598): "55% of dysvascular amputees lose the contralateral limb within 5 years"**
   - TF file uses ~50% for the same statistic (`transfemoral_content.dart` line 703).
   - Literature range is roughly 30–55% depending on cohort; 50% is the more commonly cited figure on boards.
   - Severity: **MINOR** (internal inconsistency between modules).

Everything else in this file verifies cleanly.

---

## 2. `transfemoral_content.dart`

### CRITICAL

1. **Hip-disarticulation energy cost (line ~710 and amputation-comparison table line ~671)**
   - Content currently: *"Energy cost is approximately 80-100% above baseline."* and table row `['Energy cost (traumatic)', …, '~80-100%']` for hip disarticulation.
   - Correct per reference chapter 14 and chapter 2: **hip disarticulation / hemipelvectomy energy cost is ≈100–200% above baseline.** (Confirmed in `reference-text/14-Outcomes-Energy-Expenditure.md` line 47.)
   - The same file's sibling `prosthetic_components_content.dart` (line 747) correctly shows 100–200%, so this file is internally contradictory with the components module.
   - Severity: **CRITICAL** — energy-expenditure by level is a heavily tested PM&R board topic and the transfemoral module understates the hip-disarticulation cost by roughly half.

2. **K2 MPK coverage checkpoint (approx line 333–338)**
   - Content currently presents the correct answer as: *"Patient must demonstrate history of falls or need for stability features."*
   - Correct per CMS LCD L33787 (effective Sept 1, 2024) and the reference text lines 283–289: the actual criteria that must ALL be met are (a) MPK indicated for K2, (b) integrated stumble-recovery technology, (c) beneficiary can charge daily, (d) beneficiary can understand/respond to error alerts, (e) documentation of K2 level and rationale. "History of falls" is **not** a codified coverage criterion.
   - The surrounding educational content (lines 311–331) describes the correct criteria, but the multiple-choice answer and its explanation introduce a criterion ("history of falls") that does not exist in the LCD.
   - Severity: **CRITICAL** — residents could memorize the wrong CMS criterion from this question.
   - Fix suggestion: rewrite the correct option as "MPK has integrated stumble-recovery technology and the patient can manage daily charging and error alerts."

### MAJOR

3. **Scarpa's triangle description (quadrilateral socket, approx line 34–36)**
   - Content currently: *"Anterior wall height: at the level of the inguinal ligament (Scarpa's triangle)"* and *"Scarpa's triangle has a bulge to contain the femoral triangle (neurovascular bundle)"*.
   - Correct per reference (line 71): the anterior wall rises to the level of the inguinal ligament, and a prominent anterior bulge called **Scarpa's bulge** accommodates the contents of the femoral triangle (femoral artery, vein, nerve, lymphatics). Scarpa's triangle *is* the femoral triangle, so the phrasing "Scarpa's triangle has a bulge to contain the femoral triangle" is redundant/circular.
   - Severity: **MAJOR** (confuses two related but distinct terms — Scarpa's bulge is a socket feature; Scarpa's triangle is the anatomic femoral triangle).
   - Fix suggestion: "A Scarpa's bulge is built into the anterior wall to accommodate the contents of the femoral triangle (artery, vein, nerve)."

### MINOR

4. **Hip-disarticulation hip-joint description (line 706–711)**
   - Content is correct in stating the prosthetic hip joint is placed anterior to the midline of the body. No error, but the paired energy-cost sentence (80–100%) in the same paragraph contains the critical error listed above.

5. **MPK K-level in knee-units table (line 183)**
   - Shows "Microprocessor (C-Leg, Genium): K3-K4". Post-September-2024, strict accuracy would be "K2*–K4" with the footnote explaining K2 eligibility. The content does explain K2 eligibility in a separate block, so this is acceptable but could be tightened.
   - Severity: **MINOR**.

Suspension, whip direction/correction, GRF-vs-knee-axis biomechanics, stability-vs-mobility trade-off, TKA line, quad vs IRC shape/ischium/femur position, MAS Ortiz attribution, and hip flexion contracture accommodation (up to 20°) all verify correctly.

---

## 3. `ue_prosthetics_content.dart`

### CRITICAL
None identified. Voluntary opening vs voluntary closing mechanics, figure-8 vs figure-9 harness indications, Bowden (single-control) vs fair-lead (dual-control) cable systems, elbow-lock "Down, Back, Out" activation, two-site myoelectric assignments (transradial: wrist extensors = open / wrist flexors = close; transhumeral: biceps = close, triceps = open), body-powered grip force (~5–8 lb) vs myoelectric (25–30 lb), TMR mechanism and Kuiken/Shirley Ryan AbilityLab attribution, and the dual (prosthetic control + neuroma/phantom pain) indication for TMR all cross-check correctly.

### MAJOR
None identified.

### MINOR

1. **Muenster socket description (approx line 670)**
   - Content: *"Muenster socket: self-suspending, intimate fit above epicondyles, limits flexion/extension"*.
   - More precise per reference: the Muenster restricts roughly the last 30–40° of elbow flexion and the last few degrees of extension. The content statement is not wrong but is imprecise about the *degree* of limitation.
   - Severity: **MINOR**.

2. **Dumanian / TMR RCT (approx lines 537–555)**
   - The content accurately describes TMR as dual-purpose (prosthetic control + neuropathic pain reduction) and cites the "9 out of 10" improved/resolved phantom pain figure consistent with the literature.
   - It does **not** name Dumanian or cite the 2019 *Annals of Surgery* RCT directly. The reference chapter (line 693) lists that citation. Adding the explicit citation would strengthen the board relevance but its absence is not an error.
   - Severity: **MINOR** (opportunity for enhancement, not an inaccuracy).

3. **i-Limb Quantum manufacturer listed as Össur (line 172)**
   - i-Limb originated with Touch Bionics, which was acquired by Össur in 2016; current branding is Össur. Accurate.

4. **TASKA Gen2 IP67 rating (line 175)**
   - Verified via manufacturer documentation (TASKA Prosthetics, Fillauer) — IP67 with Hydroseal wrist ring. Accurate.

Component hierarchy by amputation level (transradial vs transhumeral vs shoulder disart), external hinges mandated for elbow disarticulation, and the description of no cable-powered elbow extension (gravity/manual only) all verify correctly.

---

## 4. `prosthetic_components_content.dart`

### CRITICAL

1. **Polycentric (four-bar) knee K-level (approx line 271)**
   - Content currently: `'K-Level: K1-K2'`.
   - Correct per reference chapter 5 (line 174 and 228) and CMS coverage norms: **polycentric four-bar knee is K2–K3.** The sibling `transfemoral_content.dart` (line 180) correctly lists polycentric as K2–K3, so this module is internally contradictory.
   - Severity: **CRITICAL** — this is a classic board-question K-level match, and the two modules within the same app will give residents conflicting answers.
   - Fix suggestion: change to `'K-Level: K2-K3'`. Update the comparison table on line 387 to match.

2. **Polycentric (four-bar) in comparison table (line 387)**
   - Content currently: `['Polycentric (4-bar)', 'K1-K2', ...]`.
   - Same error as above.
   - Severity: **CRITICAL**.

### MAJOR

3. **SACH foot K-level (lines 39, 155)**
   - Content says `'K-Level: K1-K2'` in the key-points and `'K1-K2'` in the comparison table.
   - Reference chapter 4 (lines 399, 460, 659) specifies **SACH = K1** (household ambulators only). Some outside sources occasionally stretch SACH to K2, but strict CMS/reference coding is K1.
   - Severity: **MAJOR** — board answer keys consistently use K1 for SACH. This is high-frequency test content.
   - Fix suggestion: change to `'K-Level: K1'`.

4. **Pneumatic knee K-level (lines 347, 390)**
   - Content says K-Level K2–K3.
   - Reference chapter 5 (line 175, 240) specifies **pneumatic = K3**. The transfemoral module (line 182) says K3. This module is internally inconsistent with the TF module.
   - Severity: **MAJOR**.
   - Fix suggestion: change to `'K-Level: K3'`.

5. **Manual locking knee K-level (line 300)**
   - Content says `'K-Level: K1'`. Reference lists it as "K1 / special" and uses it for bilateral TF in early rehab, stroke, visually impaired, cognitively impaired regardless of K-level.
   - Not strictly wrong, but labeling exclusively as K1 is incomplete.
   - Severity: **MINOR** (borderline MAJOR).

6. **Single-axis foot rationale (line 65)**
   - Content: *"Better knee stability than SACH for transfemoral amputees"*.
   - Reference (chapter 4 line 415) emphasizes the single-axis foot's knee-stability benefit is primarily for **transtibial** patients with weak quads / knee extension instability, and secondarily for transfemoral. Framing it as specifically a TF benefit is misleading — it is a TT board pearl.
   - Severity: **MINOR/MAJOR borderline**.
   - Fix suggestion: "Provides a stabilizing knee extension moment at initial contact via rapid foot-flat — useful for TT patients with weak quadriceps or knee extension instability, and for TF patients who need additional stance-phase knee security."

7. **Lisfranc equinovarus mechanism (line 611–613)**
   - Content: *"Ankle dorsiflexors (tibialis anterior) lose insertion point"* at Lisfranc level.
   - Anatomically imprecise. Tibialis anterior inserts on the **medial cuneiform** and the base of the first metatarsal. A true Lisfranc (tarsometatarsal) disarticulation preserves the medial cuneiform, so part of the tibialis anterior insertion is retained — which is why the equinovarus at Lisfranc is less severe than at Chopart. The anterior tibialis insertion is *fully* lost at Chopart (midtarsal disarticulation removes the navicular and cuboid and, with them, the cuneiforms).
   - Severity: **MAJOR** — commonly tested biomechanics. The current wording overstates the dorsiflexor loss at Lisfranc and understates the severity difference between Lisfranc and Chopart.
   - Fix suggestion: "Equinovarus tendency: peroneus brevis insertion (5th metatarsal base) lost, peroneus longus insertion (1st metatarsal base) lost, extensor digitorum and extensor hallucis longus insertions lost. Tibialis anterior's cuneiform insertion may be preserved depending on exact disarticulation plane, so dorsiflexion loss is less complete than at Chopart."

### MINOR

8. **Manufacturer spelling "Otto Bock" (line 370)**
   - Content: `'Examples: C-Leg (Otto Bock), Genium, Rheo Knee, POWER KNEE'`.
   - The company brand is one word: **Ottobock** (since the 2012 rebrand). Other places in the same app use "Ottobock" correctly. Also, the "POWER KNEE" (Össur) was discontinued — no longer a current K3-K4 example and should be removed or replaced with a current powered-knee example if one is desired.
   - Severity: **MINOR**.

9. **Flexible Keel (SAFE) acronym (line 110)**
   - Content: *"SAFE = Stationary Ankle Flexible Endoskeletal"*.
   - The original Campbell-Childs SAFE acronym is **Solid Ankle Flexible Endoskeleton** (sometimes "Solid Ankle Flexible Endoskeletal"). "Stationary" is an uncommon expansion. Reference chapter 4 line 428 uses "Solid Ankle Flexible Endoskeleton".
   - Severity: **MINOR**.
   - Fix suggestion: change to "Solid Ankle Flexible Endoskeleton".

10. **Definitive prosthesis timing (line 506)**
    - Content: *"Typically 4-6 months post-amputation (volume plateau)"*. Consistent with reference range (3–6 months). Acceptable.

11. **K2 MPK L-codes (lines 854)**
    - Content lists L5856 / L5857 / L5858. Reference also adds L5841 added for fluid/pneumatic knees under the 2024 update. Not wrong, just less complete.
    - Severity: **MINOR**.

Energy-expenditure table (lines 736–751), Syme's end-bearing rationale, AMP/PLUS-M/ABC Scale/6MWT/TUG/L-Test/SCS psychometric data, ISPO COMPASS battery, Chopart "only talus and calcaneus remain", endoskeletal vs exoskeletal, socket fabrication steps, and K0–K4 definitions all verify correctly against reference text and current literature.

---

## Summary of findings requiring action

| Priority | File | Location | Issue |
|---|---|---|---|
| CRITICAL | transfemoral_content.dart | ~line 710 and table ~line 671 | Hip disarticulation energy cost listed as 80–100%; correct is 100–200% |
| CRITICAL | transfemoral_content.dart | ~line 334–338 (CheckpointBlock) | K2 MPK coverage question uses "history of falls" as a CMS criterion; not in LCD L33787 |
| CRITICAL | prosthetic_components_content.dart | line 271 and line 387 | Polycentric four-bar knee listed as K1–K2; correct is K2–K3 |
| MAJOR | prosthetic_components_content.dart | lines 39, 155 | SACH listed as K1–K2; strict reference/CMS = K1 |
| MAJOR | prosthetic_components_content.dart | lines 347, 390 | Pneumatic knee listed as K2–K3; correct is K3 |
| MAJOR | prosthetic_components_content.dart | lines 611–613 | Lisfranc equinovarus mechanism overstates tibialis anterior insertion loss (cuneiform preserved) |
| MAJOR | transfemoral_content.dart | lines 34–36 | "Scarpa's triangle" and "femoral triangle" used redundantly; should be "Scarpa's bulge" (socket feature) accommodating "femoral triangle" (anatomy) |
| MAJOR | prosthetic_components_content.dart | line 65 | Single-axis foot knee-stability benefit mis-attributed primarily to TF; primary benefit is in TT with weak quads |
| MINOR | prosthetic_components_content.dart | line 300 | Manual locking knee labeled K1 only; reference says "K1/special" |
| MINOR | prosthetic_components_content.dart | line 110 | SAFE acronym expanded as "Stationary Ankle…"; correct is "Solid Ankle Flexible Endoskeleton" |
| MINOR | prosthetic_components_content.dart | line 370 | "Otto Bock" should be "Ottobock"; POWER KNEE discontinued |
| MINOR | transtibial_content.dart | ~line 504 | "Flex foot / Multiaxis" for K2 foot is ambiguous (Flex-Foot is Össur ESAR = K3); should be "Flexible keel / Multi-axis" |
| MINOR | transtibial_content.dart vs transfemoral_content.dart | — | Contralateral-limb-loss statistic differs (55% vs 50%) between modules |
| MINOR | ue_prosthetics_content.dart | ~line 670 | Muenster socket flexion limitation should specify last 30–40° of elbow flexion |

---

## Files with ZERO errors

None of the four files were error-free. The cleanest was `transtibial_content.dart` (no CRITICAL or MAJOR errors, two MINOR items). The file with the most concerning errors was `prosthetic_components_content.dart` (two CRITICAL K-level errors and four MAJOR items).

---

## Notes on methodology

- Every factual claim in each of the four files was compared against the corresponding internal reference markdown chapter.
- September 2024 CMS K2 MPK expansion confirmed against the VA/DoD CPG January 2025 and the internal reference chapter which cites LCD L33787.
- TASKA IP67 rating confirmed via direct manufacturer documentation.
- Energy expenditure percentages triangulated across reference chapters 4, 5, and 14.
- K-level assignments cross-checked across both the transfemoral and prosthetic_components modules; discrepancies flagged as internal inconsistencies regardless of which file is correct.

*End of audit report.*
