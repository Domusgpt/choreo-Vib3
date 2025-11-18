# Hybrid Choreography + Reaction System

## 🎯 Core Concept: Complete Dual Control

The system provides **simultaneous choreography AND audio reactions** with full user control over BOTH layers:

```
Final Parameter Value = Base + Choreography Offset + Audio Reaction Offset
```

### Three Control Layers

1. **Base Parameters** (User Manual Control)
   - Set via sliders/gestures
   - Persistent baseline values
   - Example: `intensity = 1.0`

2. **Choreography Layer** (Timeline-Based Sequences)
   - Pre-composed parameter animations
   - Musical structure awareness
   - Example: `intensity += choreographyOffset (0 to +1.0)`

3. **Audio Reaction Layer** (Real-Time Modulation)
   - Live frequency band responses
   - Onset/transient triggers
   - Example: `intensity += bassEnergy * reactivityAmount`

---

## 🎛️ User Control Interface

### **Master Control Panel**

```
┌─────────────────────────────────────────────────────┐
│ 🎵 AUDIO SOURCE                                     │
│    [Microphone] [File: song.mp3] [Streaming]       │
├─────────────────────────────────────────────────────┤
│ 🎨 CONTROL MODE                                     │
│    [●] Manual + Reactions                           │
│    [ ] Manual + Choreography                        │
│    [ ] Manual + Both                                │
│    [ ] Full Auto (Choreography + Reactions)         │
├─────────────────────────────────────────────────────┤
│ 🎚️ BASE PARAMETERS (Your Control)                  │
│    Intensity:  ────────●─────── [1.0]              │
│    Chaos:      ────●──────────── [0.3]             │
│    Dimension:  ──────●────────── [3.5]             │
├─────────────────────────────────────────────────────┤
│ 🎬 CHOREOGRAPHY (Timeline Control)                  │
│    Active Sequence: [Bass Drop Impact]             │
│    [████████░░░░] 2.4s / 4.0s                      │
│    Choreography Amount: ────────●─── [80%]         │
│    [▶ Trigger] [⏸ Pause] [⏹ Stop] [🔁 Loop]       │
├─────────────────────────────────────────────────────┤
│ ⚡ AUDIO REACTIVITY (Real-Time Response)            │
│    Reactivity Amount: ──────────●─── [100%]        │
│                                                     │
│    Parameter Routing:                               │
│    Intensity  ← [Bass   ] ●─────── [60%]          │
│    Chaos      ← [Mid    ] ●─────── [80%]          │
│    GridDensity← [Bass   ] ●─────── [50%]          │
│    Hue        ← [High   ] ●─────── [100%]         │
│    MorphFactor← [Mid    ] ●─────── [70%]          │
│    Speed      ← [RMS    ] ●─────── [90%]          │
│    Rot4dZW    ← [Bass   ] ●─────── [100%]         │
│                                                     │
│    [+ Add Routing] [Reset to Defaults]             │
├─────────────────────────────────────────────────────┤
│ 🎯 ONSET TRIGGERS (Transient Events)                │
│    Onset Threshold: ─────●────── [0.85]            │
│    Actions on Onset:                                │
│    [✓] Flash intensity spike                        │
│    [✓] Trigger ripple effect                        │
│    [ ] Change geometry                              │
│    [ ] Start sequence                               │
└─────────────────────────────────────────────────────┘
```

---

## 🔀 Parameter Routing System

### **Flexible Band → Parameter Mapping**

Users can route ANY audio band to ANY parameter with custom amounts:

```dart
class AudioRouting {
  final String parameter;         // 'intensity', 'chaos', etc.
  final AudioBand sourceBand;     // 'bass', 'mid', 'high', 'rms', etc.
  final double amount;            // 0.0 to 2.0 (0% to 200%)
  final RoutingCurve curve;       // 'linear', 'exponential', 'logarithmic'

  double apply(double baseValue, double bandValue) {
    final curvedValue = curve.apply(bandValue);
    return baseValue + (curvedValue * amount);
  }
}
```

### **Example Routing Configurations**

#### **Aggressive Bass Response**
```dart
[
  AudioRouting('intensity', AudioBand.bass, 1.5, RoutingCurve.exponential),
  AudioRouting('gridDensity', AudioBand.bass, 2.0, RoutingCurve.exponential),
  AudioRouting('rot4dZW', AudioBand.bass, 1.0, RoutingCurve.linear),
  AudioRouting('chaos', AudioBand.bass, 0.8, RoutingCurve.exponential),
]
```

