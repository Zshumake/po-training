# Medical Content Audit: Orthoses Modules

**Date:** 2026-04-07
**Auditor:** Medical content review against Cuccurullo, DeLisa, and in-repo verified reference chapters (07-Lower-Extremity-Orthoses.md, 08-Spinal-Orthoses.md, 09-Upper-Limb-Orthoses.md).
**Scope:** `lib/data/module_contents/le_orthoses_content.dart`, `ue_orthoses_content.dart`, `spinal_orthoses_content.dart`.

---

## Summary

| File | CRITICAL | MAJOR | MINOR |
|---|---|---|---|
| le_orthoses_content.dart | 1 | 2 | 2 |
| spinal_orthoses_content.dart | 0 | 1 | 0 |
| ue_orthoses_content.dart | 0 | 2 | 2 |

Overall the content is remarkably accurate and closely tracks the verified reference chapters. The findings below are genuine discrepancies, not stylistic preferences.

---

## 1. `le_orthoses_content.dart`

### 1.1 PLS hotspot biomechanics REVERSED — CRITICAL
**File/line:** `lib/data/module_contents/le_orthoses_content.dart` line 31 (PLS hotspot in `AnnotatedImageBlock` on the AFO Types tab).

**Current text (exact):**
> "Thin, flexible posterior strut. Allows dorsiflexion, assists plantarflexion at push-off. Lightest AFO type."

**Why it is wrong:** The biomechanical purpose of a PLS is the *opposite*:
- The PLS **allows controlled plantarflexion at initial contact** (the strut bends to permit the foot to reach the floor without foot slap).
- The PLS **assists dorsiflexion during swing phase** through elastic recoil of the strut, preventing foot drop.
- A PLS does **not** assist plantarflexion at push-off; it actually resists terminal-stance plantarflexion slightly because the strut is still tensioned.

**Correct statement (source: 07-Lower-Extremity-Orthoses.md §7.3; Cuccurullo PM&R Board Review, 4th ed., Orthotics chapter; DeLisa Chapter on AFOs):**
> "Thin, flexible posterior strut. Allows controlled plantarflexion at initial contact and assists dorsiflexion in swing via elastic recoil. Indicated for mild foot drop without mediolateral instability."

**Severity:** CRITICAL — this is the single most frequently tested AFO concept on board exams, and the hotspot conveys the mechanics backwards. The rest of the file (keyPoints at lines 72–80 and the reference table at line 174) state the mechanism correctly, which makes the hotspot an outlier the student will encounter first.

---

### 1.2 Articulated AFO hotspot — quadriceps requirement misattributed — MAJOR
**File/line:** line 32 (Articulated AFO hotspot).

**Current text:**
> "Best for patients who need foot drop control but benefit from free dorsiflexion (e.g., stroke with mild-moderate spasticity). **Requires adequate quadriceps.**"

**Why it is wrong:** The articulated AFO does **not** have an intrinsic quadriceps requirement. The device that requires intact quadriceps is the **FRO/GRAFO** (because the FRO creates a knee-extension moment via GRF that must be complemented by the quadriceps). Conflating the two is exactly the kind of confusion that causes students to miss questions.

**Correct statement (source: 07-Lower-Extremity-Orthoses.md §7.4 and §7.5):** Articulated AFOs require no specific quadriceps grade; they are selected on the basis of needing foot-drop control combined with free dorsiflexion. The FRO/GRAFO is the AFO that "requires intact quadriceps to complement the knee extension moment."

**Severity:** MAJOR — directly confuses two distinct board concepts.

---

### 1.3 FRO hotspot — "blocked in slight plantarflexion" is imprecise — MINOR
**File/line:** line 33 (FRO/GRAFO hotspot).

**Current text:**
> "Anterior shell creates knee extension moment via ground reaction force. Requires ankle to be blocked in slight plantarflexion."

