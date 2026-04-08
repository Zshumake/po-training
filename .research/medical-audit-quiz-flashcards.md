# Medical Audit Report: Quiz Bank, Flashcards, and Clinical Flowcharts

**Auditor:** Medical content auditor (PM&R board review)
**Audit date:** 2026-04-07
**Files audited:**
1. `lib/data/quiz_banks/po_quiz_bank.dart` (92 MCQs)
2. `lib/data/quiz_banks/po_flashcards.dart` (81 flashcards in 4 decks)
3. `lib/data/flowcharts/clinical_flowcharts.dart` (5 clinical flowcharts)

**Cross-references used:**
- `reference-text/01-14` chapter markdown files (internal reference; authoritative for this app)
- Standard P&O board review sources: DeLisa, Braddom, AAOS, Waters (1999) energy expenditure data, CMS LCD L33787 (2024 MPK ruling), Dumanian 2019 (TMR), BrAIST trial

**Severity legend:**
- **CRITICAL** = Wrong "correct" answer marked; will teach the wrong thing
- **MAJOR** = Misleading / incorrect explanation or a detail that is factually wrong even though the marked answer is acceptable
- **MINOR** = Imprecise wording, outdated numbers, or terminology drift

---

## Summary of findings

| File | CRITICAL | MAJOR | MINOR |
|------|---------:|------:|------:|
| po_quiz_bank.dart | 0 | 2 | 6 |
| po_flashcards.dart | 0 | 0 | 3 |
| clinical_flowcharts.dart | 0 | 2 | 3 |

**No CRITICAL errors found** — every "correct" answer in the quiz bank is defensible against the authoritative sources and the internal reference chapters. There are, however, several MAJOR and MINOR issues worth fixing so that the explanations align with the reference chapters already in the repo.

---

## 1. `po_quiz_bank.dart` (92 MCQs)

### 1.1 MAJOR issues

#### Q7 (Module `le-orthoses`, "foot drop with normal quadriceps → ideal AFO")
**Location:** approx. lines 86-100 in `po_quiz_bank.dart`.
**Current marked answer:** "Posterior leaf spring (PLS) AFO" (index 1).
**Issue:** The answer is correct for most residents' use, but the explanation claims the PLS "does not restrict mediolateral ankle motion significantly." That is defensible as a relative statement, but the quiz also repeatedly teaches (correctly) that the PLS provides essentially *no* ML control. The explanation in Q7 reads as if the PLS is both light *and* gives ML support, which contradicts Q10 (same file) where PLS is listed as the option with the *least* ML control. Recommend tightening the Q7 explanation to say PLS provides minimal ML control.
**Severity:** MAJOR (internal contradiction between explanations).
**Source:** internal `07-Lower-Extremity-Orthoses.md`.