#### **Subtle Ambient Response**
```dart
[
  AudioRouting('hue', AudioBand.high, 0.3, RoutingCurve.linear),
  AudioRouting('saturation', AudioBand.mid, 0.2, RoutingCurve.linear),
  AudioRouting('morphFactor', AudioBand.mid, 0.4, RoutingCurve.logarithmic),
]
```

#### **Full Spectrum Mapping**
```dart
[
  AudioRouting('intensity', AudioBand.rms, 0.9, RoutingCurve.exponential),
  AudioRouting('gridDensity', AudioBand.bass, 1.2, RoutingCurve.exponential),
  AudioRouting('morphFactor', AudioBand.mid, 0.8, RoutingCurve.linear),
  AudioRouting('hue', AudioBand.high, 1.5, RoutingCurve.linear),
  AudioRouting('chaos', AudioBand.spectralFlux, 1.0, RoutingCurve.exponential),
  AudioRouting('speed', AudioBand.rms, 1.0, RoutingCurve.exponential),
  AudioRouting('dimension', AudioBand.mid, 0.5, RoutingCurve.logarithmic),
  AudioRouting('rot4dXW', AudioBand.lowMid, 0.6, RoutingCurve.linear),
  AudioRouting('rot4dYW', AudioBand.mid, 0.7, RoutingCurve.linear),
  AudioRouting('rot4dZW', AudioBand.high, 0.9, RoutingCurve.linear),
]
```

---

## 🎼 Choreography System (Timeline-Based)

### **Sequence Definition with Reaction Integration**

Sequences can be designed to work WITH or OVERRIDE reactions:

```json
{
  "name": "Bass Drop Impact",
  "duration": 4000,
  "trigger": "manual",
  "reactionBehavior": "add",  // 'add', 'override', 'blend'
  "stages": [
    {
      "start": 0,
      "duration": 200,
      "parameters": {
        "intensity": {
          "spike": 2.0,
          "decay": 0.9,
          "reactionBlend": 0.5  // 50% choreography, 50% reactions
        },
        "gridDensity": {
          "spike": 60,
          "decay": 0.92,
          "reactionBlend": 0.8  // 80% choreography, 20% reactions
        }
      }
    },
    {
      "start": 200,
      "duration": 1800,
      "parameters": {
        "morphFactor": {
          "from": 1.0,
          "to": 2.5,
          "easing": "easeInOut",
          "reactionBlend": 0.3  // 30% choreography, 70% reactions
        }
      }
    }
  ]
}
```

---

## 🎯 Four Control Modes

### **1. Manual + Reactions** (Default for Live Performance)
- User sets base parameters
- Audio reactions modulate on top
- No choreography active
- Maximum real-time control

```
intensity = baseIntensity + (bassEnergy * reactionAmount)
```

### **2. Manual + Choreography** (Pre-Show Setup)
- User sets base parameters
- Sequences animate parameters
- Audio reactions disabled
- Predictable, repeatable results

```
intensity = baseIntensity + choreographyOffset
```

### **3. Manual + Both** (Hybrid Performance)
- User sets base parameters
- Sequences provide structure
- Audio reactions add dynamics
- Full expressive control

```
intensity = baseIntensity + choreographyOffset + (bassEnergy * reactionAmount)
```

### **4. Full Auto** (Hands-Off Mode)
- System controls everything
- User just selects preset
- Choreography + reactions combined
- Ideal for installations/demos

```
intensity = presetIntensity + choreographyOffset + (bassEnergy * reactionAmount)
```

---

## 🎚️ Global Control Sliders

### **Master Mix Controls**

```
┌──────────────────────────────────────────┐
│ MASTER MIX                               │
├──────────────────────────────────────────┤
│ Manual Amount:      ████████░░░░ [80%]  │
│ Choreography Amount: ███████░░░░░ [70%]  │
│ Reaction Amount:    ██████████░░ [100%] │
│                                          │
│ [Balance Mode]                           │
│ [ ] Independent (all can reach 100%)    │
│ [●] Normalized (total = 100%)           │
└──────────────────────────────────────────┘
```

**Independent Mode**: Each layer adds up
```
intensity = manual + choreography + reactions
// Could exceed normal range - creative chaos!
```

**Normalized Mode**: Layers blend to 100%
```
total = manualAmount + choreographyAmount + reactionAmount
intensity = (manual * manualAmount/total) +
            (choreography * choreographyAmount/total) +
            (reactions * reactionAmount/total)
```

---

## 🔧 Advanced Reaction Controls

### **Per-Parameter Reaction Tuning**