**Why it is misleading:** The defining mechanical feature of the FRO is that it **blocks dorsiflexion** (preventing tibial advancement so that the GRF stays anterior to the knee axis). Some designs tune the ankle in a few degrees of plantarflexion for kinematic reasons, but "blocked in slight plantarflexion" as the headline description is not how Cuccurullo, DeLisa, or the in-repo reference describe the mechanism.

**Correct phrasing (source: 07-Lower-Extremity-Orthoses.md §7.5):** "Blocks ankle dorsiflexion so that the ground reaction force vector remains anterior to the knee joint axis, producing an external knee extension moment."

**Severity:** MINOR — the keyPoints on lines 127–135 describe the mechanism correctly; only the hotspot is imprecise.

---

### 1.4 PLS hotspot claim that PLS is the "lightest AFO type" — MAJOR
**File/line:** line 31.

**Current text:** "Lightest AFO type."

**Why it is wrong:** Carbon-fiber AFOs (IDEO, ToeOff, WalkOn, Neuro Swing) are substantially lighter than a polypropylene PLS and are explicitly categorized in §7.9 of the reference as the lightweight energy-storing class. The PLS is "lighter than the solid AFO" (as the reference states) but is not the lightest AFO overall.

**Correct statement:** "Lighter and more cosmetically acceptable than a solid AFO" (per 07-Lower-Extremity-Orthoses.md §7.3).

**Severity:** MAJOR — factually incorrect generalization.

---

### 1.5 Metal double-upright AFO — "Better for patients with insensate skin" vs "Better tolerated" — MINOR
**File/line:** line 162, keyPoint: "Better for patients with insensate skin (not in full contact)".

**Reference comparison:** The reference (§7.6) says metal double-upright is "Better tolerated by patients with insensate skin because it does not create the same degree of skin contact and pressure." The content's phrasing is acceptable but slightly overstates by implying it is actively preferred over plastic in this group. Functionally correct; wording is imprecise.

**Severity:** MINOR — borderline, not a factual error.

---

## 2. `spinal_orthoses_content.dart`

### 2.1 Scoliosis pearl contradicts surgical threshold — MAJOR
**File/line:** line 543 (PearlBlock "Board Pearl — Scoliosis Orthoses").

**Current text (exact):**
> "Bracing is effective only in skeletally immature patients (Risser 0-2) with curves 25-40 degrees. **Curves >45 degrees generally require surgical consideration.**"

**Why it is wrong:** The surgical threshold for adolescent idiopathic scoliosis is **>50 degrees**, not >45 degrees. Every other part of this same file states this correctly:
- Line 651 (Cobb Angle table): "> 50° — Surgery generally indicated regardless of maturity"
- Line 658 (Board Pearl): "50° (surgery generally indicated)"
- Line 583 (BrAIST bullet): "surgical threshold of 50 degrees"
- Line 1011 (Five Rules pearl) implicitly via BrAIST.

**Correct statement (source: 08-Spinal-Orthoses.md §8.21; BrAIST trial; SRS guidelines; Cuccurullo):**
> "Bracing indicated for Risser 0–2 with curves 25–40°. Curves 40–50° are the surgical gray zone. Curves >50° generally warrant surgery regardless of skeletal maturity."

**Severity:** MAJOR — contradicts the rest of the file and introduces a distracting alternate threshold the student may memorize.

---

