# Upgrading Gait Animations: From Stick Figures to Anatomical Models

## Executive Summary

The current `GaitDemoWidget` uses Flutter `CustomPaint` with `Transform.rotate` on rectangular limb segments — functionally correct but visually primitive. This report evaluates three approaches to making the animations look more human-like and medically credible, then recommends a specific path forward.

**Recommendation: Enhanced CustomPainter with anatomical silhouettes** — no new dependencies, highest control, best fit for medical accuracy requirements.

---

## Approach Comparison

### Option A: Rive Animations (External Tool)
- **How it works**: Design characters in [rive.app](https://rive.app) visual editor, export `.riv` files, play in Flutter via `rive` package. State machines handle transitions between gait patterns.
- **Pros**: Beautiful smooth animations, interactive state machines, small file size, GPU-accelerated
- **Cons**: Requires designing each gait pattern in a separate visual tool (Rive editor). Biomechanical accuracy is hard to control — you're eyeballing joint angles instead of specifying them numerically. Each pathologic gait needs manual animation work in the Rive editor. Not code-driven — can't parameterize based on kinematic data.
- **Verdict**: Great for generic character animation, wrong for medically precise biomechanics. The whole point is that joint angles matter — a Trendelenburg has specific degrees of pelvic drop, and we need to control that programmatically.

### Option B: Lottie (After Effects Export)
- **How it works**: Design in After Effects, export via Bodymovin plugin to JSON, play in Flutter via `lottie` package.
- **Pros**: High visual quality, industry standard, huge library of existing animations
- **Cons**: Same problem as Rive — animations are pre-baked, not parameterized. Requires After Effects license. Can't dynamically adjust joint angles. Each pathologic gait = separate AE composition. Overkill for our use case.
- **Verdict**: Wrong tool. We need real-time kinematic data driving the figure, not pre-rendered sequences.

### Option C: Enhanced CustomPainter (Recommended)
- **How it works**: Keep the current `AnimationController` + `TweenSequence` architecture (which correctly drives joint angles from kinematic data), but replace the rectangular limb rendering with anatomically proportioned body segments using `Path`, `drawPath`, bezier curves, and gradients.
- **Pros**: Full programmatic control of every joint angle. No new dependencies. Each gait pattern is defined by kinematic data, not manual animation. Can show joint markers, GRF vectors, muscle activation overlays. Can label phases in real-time. Can switch between gait patterns instantly.
- **Cons**: More drawing code. Requires getting body proportions right. No visual editor — it's all code.
- **Verdict**: This is the right approach. The kinematic architecture is already correct — we just need better rendering.

---

## What "Better Rendering" Looks Like

### Current State (Stick Figure)
- Rectangular limbs (`Container` with `BorderRadius`)
- Flat colors (blueGrey shades)
- No body shape — just rectangles pivoting at joints
- No visual distinction between segments (thigh looks like shin)
- No joint markers
- No ground contact visualization

### Target State (Anatomical Silhouette)
Drawing each body segment as a shaped `Path` with anatomical proportions:

**Head & Neck**
- Oval head with slight jaw line (not a circle)
- Cylindrical neck connecting to shoulders

**Torso**
- Trapezoid shoulders (wider at top)
- Tapered waist
- Subtle chest/back curvature using quadratic bezier
- Pelvis as a wider base

**Upper Limbs**
- Tapered upper arm (wider at deltoid, narrower at elbow)
- Forearm with slight taper
- Small hand shape

**Lower Limbs — the critical part for gait**
- Thigh: widest at hip, tapers to knee. Use `Path` with bezier curves for lateral contour (vastus lateralis) and medial contour
- Knee: visible joint marker (small circle or diamond)
- Shin: slightly narrower than thigh, tapers to ankle
- Foot: anatomical side-view shape (heel, arch, forefoot) — not a rectangle

**Joint Markers**
- Small circles at hip, knee, ankle joints
- Color-coded: teal for normal ROM, amber for abnormal
- Optional: show joint angle arc with degree label

**Ground Contact**
- Ground reaction force vector (green arrow from foot center, angled)
- Foot contact area highlight (heel strike vs midstance vs toe-off)
- Shadow or ground plane indicator

### Body Proportions (7.5-Head Canon)
Using standard artistic human proportions:
- Total height: 7.5 head lengths
- Head to chin: 1 head
- Chin to nipple line: 1 head
- Nipple to navel: 1 head
- Navel to pubis: 1 head
- Pubis to mid-thigh: 1 head
- Mid-thigh to below knee: 1 head
- Below knee to mid-shin: 0.75 head
- Mid-shin to ground: 0.75 head

For our widget (350px tall figure area), 1 head ≈ 35px.

---

## Visual Enhancement Techniques

### 1. Gradient Body Fill
Instead of flat color, use `LinearGradient` on each limb path — lighter on the near side, darker on the far side. Creates depth without 3D rendering.

### 2. Limb Layering with Opacity
- Far-side limbs: 60% opacity, slightly desaturated
- Near-side limbs: 100% opacity, full saturation
- Creates natural depth perception in 2D

### 3. Phase-Synchronized Labels
Show current gait phase name below the figure:
- "Initial Contact" → "Loading Response" → "Midstance" → etc.
- Highlight the current phase in a progress bar synced to the animation controller

### 4. Pathologic Indicators
For abnormal gaits, add visual callouts:
- **Trendelenburg**: Red dotted line showing pelvic tilt, arrow indicating trunk lean direction
- **Steppage**: Amber arrow at knee showing exaggerated flexion
- **Circumduction**: Dotted arc path showing the lateral swing trajectory
- **Vaulting**: Amber highlight on sound-side ankle showing extreme PF

### 5. Muscle Activation Overlay (Optional Advanced)
Semi-transparent colored regions over active muscle groups:
- Quads light up during loading response
- Gastroc lights up during push-off
- Tibialis anterior lights up during swing
- Color: green for normal activation, red for absent/weak

---

## Implementation Plan

### Step 1: Create `_BodyPainter` CustomPainter
Replace the current `_buildLimb` / `Container` approach with a single `CustomPainter` that draws the entire figure using `Path` objects and `canvas.drawPath`.

Key methods:
- `_drawHead(canvas, headCenter, rotation)`
- `_drawTorso(canvas, shoulderCenter, hipCenter, rotation)`
- `_drawUpperLimb(canvas, shoulderPos, elbowAngle, wristAngle, opacity)`
- `_drawLowerLimb(canvas, hipPos, kneeAngle, ankleAngle, footAngle, lateralOffset, opacity)`
- `_drawJointMarker(canvas, position, isAbnormal)`
- `_drawGRF(canvas, footPos, phase)`
- `_drawPhaseLabel(canvas, phase)`

### Step 2: Forward Kinematics Chain
Calculate absolute positions from joint angles using forward kinematics:
```
hipPos = torsoBase + torsoRotation
kneePos = hipPos + thighLength * sin(hipAngle), hipPos + thighLength * cos(hipAngle)
anklePos = kneePos + shinLength * sin(hipAngle + kneeAngle), ...
footEnd = anklePos + footLength * sin(totalAnkleAngle), ...
```

This replaces the nested `Transform.rotate` / `Positioned` approach with direct position calculation — cleaner and allows drawing the full silhouette path.

### Step 3: Body Segment Paths
For each limb segment, create a `Path` with anatomical width profile:
```dart
Path _thighPath(Offset hip, Offset knee, double angle) {
  // Left contour: hip + lateral offset → knee + narrower offset
  // Right contour: hip - medial offset → knee - narrower offset
  // Connected with bezier curves for organic shape
}
```

### Step 4: Gait Phase Detection
Map animation controller value (0.0–1.0) to gait phase:
- 0.00–0.02: Initial Contact
- 0.02–0.12: Loading Response
- 0.12–0.30: Midstance
- 0.30–0.50: Terminal Stance
- 0.50–0.62: Pre-Swing
- 0.62–0.75: Initial Swing
- 0.75–0.87: Mid-Swing
- 0.87–1.00: Terminal Swing

---

## References

- [Pose Animator (TensorFlow)](https://blog.tensorflow.org/2020/05/pose-animator-open-source-tool-to-bring-svg-characters-to-life.html) — SVG rigging approach for 2D character animation
- [ProceduralWalking2D](https://github.com/Jaeyoung0209/ProceduralWalking2D) — Unity procedural walk with Bezier curves, torso/arm coroutines
- [Rive for Flutter](https://pub.dev/packages/rive) — State-machine driven vector animation runtime
- [Lottie for Flutter](https://pub.dev/packages/lottie) — After Effects JSON animation playback
- [Flutter CustomPainter animation](https://blog.codemagic.io/flutter-custom-painter/) — Canvas-level drawing and animation techniques
- [awesome-biomechanics](https://github.com/modenaxe/awesome-biomechanics) — Curated biomechanics resources and models
- [KineBody](https://www.kinebody.com/) — Interactive 3D human joint model
- [SVG AI Animate](https://www.svgai.org/animate) — AI-powered SVG animation generation
- [SMIL Animation Guide (MDN)](https://developer.mozilla.org/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL) — SVG-native animation specification
- [Human Figure Proportions](https://anatomymasterclass.com/anatomy-video-lessons/human-figure-proportions) — 7.5-head canon for figure drawing