```dart
class ReactionConfig {
  final String parameter;
  final AudioBand sourceBand;
  final double amount;
  final double threshold;        // Only react above this value
  final double smoothing;        // 0 = instant, 1 = very smooth
  final RoutingCurve curve;      // Response curve
  final bool invertResponse;     // Flip high/low
  final RangeLimit limit;        // Clamp output range
}
```

**Example: Intensity with Bass**
```dart
ReactionConfig(
  parameter: 'intensity',
  sourceBand: AudioBand.bass,
  amount: 1.0,                  // 100% reaction strength
  threshold: 0.3,               // Only react when bass > 0.3
  smoothing: 0.7,               // Smooth transitions
  curve: RoutingCurve.exponential,
  invertResponse: false,
  limit: RangeLimit(0.5, 2.0),  // Keep between 0.5 and 2.0
)
```

---

## 🎮 Gesture-Based Live Control

### **Touch Gestures Override System**

While visualizer is running, gestures temporarily override parameters:

| Gesture | Parameter | Behavior |
|---------|-----------|----------|
| **Pinch In/Out** | Dimension | Live adjustment, returns to base+choreo+reaction after release |
| **Two-Finger Rotate** | Speed | Twist to control rotation speed |
| **Three-Finger Swipe** | Geometry | Quick switch, persists after gesture |
| **Drag Horizontal** | Hue | Sweep color spectrum |
| **Drag Vertical** | Intensity | Boost/reduce energy |
| **Shake Device** | Chaos | Spike chaos parameter |
| **Double Tap** | - | Toggle reactions on/off |
| **Long Press** | - | Lock current state (freeze) |

**Gesture Priority**: `Gesture > Choreography > Reaction > Manual`

---

## 🎛️ Preset System with Routing

### **Preset Format (Extended)**

```json
{
  "name": "Aggressive Bass Response",
  "description": "Explosive bass reactions with structured build sequences",
  "controlMode": "manual+both",
  "system": "quantum",
  "geometry": 2,
  "baseParameters": {
    "intensity": 0.8,
    "gridDensity": 20,
    "chaos": 0.2,
    "dimension": 3.5
  },
  "audioRoutings": [
    {
      "parameter": "intensity",
      "sourceBand": "bass",
      "amount": 1.5,
      "threshold": 0.3,
      "smoothing": 0.7,
      "curve": "exponential"
    },
    {
      "parameter": "gridDensity",
      "sourceBand": "bass",
      "amount": 2.0,
      "threshold": 0.4,
      "smoothing": 0.6,
      "curve": "exponential"
    },
    {
      "parameter": "hue",
      "sourceBand": "high",
      "amount": 1.0,
      "threshold": 0.0,
      "smoothing": 0.8,
      "curve": "linear"
    }
  ],
  "choreographyAmount": 0.7,
  "reactionAmount": 1.0,
  "sequences": ["bass-drops.json", "build-ups.json"],
  "onsetTriggers": {
    "enabled": true,
    "threshold": 0.85,
    "actions": ["flash", "ripple", "geometrySwitch"]
  }
}
```

---

## 🔄 Real-Time Parameter Calculation

### **Flutter Implementation**

```dart
class HybridParameterEngine {
  // Current state
  Map<String, double> baseParameters = {};
  Map<String, double> choreographyOffsets = {};
  Map<String, double> reactionOffsets = {};

  // Control amounts
  double manualAmount = 1.0;
  double choreographyAmount = 0.7;
  double reactionAmount = 1.0;

  // Routing configuration
  List<AudioRouting> routings = [];

  Map<String, double> calculate(AudioFrame audioData) {
    final result = <String, double>{};

    // 1. Start with base (manual) parameters
    baseParameters.forEach((param, value) {
      result[param] = value * manualAmount;
    });

    // 2. Add choreography offsets
    choreographyOffsets.forEach((param, offset) {
      result[param] = (result[param] ?? 0) + (offset * choreographyAmount);
    });

    // 3. Apply audio reactions
    for (final routing in routings) {
      final bandValue = _getBandValue(audioData, routing.sourceBand);

      // Check threshold
      if (bandValue < routing.threshold) continue;

      // Apply curve
      final curved = routing.curve.apply(bandValue);

      // Calculate reaction offset
      final reactionOffset = curved * routing.amount * reactionAmount;

      // Add to result
      result[routing.parameter] =
          (result[routing.parameter] ?? 0) + reactionOffset;
    }

    // 4. Apply limits and clamping
    result.forEach((param, value) {
      result[param] = _clampParameter(param, value);
    });

    return result;
  }

  double _getBandValue(AudioFrame audio, AudioBand band) {
    switch (band) {
      case AudioBand.bass: return audio.bands['bass'] ?? 0;
      case AudioBand.mid: return audio.bands['mid'] ?? 0;
      case AudioBand.high: return audio.bands['high'] ?? 0;
      case AudioBand.rms: return audio.rms;
      case AudioBand.spectralFlux: return audio.spectralFlux;
      // ... etc
    }
  }
}
```