### 2.2 No other errors found
Direct cross-check against the reference chapter was performed for:
- All cervical motion restriction percentages (Philadelphia 71/70/66/74, SOMI 93/42/66/66, Four-poster 79/73/53/56, Yale 87/75/61/56, Minerva 79/91/51/88, Halo 96/96/96/99) — **all correct**.
- Halo pin torque (6–8 in-lb adult, 2–4 in-lb pediatric) — **correct**.
- Anterior pin site (1 cm above lateral 1/3 of supraorbital ridge, supraorbital nerve at risk) — **correct**.
- Halo complication frequency (pin loosening most common overall, pin site infection most common infectious, ~20%) — **correct**.
- SOMI best flexion (93%)/worst extension (42%) — **correct**.
- Minerva best extension (91%) and rotation (88%) non-halo — **correct**.
- TLSO effective range (T6 to L3/L4) — **correct**.
- Jewett/CASH = flexion only, stable compression T6–L1 — **correct**.
- Williams flexion LSO indications (spondylolisthesis, stenosis, facet arthropathy) — **correct**.
- BrAIST headline numbers (72% vs 48%, 13+ h/day → 90–93%, stopped early January 2013, n=242) — **correct**.
- Risser staging 0–5 and clinical significance — **correct**.
- Cobb angle decision table (excluding the line 543 error above) — **correct**.
- Fracture-level orthosis matrix (C1/C2 halo; C3–C7 stable collar; C3–C7 unstable halo/CTO; T1–T5 CTO; T6–L1 stable Jewett/CASH; unstable custom TLSO) — **correct**.

---

## 3. `ue_orthoses_content.dart`

### 3.1 Tenodesis splint listed for "C6-C7 SCI" — MAJOR
**File/line:** line 135 (Tenodesis Splint keyPoints).

**Current text:**
> "Indicated for C6-C7 SCI (intact wrist extensors, no finger flexors)."

