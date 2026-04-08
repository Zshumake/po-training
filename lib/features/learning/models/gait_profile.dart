import 'package:flutter/material.dart';

enum GaitType {
  normal,
  steppage,
  parkinsonian,
  antalgic,
  crouch,
  vaulting,
  circumduction,
  trendelenburg,
}

class GaitProfile {
  final GaitType type;
  final Duration duration;
  
  // Stance leg (Right for our demo)
  final TweenSequence<double> rightHipFlexion;
  final TweenSequence<double> rightKneeFlexion;
  final TweenSequence<double> rightAnkleFlexion;

  // Swing leg (Left for our demo)
  final TweenSequence<double> leftHipFlexion;
  final TweenSequence<double> leftKneeFlexion;
  final TweenSequence<double> leftAnkleFlexion;

  // Global Torso
  final TweenSequence<double> torsoYOffset;
  final TweenSequence<double> torsoRotation;

  // Arms
  final TweenSequence<double> rightShoulderFlexion;
  final TweenSequence<double> leftShoulderFlexion;

  // Coronal plane (lateral) movements — simulated in 2D
  final TweenSequence<double> torsoLateralShift; // + = shift right, - = shift left
  final TweenSequence<double> rightLegLateralOffset; // + = swing out laterally (circumduction)

  static final _zeroTween = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 1),
  ]);

  GaitProfile({
    required this.type,
    required this.duration,
    required this.rightHipFlexion,
    required this.rightKneeFlexion,
    required this.rightAnkleFlexion,
    required this.leftHipFlexion,
    required this.leftKneeFlexion,
    required this.leftAnkleFlexion,
    required this.torsoYOffset,
    required this.torsoRotation,
    required this.rightShoulderFlexion,
    required this.leftShoulderFlexion,
    TweenSequence<double>? torsoLateralShift,
    TweenSequence<double>? rightLegLateralOffset,
  }) : torsoLateralShift = torsoLateralShift ?? _zeroTween,
       rightLegLateralOffset = rightLegLateralOffset ?? _zeroTween;

  // Factory providing the "Normal" gait (approximate kinematic data mapped to 0-1 timeline)
  // Positive angles usually imply flexion/dorsiflexion, negative implies extension/plantarflexion.
  static GaitProfile get normal {
    return GaitProfile(
      type: GaitType.normal,
      duration: const Duration(milliseconds: 1200),
      
      rightHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 0.0), weight: 30), // IC to Midstance
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 20), // Midstance to TS
        TweenSequenceItem(tween: Tween(begin: -10.0, end: 15.0), weight: 25), // TS to ISw
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 30.0), weight: 25), // ISw back to IC
      ]),
      rightKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 12), // IC to LR
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 0.0), weight: 18), // LR to MS
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 20), // MS to TS
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 60.0), weight: 20), // TS/PS to ISw
        TweenSequenceItem(tween: Tween(begin: 60.0, end: 0.0), weight: 30), // ISw to IC
      ]),
      rightAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -5.0), weight: 12), // IC to LR (plantarflex)
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 10.0), weight: 38), // LR to TS (dorsiflex)
        TweenSequenceItem(tween: Tween(begin: 10.0, end: -15.0), weight: 12), // TS to PS (plantarflex push-off)
        TweenSequenceItem(tween: Tween(begin: -15.0, end: 0.0), weight: 38), // Swing phase (neutral)
      ]),

      // Left leg is identical, offset by roughly 50%
      leftHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: -10.0, end: 15.0), weight: 25), 
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 30.0), weight: 25), 
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 0.0), weight: 30), 
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 20), 
      ]),
      leftKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 60.0), weight: 20), 
        TweenSequenceItem(tween: Tween(begin: 60.0, end: 0.0), weight: 30), 
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 12), 
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 0.0), weight: 18), 
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 20), 
      ]),
      leftAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 10.0, end: -15.0), weight: 12),
        TweenSequenceItem(tween: Tween(begin: -15.0, end: 0.0), weight: 38),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -5.0), weight: 12),
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 10.0), weight: 38),
      ]),

      torsoYOffset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 12), // Drop in LR
        TweenSequenceItem(tween: Tween(begin: 15.0, end: -5.0), weight: 18), // Rise in MS
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 0.0), weight: 20), // Fall
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 12), // Drop opposite LR
        TweenSequenceItem(tween: Tween(begin: 15.0, end: -5.0), weight: 18), // Rise opposite MS
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 0.0), weight: 20), // Fall
      ]),
      torsoRotation: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 100),
      ]),
      
      rightShoulderFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: -20.0, end: 20.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 20.0, end: -20.0), weight: 50),
      ]),
      leftShoulderFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 20.0, end: -20.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: -20.0, end: 20.0), weight: 50),
      ]),
    );
  }

  // Pathologic Gait Profiles
  
  // 1. Steppage Gait (Right leg has foot drop - weak dorsiflexors)
  static GaitProfile get steppage {
    final base = GaitProfile.normal;
    return GaitProfile(
      type: GaitType.steppage,
      duration: const Duration(milliseconds: 1300),
      leftHipFlexion: base.leftHipFlexion,
      leftKneeFlexion: base.leftKneeFlexion,
      leftAnkleFlexion: base.leftAnkleFlexion,
      leftShoulderFlexion: base.leftShoulderFlexion,
      rightShoulderFlexion: base.rightShoulderFlexion,
      torsoYOffset: base.torsoYOffset,
      torsoRotation: base.torsoRotation,
      
      // Increased Hip and Knee flexion during swing to clear the foot
      rightHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 0.0), weight: 30),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: -10.0, end: 35.0), weight: 25), // High hip hike
        TweenSequenceItem(tween: Tween(begin: 35.0, end: 30.0), weight: 25),
      ]),
      rightKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 12),
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 0.0), weight: 18),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 80.0), weight: 20), // High knee hike
        TweenSequenceItem(tween: Tween(begin: 80.0, end: 0.0), weight: 30),
      ]),
      // Foot remains plantarflexed due to absent dorsiflexion
      rightAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: -20.0, end: -20.0), weight: 100),
      ]),
    );
  }

  // 2. Parkinsonian Gait (Stooped, reduced arm swing, shuffling)
  static GaitProfile get parkinsonian {
    return GaitProfile(
      type: GaitType.parkinsonian,
      duration: const Duration(milliseconds: 600), // Fast, shuffling (festination)
      
      rightHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 10.0, end: -5.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 10.0), weight: 50),
      ]),
      rightKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 20.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 10.0), weight: 50),
      ]),
      rightAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 100),
      ]),

      leftHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 10.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 10.0, end: -5.0), weight: 50),
      ]),
      leftKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 10.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 20.0), weight: 50),
      ]),
      leftAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 100),
      ]),

      torsoYOffset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 100), // Flat bounce
      ]),
      torsoRotation: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 15.0), weight: 100), // Stooped forward
      ]),
      
      // Barely any arm swing
      rightShoulderFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 5.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 5.0, end: -5.0), weight: 50),
      ]),
      leftShoulderFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 5.0, end: -5.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 5.0), weight: 50),
      ]),
    );
  }

  // 3. Antalgic Gait (Pain on right leg, rapid weight shift off right leg)
  static GaitProfile get antalgic {
    final base = GaitProfile.normal;
    return GaitProfile(
      type: GaitType.antalgic,
      duration: const Duration(milliseconds: 1400),
      
      // Asymmetric timing via weight distribution.
      // Normal weight was: 30(IC->MS), 20(MS->TS), 25(TS->ISw), 25(ISw->IC)
      // Antalgic Right: Shortened stance, prolonged swing.
      rightHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 0.0), weight: 10), // Very fast stance phase
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 10),
        TweenSequenceItem(tween: Tween(begin: -10.0, end: 15.0), weight: 40), // Prolonged swing
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 30.0), weight: 40),
      ]),
      rightKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 10.0), weight: 5), // Reduced knee flexion to avoid pain
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 15),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 10),
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 50.0), weight: 35),
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 0.0), weight: 35),
      ]),
      rightAnkleFlexion: base.rightAnkleFlexion, // Simplify bounds

      leftHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: -10.0, end: 15.0), weight: 10), 
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 30.0), weight: 10), 
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 0.0), weight: 40), // Prolonged stance on left leg
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 40), 
      ]),
      leftKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 60.0), weight: 10), 
        TweenSequenceItem(tween: Tween(begin: 60.0, end: 0.0), weight: 10), 
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 20), // Deep loading response on left
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 0.0), weight: 30), 
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 30), 
      ]),
      leftAnkleFlexion: base.leftAnkleFlexion,
      
      torsoYOffset: base.torsoYOffset, 
      torsoRotation: base.torsoRotation,
      leftShoulderFlexion: base.leftShoulderFlexion,
      rightShoulderFlexion: base.rightShoulderFlexion,
    );
  }

  // 4. Crouch Gait (Spastic diplegia CP - increased hip and knee flexion throughout)
  static GaitProfile get crouch {
    final base = GaitProfile.normal;
    return GaitProfile(
      type: GaitType.crouch,
      duration: const Duration(milliseconds: 1400),
      
      rightHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 20.0), weight: 30), // Never fully extends
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 10.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 40.0), weight: 25),
        TweenSequenceItem(tween: Tween(begin: 40.0, end: 50.0), weight: 25),
      ]),
      rightKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 40.0), weight: 12), // Knee stays flexed highly
        TweenSequenceItem(tween: Tween(begin: 40.0, end: 20.0), weight: 18),
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 30.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 70.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 70.0, end: 30.0), weight: 30),
      ]),
      rightAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 15.0), weight: 100), // Forced dorsiflexion
      ]),
      
      leftHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 40.0), weight: 25), 
        TweenSequenceItem(tween: Tween(begin: 40.0, end: 50.0), weight: 25), 
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 20.0), weight: 30), 
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 10.0), weight: 20), 
      ]),
      leftKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 70.0), weight: 20), 
        TweenSequenceItem(tween: Tween(begin: 70.0, end: 30.0), weight: 30), 
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 40.0), weight: 12), 
        TweenSequenceItem(tween: Tween(begin: 40.0, end: 20.0), weight: 18), 
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 30.0), weight: 20), 
      ]),
      leftAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 15.0), weight: 100),
      ]),

      torsoYOffset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 20.0), weight: 100), // Permanently lowered COG
      ]),
      torsoRotation: base.torsoRotation,
      rightShoulderFlexion: base.rightShoulderFlexion,
      leftShoulderFlexion: base.leftShoulderFlexion,
    );
  }

  // 5. Vaulting Gait (Sound left leg plantarflexes violently to clear right prosthetic leg)
  static GaitProfile get vaulting {
    final base = GaitProfile.normal;
    return GaitProfile(
      type: GaitType.vaulting,
      duration: const Duration(milliseconds: 1300),
      leftHipFlexion: base.leftHipFlexion,
      leftKneeFlexion: base.leftKneeFlexion,
      leftShoulderFlexion: base.leftShoulderFlexion,
      rightShoulderFlexion: base.rightShoulderFlexion,
      torsoRotation: base.torsoRotation,

      // Right leg is the long prosthesis, it swings through with minimal knee bend
      rightHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 25.0, end: 0.0), weight: 30),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -15.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: -15.0, end: 10.0), weight: 25), 
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 25.0), weight: 25),
      ]),
      rightKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 30), // Stiff knee in stance
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 0.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 20), // Reduced knee bend in swing
        TweenSequenceItem(tween: Tween(begin: 15.0, end: 0.0), weight: 30),
      ]),
      rightAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 100), // Rigid prosthetic ankle
      ]),

      // Left leg vaults during the right leg's swing phase (weight indices 3 and 4)
      leftAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 5.0, end: -5.0), weight: 12),
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 5.0), weight: 38), // Left stance
        TweenSequenceItem(tween: Tween(begin: 5.0, end: -35.0), weight: 25), // VAULT! Extreme plantarflexion during right leg initial swing
        TweenSequenceItem(tween: Tween(begin: -35.0, end: 5.0), weight: 25), // Drop back down
      ]),

      // Torso bounces high during the vault
      torsoYOffset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 12), 
        TweenSequenceItem(tween: Tween(begin: 15.0, end: -5.0), weight: 18), 
        TweenSequenceItem(tween: Tween(begin: -5.0, end: 0.0), weight: 20), 
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 15.0), weight: 12), 
        TweenSequenceItem(tween: Tween(begin: 15.0, end: -35.0), weight: 18), // VAULT LIFT (huge negative Y offset)
        TweenSequenceItem(tween: Tween(begin: -35.0, end: 0.0), weight: 20), 
      ]),
    );
  }

  // 6. Circumduction Gait (Right prosthetic leg swings in a wide lateral arc)
  // The stiff leg cannot flex at the knee to clear the ground, so it swings outward laterally.
  static GaitProfile get circumduction {
    final base = GaitProfile.normal;
    return GaitProfile(
      type: GaitType.circumduction,
      duration: const Duration(milliseconds: 1400),
      leftHipFlexion: base.leftHipFlexion,
      leftKneeFlexion: base.leftKneeFlexion,
      leftAnkleFlexion: base.leftAnkleFlexion,
      leftShoulderFlexion: base.leftShoulderFlexion,
      rightShoulderFlexion: base.rightShoulderFlexion,
      torsoYOffset: base.torsoYOffset,
      torsoRotation: base.torsoRotation,

      rightHipFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 25.0, end: 0.0), weight: 30),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -15.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: -15.0, end: 10.0), weight: 25),
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 25.0), weight: 25),
      ]),
      rightKneeFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 30),
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 0.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 20), // Locked knee in swing
        TweenSequenceItem(tween: Tween(begin: 5.0, end: 0.0), weight: 30),
      ]),
      rightAnkleFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 100), // Rigid
      ]),
      // Lateral arc during swing phase — the key circumduction movement
      rightLegLateralOffset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 50), // Stance: no lateral offset
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 30.0), weight: 20), // Swing: arc outward
        TweenSequenceItem(tween: Tween(begin: 30.0, end: 20.0), weight: 10), // Peak of arc
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 0.0), weight: 20), // Return for IC
      ]),
    );
  }

  // 7. Trendelenburg Gait (Compensated / Gluteus Medius Lurch)
  // Weak right glut med → during right stance, contralateral pelvis drops.
  // Compensated: trunk leans TOWARD the weak side (right) to shift COG over stance leg.
  // We show this as lateral trunk shift + slight torso tilt.
  static GaitProfile get trendelenburg {
    final base = GaitProfile.normal;
    return GaitProfile(
      type: GaitType.trendelenburg,
      duration: const Duration(milliseconds: 1300),
      leftHipFlexion: base.leftHipFlexion,
      leftKneeFlexion: base.leftKneeFlexion,
      leftAnkleFlexion: base.leftAnkleFlexion,
      rightAnkleFlexion: base.rightAnkleFlexion,
      leftShoulderFlexion: base.leftShoulderFlexion,

      rightHipFlexion: base.rightHipFlexion,
      rightKneeFlexion: base.rightKneeFlexion,
      torsoYOffset: base.torsoYOffset,

      // Slight forward lean (less dramatic than before — coronal lean is the primary feature now)
      torsoRotation: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -5.0), weight: 15),
        TweenSequenceItem(tween: Tween(begin: -5.0, end: -3.0), weight: 35),
        TweenSequenceItem(tween: Tween(begin: -3.0, end: 0.0), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 30),
      ]),

      // LATERAL TRUNK LEAN — the defining feature of compensated Trendelenburg
      // During right stance (first 50%), trunk shifts RIGHT (positive) toward weak side
      // During left stance (last 50%), trunk returns to midline
      torsoLateralShift: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 25.0), weight: 15), // Quick lean right at IC
        TweenSequenceItem(tween: Tween(begin: 25.0, end: 20.0), weight: 35), // Hold lean during right stance
        TweenSequenceItem(tween: Tween(begin: 20.0, end: 0.0), weight: 20), // Recover at toe-off
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 30), // Normal during left stance
      ]),

      // Arms swing asymmetrically due to trunk lean
      rightShoulderFlexion: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: -10.0, end: 30.0), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 30.0, end: -10.0), weight: 50),
      ]),
    );
  }
}