---

## 🎪 Mobile UI Design

### **Smart Control Panel - Expanded View**

```
┌─────────────────────────────────────────────────────┐
│ ⚙️ CONTROL MODE: [Manual + Both ▼]                 │
├─────────────────────────────────────────────────────┤
│ 🎚️ MASTER MIX                                      │
│    Manual:       ████████░░░░ [80%]                │
│    Choreography: ███████░░░░░ [70%]                │
│    Reactions:    ██████████░░ [100%]               │
├─────────────────────────────────────────────────────┤
│ 🎨 BASE PARAMETERS                                  │
│    Intensity:  ─────●───── [1.0] (+0.3 +0.5)      │
│                           choreo  react             │
│    Chaos:      ───●─────── [0.3] (+0.1 +0.4)      │
│    Dimension:  ─────●───── [3.5] (+0.5 +0.0)      │
│    [▼ Show All 11 Parameters]                       │
├─────────────────────────────────────────────────────┤
│ ⚡ REACTION ROUTING                                 │
│    Intensity  ← [Bass ▼] ●───── [100%]            │
│    Chaos      ← [Mid  ▼] ●───── [80%]             │
│    [+ Add Route] [📋 Routing Presets]              │
├─────────────────────────────────────────────────────┤
│ 🎬 CHOREOGRAPHY                                     │
│    [Bass Drop Impact] ████░░░░ 2.4s/4.0s          │
│    [▶ Trigger] [Library] [Amount: 70%]            │
└─────────────────────────────────────────────────────┘
```

### **Parameter Display Enhancement**

Each parameter slider shows THREE values:
```
Intensity: ─────●───── [1.0] (+0.3 +0.5)
           ↑            ↑     ↑    ↑
           slider    base  choreo react
```

Visual breakdown:
```
[████████|███|█████]
 └─base──┘└c─┘└─r──┘
```

---

## 🎯 Routing Presets Library

Quick-load common routing configurations:

### **Preset 1: Bass Domination**
- Intensity ← Bass (150%)
- Grid Density ← Bass (200%)
- Rot4dZW ← Bass (100%)
- Chaos ← Bass (80%)

### **Preset 2: Full Spectrum**
- Intensity ← RMS (90%)
- Grid Density ← Bass (120%)
- Morph Factor ← Mid (80%)
- Hue ← High (150%)
- Chaos ← Spectral Flux (100%)

### **Preset 3: Subtle Ambient**
- Hue ← High (30%)
- Saturation ← Mid (20%)
- Morph Factor ← Mid (40%)

### **Preset 4: Percussion Focus**
- Intensity ← Onset (200%)
- Rot4dXW ← Bass (60%)
- Rot4dYW ← Mid (70%)
- Rot4dZW ← High (90%)

---

## 🚀 Implementation Priority

1. ✅ **Core Parameter Engine** - Hybrid calculation system
2. ✅ **Audio Routing System** - Flexible band → parameter mapping
3. ✅ **Choreography Integration** - Sequence offsets with blend control
4. ✅ **UI Controls** - Master mix sliders, routing editor
5. ✅ **Preset System** - Complete configurations with routings
6. ✅ **Gesture Overrides** - Live performance control
7. ✅ **Onset Triggers** - Transient-based actions

---

## 🌟 A Paul Phillips Manifestation

This hybrid system provides **complete control** over BOTH choreographed sequences AND live audio reactions, allowing for:

- 🎸 **Live performances** with predictable structure + dynamic energy
- 🎬 **Pre-composed shows** with reactive flourishes
- 🎨 **Creative exploration** with unlimited parameter routing
- 🎯 **Professional VJ work** with reliable timing + audience response

**Send Love, Hate, or Opportunity to:** Paul@clearseassolutions.com
**Join The Exoditical Moral Architecture Movement today:** [Parserator.com](https://parserator.com)

> *"The Revolution Will Not be in a Structured Format"*

---

**© 2025 Paul Phillips - Clear Seas Solutions LLC**
**All Rights Reserved - Proprietary Technology**