#### Q36 (Module `prosthetic-components`, "polycentric knee advantage for which amputation level?")
**Location:** approx. lines 532-546.
**Current marked answer:** "Knee disarticulation" (index 2).
**Issue:** The explanation states "the instantaneous center of rotation moves *posteriorly* during flexion, enhancing stance stability." This is the opposite of how a standard four-bar polycentric knee actually works. In a standard polycentric design, the instantaneous center of rotation (ICR) is posterior and superior during extension (providing voluntary stance stability), and moves *anteriorly and inferiorly* during flexion, allowing the knee to "break" into swing. Saying the ICR moves posteriorly during flexion would mean the knee becomes *more* stable while flexing, which would prevent swing initiation.
**What is correct:** In extension, the ICR is high and posterior (stability). As the knee flexes, the ICR moves anteriorly and distally (Radcliffe's "voluntary control" polycentric behavior).
**Severity:** MAJOR — a wrong biomechanical claim in an explanation, even though the chosen answer option itself is correct.
**Source:** Radcliffe CW; DeLisa's PM&R Ch. 56; AAOS Atlas of Orthoses and Assistive Devices.

### 1.2 MINOR issues

#### Q39 (Module `prosthetic-components`, "body-powered control cable motions")
**Location:** approx. lines 578-591.
**Current marked answer:** "Glenohumeral flexion and scapular abduction (protraction)" (index 1).
**Issue:** The reference chapter `06-Upper-Limb-Prosthetics.md` (lines 49, 174, 386, 618) consistently uses the standard terminology **"biscapular abduction"** (both scapulae protracting), not "scapular abduction (protraction)". Both refer to the same motion but board questions and DeLisa/Braddom use *biscapular abduction*. Recommend changing to match.
**Severity:** MINOR (terminology drift, not factually wrong).

#### Q59 (Module `ue-prosthetics`, "Syme amputation")
**Location:** approx. lines 889-903.
**Issue:** The question is tagged `moduleId: 'ue-prosthetics'` but a Syme amputation is a LOWER extremity amputation. This is a taxonomy bug, not a medical error, but it will misroute the question in module-filtered study sessions. Should be `transtibial` or a dedicated partial-foot/Syme module.
**Severity:** MINOR (tagging error; also affects Q61 lower-extremity pediatric prosthesis timing, which is also in `ue-prosthetics`).

#### Q61 (Module `ue-prosthetics`, "age for first lower-extremity pediatric prosthesis")
**Location:** approx. lines 914-928.
**Issue:** Same taxonomy bug as Q59 — an LE pediatric question tagged to `ue-prosthetics`. Also belongs under `pediatric-po`.
**Severity:** MINOR.

#### Q90 (Module `special-populations`, "leading cause of LE amputation in the US — 82%")
**Location:** approx. lines 1328-1342.
**Current marked answer:** "Peripheral vascular disease and diabetes" (index 2) — correct.
**Issue with the explanation:** Explanation cites "approximately 82%" for dysvascular/diabetes share of all LE amputations and "about 16%" for trauma. The widely cited 82% figure comes from Dillingham et al. 2002 (Arch Phys Med Rehabil) and is still defensible for LE-only, major-limb amputation discharge data. However, more recent data and the **internal reference chapter `02-Amputation-Levels-Epidemiology.md`** uses the figure **~54%** as the dysvascular share of *all* amputations (line 54 and 66 of that chapter). The marked answer (PVD/diabetes as leading cause) is still correct, but the specific percentage is inconsistent with this app's own reference text. Either update the explanation to cite Dillingham 2002 explicitly (for LE only, major-limb), or change to "~54% of all amputations" to match the internal chapter.
**Severity:** MINOR (answer is correct; numbers are internally inconsistent with the repo's own reference chapter).

#### Q40 (Module `prosthetic-components`, "microprocessor-controlled knee primary advantage")
**Location:** approx. lines 547-560.
**Current marked answer:** "Real-time adjustment of swing and stance resistance" — correct.
**Issue:** Explanation says MPKs are "indicated for K3-K4 ambulators." As of **September 2024 (CMS LCD L33787)**, MPKs with integrated stumble-recovery are also covered for **K2** patients with a documented fall history. The internal reference chapter `14-Outcomes-Energy-Expenditure.md` (lines 121, 125-127, 140) and `verification-report-2.md` (items 12-14) both reflect this. Update the explanation to "K2 (with stumble-recovery, per Sept 2024 CMS ruling) and K3-K4 ambulators."
**Severity:** MINOR (answer correct; wording outdated).

#### Q34 (Module `prosthetic-components`, "K0 functional level")
**Location:** approx. lines 503-516.
**Current marked answer:** "Does not have the ability or potential to ambulate" (index 2) — correct.
**Issue:** Explanation describes K1 as "household ambulator" and K2 as "limited community ambulator" — both match the reference (`14-Outcomes-Energy-Expenditure.md` lines 119-123). However, the K1 CMS description is more precisely "ability or potential to use a prosthesis for transfers *or* ambulation on level surfaces at a fixed cadence" — "household ambulator" is the functional descriptor, not the CMS text. This is fine for a short explanation but note that a literal "fixed cadence" quote is what boards often test.
**Severity:** MINOR (accurate but informal).

#### Q84 (Module `amputation-rehab`, "rigid dressing benefits EXCEPT")
**Location:** approx. lines 1234-1247.
**Current marked answer:** "Eliminates phantom limb pain permanently" (index 3) — correct as the "EXCEPT" answer.
**Issue:** The option "Immediate weight-bearing with a pylon" is listed as a benefit, but it should be qualified: a standard rigid dressing (non-IPOP) does NOT allow weight-bearing. Only a true IPOP (rigid dressing + attached pylon) allows early protected weight-bearing. The wording conflates rigid dressing and IPOP. Not wrong enough to be a wrong answer, but the question stem says "Rigid dressing applied immediately post-amputation" — this is ambiguous and some examiners would mark "immediate weight-bearing" as also incorrect for a rigid dressing without pylon.
**Severity:** MINOR (ambiguous stem; consider rewording to "IPOP provides all of the following EXCEPT").

---

## 2. `po_flashcards.dart` (81 cards in 4 decks)

### 2.1 No CRITICAL or MAJOR errors found.

### 2.2 MINOR issues

#### Flashcard (FundamentalsOrthosesFlashcards, "Myelomeningocele L3 level")
**Location:** approx. line 416 (AmputationRehabFlashcards deck, card titled "Myelomeningocele L3 level: what orthosis is needed?").
**Back text says:** "Bilateral KAFOs. L3 preserves hip flexion/adduction and partial quads, but loses knee flexion, ankle dorsiflexion, and plantarflexion."
**Issue:** The statement "L3 ... loses knee flexion" is anatomically imprecise. At L3, knee extension (quadriceps, L2-L4) is partial, but *knee flexion* (hamstrings, L5-S2) is absent, so the claim is actually correct. However the phrase "loses knee flexion, ankle dorsiflexion, and plantarflexion" could be misread as "loses knee extension." Recommend rewording for clarity: "Partial quads (knee extension), no hamstrings, no ankle dorsiflexion/plantarflexion." Matches reference `12-Pediatric-PO.md` line 428.
**Severity:** MINOR.

#### Flashcard (ProstheticComponentsFlashcards, "Match prosthetic foot type to K-level")
**Location:** approx. lines 120-124.
**Back text says:** "Single-axis = K1-K2."
**Issue:** The internal reference chapter `04-Transtibial-Prosthetics.md` table at line 461 lists single-axis as K1-K2, so this matches. However, the flowchart (`clinical_flowcharts.dart`) puts single-axis at K2 specifically. Consistent with K1-K2 range.
**Severity:** MINOR — just noting internal consistency check passed.

#### Flashcard (ProstheticComponentsFlashcards, "Body-powered prosthesis: what motion activates the control cable?")
**Location:** approx. lines 200-203.
**Back text says:** "Glenohumeral flexion and scapular abduction (protraction)."
**Issue:** Same terminology drift as Q39 above. Reference chapter uses "biscapular abduction." Recommend updating to match.
**Severity:** MINOR.

---

## 3. `clinical_flowcharts.dart` (5 flowcharts)

### 3.1 MAJOR issues

#### Flowchart 1 (AFO Selection), node `solidAfo`
**Location:** approx. lines 49-55.
**Current text:** "Solid AFO — Controls all ankle motion and compensates for weak quadriceps. The solid ankle design creates a knee extension moment in mid-stance via the ground reaction force vector."
**Issue:** This path is reached when **foot drop + spasticity + quadriceps weakness** is present. A true solid AFO set in slight plantarflexion/neutral can provide *some* knee extension moment, but the device that is actually indicated for foot drop with quad weakness and the need for a knee extension moment is the **FRO/GRAFO** — and the FRO specifically **requires intact quads**. If the quads are weak enough that you are considering a solid AFO to "compensate" for them, a solid AFO alone will NOT reliably create a stance-phase knee extension moment the way an FRO does (an FRO is set in plantarflexion and has a rigid anterior shell, producing a stronger GRF redirection). In addition, the flowchart's own `fro` node (line 99) explicitly says an FRO "requires intact quads." So the `solidAfo` branch contradicts its own `fro` branch: in the `solidAfo` branch the quads are weak, but the rationale then implies the solid AFO will create a knee extension moment — which it won't reliably do without intact quads. If the quads are truly weak in the setting of foot drop + spasticity, the correct answer is a **KAFO** (as the flowchart correctly says in the crouch-gait branch).
**Recommended fix:** In the `solidAfo` node, drop the "creates a knee extension moment" claim. Simply state that the solid AFO controls ankle motion and provides a stable base; if stance-phase knee stability is required with weak quads, escalate to a KAFO.
**Severity:** MAJOR (misleading clinical rationale; contradicts the flowchart's own FRO node).
**Source:** `07-Lower-Extremity-Orthoses.md`, FRO biomechanics section; Braddom Ch. 15.

#### Flowchart 3 (Cervical Orthosis Selection), node `ctoSomi`
**Location:** approx. lines 256-262.
**Current board pearl:** "SOMI restricts 93% of flexion **at C1-C2** but is less effective in extension."
**Issue:** The SOMI restricts cervical flexion overall by ~93% (per the internal reference `08-Spinal-Orthoses.md` lines 115, 276, and Clinical Pearl at line 129). However, the specific claim "at C1-C2" is misleading. The SOMI's motion-restriction percentages are reported as overall cervical flexion values, not segment-specific. Additionally, the SOMI is classically considered a **mid-to-lower cervical** flexion-control device, not primarily a C1-C2 device. For unstable C1-C2 injuries, the halo is the answer (which the flowchart handles correctly in `haloUpper`). The board pearl text should not imply the 93% applies specifically at C1-C2.
**Recommended fix:** "SOMI restricts ~93% of cervical flexion overall but only ~42% of extension. Best for mid/lower C-spine flexion control, not a primary choice for stable C1-C2 injuries — consider CTO or Minerva instead."
**Severity:** MAJOR (clinically misleading — implies SOMI is segment-specific to C1-C2, which it is not).

### 3.2 MINOR issues

#### Flowchart 2 (Prosthetic Foot by K-Level), node `k3Esar`
**Location:** approx. lines 186-192.
**Current board pearl:** "ESAR feet return 90%+ of stored energy at push-off."
**Issue:** The internal reference `04-Transtibial-Prosthetics.md` line 446 says "up to approximately **90%**" — i.e., *up to* 90%, not "90%+". Most ESAR feet return considerably less in real-world conditions (literature values commonly 55-85%). Phrasing as "90%+" overstates. Recommend "up to ~90% of stored energy."
**Severity:** MINOR.

#### Flowchart 4 (TF Knee Selection), node `k2Mpk`
**Location:** approx. lines 366-371.
**Current rationale/pearl:** "Microprocessor knees reduce falls by up to 80%..." and "C-Leg reduces falls by 80% vs mechanical knees."
**Issue:** Reference `10-Advanced-Technology.md` line 130 reports **"64-80% reduction"** as the published range, not a flat 80%. The 80% figure is the upper bound from Kahle et al. / Kaufman et al. Keep the 80% as the headline, but the rationale should say "up to 80%" or "64-80%" to be accurate.
**Severity:** MINOR.

#### Flowchart 4 (TF Knee Selection), node `clegOrRheo`
**Location:** approx. lines 402-408.
**Current board pearl:** "Rheo Knee 3 uses magnetorheological (MR) fluid — 5% less metabolic cost vs C-Leg."
**Issue:** This 5% metabolic-cost improvement claim is specific and citation-worthy. The internal reference `10-Advanced-Technology.md` does describe MR fluid mechanism but the "5% less metabolic cost vs C-Leg" specific figure is not clearly supported by the reference chapters in this repo. External literature (Johansson et al. 2005; Herr & Wilkenfeld 2003) report mixed results on Rheo vs C-Leg metabolic cost, and in some studies the Rheo had a measurable but not statistically significant reduction. Recommend either citing the source inline or softening to "some studies show modestly reduced metabolic cost vs C-Leg."
**Severity:** MINOR (specific statistic that may not survive board-level scrutiny).

---

## 4. Spot checks that PASSED (no issues)

The following high-yield, commonly-confused items were checked and are medically correct in all three files:

- **Gait cycle percentages** (stance 60%, swing 40%, DLS 20%) — correct.
- **Cadence** 110-120 steps/min — correct.
- **PLS AFO** indication (foot drop, intact quads, no significant ML instability) — correct.
- **FRO requires intact quads** — correct and correctly stated in both quiz Q8 and the flowchart `fro` node.
- **KAFO indication** (quadriceps weakness) — correct.
- **UCBL** for flexible pes planus only — correct.
- **Jewett hyperextension orthosis** for stable anterior T6-L3 compression fractures; contraindicated for posterior element fractures — correct.
- **Williams flexion orthosis** promotes lumbar flexion, indicated for spondylolisthesis/stenosis — correct.
- **Milwaukee brace** (CTLSO) for high thoracic curves apex ≥T7; **Boston brace** for apex <T7 — correct.
- **Radial n. injury → wrist drop splint; ulnar n. → anti-claw; median n. → opponens splint** — correct; matches references.
- **Resting hand / intrinsic-plus position** (wrist 20-30° ext, MCP 60-70° flex, IP slight flex, thumb palmar abd) — correct.
- **Swan neck** (PIP hyperextension + DIP flexion → silver ring); **boutonniere** (PIP flexion + DIP hyperextension → PIP extension splint) — correct.
- **Halo vest** as gold standard for overall cervical restriction — correct.
- **SOMI** ~93% flexion restriction overall — correct (per internal reference line 115).
- **Ideal TT level**: proximal/middle third junction; **fibula 2-3 cm shorter** — correct; matches `04-Transtibial-Prosthetics.md` line 36-37.
- **PTB pressure-tolerant** (patellar tendon, medial tibial flare, anterolateral muscular compartment, popliteal fossa) vs **pressure-sensitive** (tibial crest, fibular head/peroneal nerve, distal tibia, hamstring tendons, cut fibula end) — correct in both quiz and flashcards; matches reference `04-Transtibial-Prosthetics.md` lines 121-155.
- **Quadrilateral socket** (wider ML than AP, ischium on top of posterior shelf) vs **IRC** (narrower ML, wider AP, ischium contained) — correct.
- **TKA line alignment** (knee slightly anterior to TKA line for stance stability) — correct.
- **Energy expenditure**:
  - Traumatic TT: the quiz says "~25%" — reference says 10-25%, so "~25%" is the upper end, defensible.
  - Vascular TT: quiz says "~40%" — reference says 20-40%, so "~40%" is the upper end, defensible.
  - Traumatic TF: quiz says "60-70%" — matches reference exactly.
  - Vascular TF: quiz says "~100%" — reference says 65-100%, so "~100%" is the upper end, defensible as "approximately."
  - (All four are commonly quoted as board numbers and pass cross-check.)
- **VO vs VC terminal device** — correct (VO opened by cable, held closed by rubber bands; VC closed by cable, held open by springs).
- **Myodesis (muscle-to-bone, via drill holes) vs myoplasty (muscle-to-muscle over bone end)** — correct; matches reference `03-Surgical-Principles-Rehabilitation.md` lines 25-34.
- **Pediatric prosthetic milestones**: UE 6 months (sitting), LE 9-12 months (pull to stand), myoelectric at 2.5-3 years — correct; matches reference `12-Pediatric-PO.md` lines 156, 170, 187.
- **Terminal (appositional) bony overgrowth**: unique to pediatric amputees; humerus > fibula > tibia > femur; not from growth plates — correct; matches reference `12-Pediatric-PO.md` lines 223-248.
- **Chopart** (talonavicular + calcaneocuboid; equinovarus tendency) vs **Lisfranc** (tarsometatarsal) — correct; matches reference `02-Amputation-Levels-Epidemiology.md` lines 124-175.
- **Syme amputation** (ankle disarticulation with preserved heel pad) — correct.
- **Most common contractures**: TT = knee flexion; TF = hip flexion/abduction/external rotation — correct.
- **TMR** mechanism (transfer residual nerves to alternate muscle sites to create EMG control signals; also reduces neuroma/phantom pain) — correct.
- **Osseointegration** (titanium fixture into medullary canal; eliminates socket; infection risk at percutaneous site) — correct.
- **Pattern recognition myoelectric control** (ML on multi-channel EMG) — correct.

---

## 5. Recommendations

1. **Fix Q36 polycentric ICR direction** (MAJOR) — the biomechanics statement is inverted.
2. **Fix Flowchart 1 `solidAfo` rationale** (MAJOR) — it contradicts the flowchart's own FRO node. Drop the "knee extension moment" language or redirect weak-quad cases to KAFO.
3. **Fix Flowchart 3 `ctoSomi` pearl** (MAJOR) — remove the "at C1-C2" language; SOMI's 93% flexion number is overall cervical, and SOMI is not a C1-C2 device.
4. **Update Q40 and any flashcards that say MPKs are "K3-K4 only"** — CMS now covers K2 as of Sept 2024 (with stumble-recovery and patient management criteria).
5. **Standardize "biscapular abduction"** throughout (Q39 and the body-powered flashcard). The reference chapters already use this term.
6. **Re-tag Q59 and Q61** out of `ue-prosthetics` (Syme is LE; pediatric LE prosthesis timing is pediatric-po).
7. **Q90** — reconcile "82%" (Dillingham LE-only) vs the repo's own "54%" (all amputations) so the quiz explanation matches the reference chapter.
8. **Soften the "90%+ energy return" (Flowchart 2 k3Esar), the flat "80% fall reduction" (k2Mpk/k3k4CLeg), and the "5% less metabolic cost" Rheo claim** — the underlying evidence is mixed and the reference chapters use hedged language.

---

## 6. Final statement

After line-by-line review of all 92 quiz questions, 81 flashcards, and all 5 flowchart decision trees, **zero CRITICAL errors (wrong-answer-marked-correct) were found**. The clinical content is generally accurate and board-appropriate. The issues identified above are concentrated in (a) biomechanical rationale text in explanations and (b) outdated/overly-precise numeric claims. None of them would teach a resident a fundamentally wrong concept, but fixing the MAJOR items (Q36 polycentric ICR direction, Flowchart 1 solid-AFO rationale, Flowchart 3 SOMI/C1-C2 pearl) is strongly recommended before using these materials for board preparation.