**Why it is wrong:** The wrist-driven flexor hinge / tenodesis orthosis is specifically a **C6** device. C7 patients gain triceps, wrist flexors, and finger extensors, and as the reference (and the file's own SCI table on line 671) states, C7 patients are "Usually functional WITHOUT orthoses for most ADLs" and "may use short opponens splint if needed." Prescribing a WDFHO for C7 is not standard practice and is a distractor on board exams.

**Correct statement (source: 09-Upper-Limb-Orthoses.md §9.3 and §9.7.3; Cuccurullo SCI chapter; DeLisa):**
> "Indicated for C6 SCI (intact wrist extensors ECRL/ECRB with absent finger flexors). Not indicated for C7, where the patient typically grasps functionally without orthotic assistance."

**Severity:** MAJOR — direct conflict with the same file's SCI level table and with the board-tested level-specific associations.

---

### 3.2 Airplane splint listed as ~90° abduction only — MINOR
**File/line:** line 486 (Airplane Splint keyPoints).

**Current text:** "Holds shoulder in ~90 degrees of abduction."

**Why it is imprecise:** The reference range is **80–90 degrees** of shoulder abduction (09-Upper-Limb-Orthoses.md §9.6.1). Stating "~90 degrees" is within range but misses the commonly tested "80–90 degrees" range boundary.

**Severity:** MINOR.

---

### 3.3 Radial nerve muscle list incomplete — MINOR
**File/line:** line 237.

**Current text:** "Lost muscles: ECR, ECU, EDC, EPL, APL, supinator, brachioradialis"

**Why it is imprecise:** ECR should be split into ECRL and ECRB; and the full radial-innervated list also includes **EPB** (extensor pollicis brevis), **EIP** (extensor indicis proprius), **EDM** (extensor digiti minimi), and **anconeus**. Board questions do not typically test these exhaustively, but the list omits named muscles that the reference does name in §9.4.1.

**Correct list (reference §9.4.1):** ECRL, ECRB, ECU, EDC, EIP, EDM, EPL, EPB, APL, supinator, brachioradialis (+ anconeus, triceps if proximal).

**Severity:** MINOR.

---

### 3.4 Fracture brace — "Applied after initial immobilization (2–3 weeks post-injury)" — MAJOR
**File/line:** line 532.

**Current text:** "Applied after initial immobilization (2-3 weeks post-injury)"

**Why it is wrong:** The Sarmiento functional brace is historically applied in the **first 1–2 weeks** after injury, typically after the initial coaptation splint phase subsides (often within 7–10 days when swelling decreases). The classic Sarmiento protocol does not wait 2–3 weeks. Additionally, some modern protocols apply the brace as early as presentation. This content may mislead students into delayed application.

**Correct statement (source: 09-Upper-Limb-Orthoses.md §9.6.4; Sarmiento JBJS 2000 original series):** "Typically applied within the first 1–2 weeks after injury, once initial swelling subsides, replacing the coaptation splint."

**Severity:** MAJOR — conflicts with the canonical Sarmiento protocol and could produce a wrong answer on timing questions. (Note: strong primary sources are not reproduced verbatim here; confirm against Sarmiento JBJS 2000 82-A:478 before modifying content.)

---

### 3.5 Items cross-checked and FOUND CORRECT
- Resting hand splint position (wrist 20–30° extension, MCP 45–70° flexion, IP slight flexion, thumb midway between abduction and opposition) — **correct**.
- Functional position splint (thumb in opposition instead) — **correct**.
- Cock-up splint for radial nerve palsy and carpal tunnel — **correct**.
- Ulnar nerve palsy → claw hand → anti-claw/MCP flexion-block splint; lumbricals 3–4, hypothenar, adductor pollicis lost — **correct**.
- Ulnar paradox (low > high severity) with correct FDP explanation — **correct**.
- Median nerve palsy → ape hand → opponens splint; hand of benediction with high lesion — **correct**.
- Froment sign mechanism — **correct**.
- Tenodesis mechanism prerequisites — wrist extensors ≥3+/5, preserve finger flexor tightness (do not overstretch) — **correct**.
- C5 → BFO/MAS; C6 → WDFHO; C7 → typically no orthosis; C8 near-normal — **correct**.
- Kleinert dorsal blocking splint for zone II flexor tendon repair — **correct**.
- Turnbuckle = static-progressive for elbow flexion contracture; creep and stress relaxation — **correct**.
- Gunslinger for brachial plexus flail arm — **correct**.
- Humeral shaft fracture + radial nerve palsy association — **correct**.
- Universal cuff for C5–C6 self-feeding — **correct**.

---

## Recommended fixes (priority order)

1. **LE §1.1** — Rewrite the PLS hotspot description (line 31) to reflect correct PLS biomechanics. CRITICAL.
2. **Spinal §2.1** — Change "> 45 degrees" to "> 50 degrees" in line 543 pearl to match BrAIST and the rest of the file. MAJOR.
3. **UE §3.1** — Change tenodesis splint indication (line 135) from "C6-C7" to "C6." MAJOR.
4. **LE §1.2** — Remove "requires adequate quadriceps" from the articulated AFO hotspot (line 32). MAJOR.
5. **UE §3.4** — Correct Sarmiento application timing (line 532) to 1–2 weeks (verify against primary source before editing). MAJOR.
6. **LE §1.4** — Remove "Lightest AFO type" claim from PLS hotspot (line 31). MAJOR.
7. Remaining MINOR items can be addressed in a second pass.

## Files referenced for verification

- `/Users/zacharyshumaker/Desktop/MY INVENTIONS/P&O Training/reference-text/07-Lower-Extremity-Orthoses.md`
- `/Users/zacharyshumaker/Desktop/MY INVENTIONS/P&O Training/reference-text/08-Spinal-Orthoses.md`
- `/Users/zacharyshumaker/Desktop/MY INVENTIONS/P&O Training/reference-text/09-Upper-Limb-Orthoses.md`
- Cuccurullo SJ. *Physical Medicine and Rehabilitation Board Review*, 4th ed. (Orthotics chapter).
- Frontera WR / DeLisa's *Physical Medicine and Rehabilitation: Principles and Practice*, 6th ed. (Orthoses chapters).
- Weinstein SL et al. BrAIST trial. NEJM 2013;369:1512–1521.
- Sarmiento A. Functional bracing of humeral shaft fractures. JBJS 2000;82-A:478.
