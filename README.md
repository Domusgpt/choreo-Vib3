# Choreo-VIB3 🌌

**VIB3+ Choreography System - Multi-dimensional audio-reactive visualization with hybrid choreography + reaction control**

A revolutionary Flutter mobile app bringing professional audio-reactive 4D visualization choreography to your fingertips. Extracted from the VIB34D Choreography Engine and refactored for mobile-first touch interaction with complete control over BOTH pre-composed sequences AND live audio reactions.

---

## 🎯 What Is This?

Choreo-VIB3 is a **hybrid choreography + audio reaction system** that gives you complete control over:

1. **📱 Base Parameters** - Your manual sliders and gestures
2. **🎬 Choreography Layer** - Timeline-based pre-composed sequences with musical structure awareness
3. **⚡ Audio Reaction Layer** - Live frequency band responses with flexible routing

### The Magic Formula
```
Final Value = Base + Choreography Offset + Audio Reaction Offset
```

You control the mix of all three layers in real-time!

---

## ✨ Key Features

### **Hybrid Control System**
- ✅ **Four Control Modes**: Manual+Reactions, Manual+Choreography, Manual+Both, Full Auto
- ✅ **Flexible Audio Routing**: Map ANY audio band to ANY parameter with custom amounts
- ✅ **Master Mix Controls**: Blend manual/choreography/reaction amounts globally
- ✅ **Per-Parameter Visualization**: See base + choreo + reaction contributions in real-time

### **Professional Audio Analysis**
- ✅ **7-Band Frequency Analysis**: subBass, bass, lowMid, mid, highMid, high, air, ultraHigh
- ✅ **Spectral Features**: Centroid (brightness), Rolloff, Flux (transients), RMS (loudness)
- ✅ **Onset Detection**: Kick/snare/transient detection with threshold control
- ✅ **BPM Estimation**: Automatic tempo tracking from onset history

### **Timeline-Based Choreography**
- ✅ **Sequence System**: Pre-composed parameter animations synced to musical structure
- ✅ **Musical Awareness**: Downbeats, backbeats, measures, beat divisions
- ✅ **Memory System**: Pattern recognition, bass hit prediction, energy trend detection
- ✅ **JSON Library**: Load curated sequences (bass-drops, build-ups, breakdowns, ambient)

### **4D Rotation Patterns**
- ✅ **8 Pattern Types**: Smooth, Hyperspace Spiral, Beat-Locked, Bass Momentum, Spectral Orbit, Energy Sweep, Chaos Spin, Onset Snap
- ✅ **3 Rotation Planes**: XW, YW, ZW hyperplane control
- ✅ **Live Switching**: Change patterns on the fly

### **Smart Mobile UI**
- ✅ **Collapsed Pill**: Minimal control bar (play/pause, preset nav, swipe to expand)
- ✅ **Expanded Panel**: Full parameter control, routing editor, sequence timeline
- ✅ **Gesture Controls**: Pinch (dimension), rotate (speed), swipe (presets), shake (chaos)
- ✅ **Live Feedback**: Waveform, frequency bars, sequence timeline, performance metrics

### **VIB3+ Engine Integration**
- ✅ **24 Geometries**: Tesseract, 16-cell, 24-cell, 120-cell, 600-cell, custom polytopes
- ✅ **3 Rendering Systems**: Quantum, Faceted, Holographic
- ✅ **WebGL Performance**: 60 FPS on mobile devices
- ✅ **Vite-Built Bundle**: Optimized single-file distribution

---

## 📂 Repository Structure

```
choreo-Vib3/
├── examples/
│   ├── auto-test.html              # Automated CI/CD testing harness
│   └── ultimate-controls.html      # Complete manual control interface
├── src/
│   ├── core/
│   │   └── ChoreographyEngine.js   # Main timeline orchestrator
│   ├── choreographers/
│   │   ├── RotationChoreographer.js # 4D rotation patterns
│   │   └── ShaderChoreographer.js   # Shader parameter sequencing
│   ├── visualizers/
│   │   ├── quantum/QuantumVisualizer.js
│   │   ├── faceted/FacetedVisualizer.js
│   │   └── holographic/HolographicVisualizer.js
│   ├── audio/
│   │   └── AudioAnalyzer.js        # Professional 7-band analysis
│   ├── geometry/
│   │   └── GeometryLibrary.js      # 4D polytope definitions
│   └── sequences/
│       └── presets/
│           └── bass-drops.json     # Sequence library
├── docs/
│   ├── SYSTEM_ANALYSIS.md          # Complete system architecture analysis
│   ├── FLUTTER_IMPLEMENTATION_PLAN.md  # Mobile app development guide
│   └── HYBRID_CONTROL_SYSTEM.md    # Choreography + Reaction design
└── README.md
```

---

## 🚀 Getting Started

### **Option 1: Try the Examples (Web)**

```bash
# Clone repository
git clone https://github.com/Domusgpt/choreo-Vib3.git
cd choreo-Vib3

# Serve locally
npx http-server -p 8000

# Open in browser
# Example #8 (Auto Test):  http://localhost:8000/examples/auto-test.html
# Example #14 (Ultimate):  http://localhost:8000/examples/ultimate-controls.html
```

### **Option 2: Build Flutter Mobile App** (Coming Soon)

```bash
# Prerequisites
flutter doctor

# Setup
cd choreo-Vib3
flutter create --org com.clearseas --project-name choreo_vib3 .
flutter pub get

# Build VIB3+ Engine bundle
cd vib3-plus-engine
npm install
npm run build:mobile

# Run on device
flutter run

# Build release
flutter build apk --release
```

---

## 🎮 Control Modes

### **1. Manual + Reactions** (Live Performance)
Best for: VJ sets, live music performances

- Set base parameters with sliders/gestures
- Audio reactions modulate on top in real-time
- No choreography - pure reactive expression

### **2. Manual + Choreography** (Structured Shows)
Best for: Pre-composed shows, installations

- Set base parameters
- Sequences provide structure and timing
- No audio reactions - predictable results

### **3. Manual + Both** (Hybrid Performance)
Best for: Professional VJ work, creative performances

- Set base parameters
- Sequences provide musical structure
- Audio reactions add dynamic energy
- Full expressive control

### **4. Full Auto** (Hands-Off)
Best for: Demos, installations, background visuals

- Select a preset
- System handles everything
- Choreography + reactions combined

---

## 🎚️ Example Audio Routings

### **Bass Domination**
```javascript
{
  intensity:   bass → 150%
  gridDensity: bass → 200%
  rot4dZW:     bass → 100%
  chaos:       bass → 80%
}
```

### **Full Spectrum**
```javascript
{
  intensity:   rms         → 90%
  gridDensity: bass        → 120%
  morphFactor: mid         → 80%
  hue:         high        → 150%
  chaos:       spectralFlux→ 100%
  speed:       rms         → 100%
  rot4dXW:     lowMid      → 60%
  rot4dYW:     mid         → 70%
  rot4dZW:     high        → 90%
}
```

### **Subtle Ambient**
```javascript
{
  hue:         high → 30%
  saturation:  mid  → 20%
  morphFactor: mid  → 40%
}
```

---

## 📚 Documentation

- **[SYSTEM_ANALYSIS.md](docs/SYSTEM_ANALYSIS.md)** - Complete architecture breakdown, component analysis, WebGL integration strategy
- **[FLUTTER_IMPLEMENTATION_PLAN.md](docs/FLUTTER_IMPLEMENTATION_PLAN.md)** - Mobile app structure, models, widgets, build instructions
- **[HYBRID_CONTROL_SYSTEM.md](docs/HYBRID_CONTROL_SYSTEM.md)** - Choreography + reaction design, routing system, control modes

---

## 🎯 Example Sequence

```json
{
  "name": "Bass Drop Impact",
  "duration": 4000,
  "trigger": "manual",
  "reactionBehavior": "add",
  "stages": [
    {
      "start": 0,
      "duration": 200,
      "parameters": {
        "intensity": {
          "spike": 2.0,
          "decay": 0.9,
          "reactionBlend": 0.5
        },
        "gridDensity": {
          "spike": 60,
          "decay": 0.92,
          "reactionBlend": 0.8
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
          "reactionBlend": 0.3
        }
      }
    }
  ]
}
```

---

## 🔧 Technology Stack

### **Current (Web Examples)**
- **JavaScript ES6+** - Core choreography engine
- **WebGL** - High-performance 3D/4D rendering
- **Web Audio API** - Real-time audio analysis
- **FFT Analysis** - Frequency band extraction

### **Flutter Mobile (In Progress)**
- **Flutter/Dart** - Cross-platform mobile framework
- **flutter_audio_capture** - Audio input (mic/file)
- **fftea** - Fast Fourier Transform in Dart
- **webview_flutter** - WebGL visualizer embedding
- **provider** - State management

### **VIB3+ Engine**
- **Source**: [vib3-plus-engine](https://github.com/Domusgpt/vib3-plus-engine/tree/docs-comprehensive-documentation)
- **Build**: Vite (single bundle for mobile)
- **Features**: 24 geometries, 3 rendering systems, 16 reactive parameters

---

## 🎨 Visual Codex Integration

Leverages patterns from Paul Phillips' Visual Codex library:

- **Holographic Parallax** - Depth-based visual layering
- **Neoskeuomorphic UI** - Soft shadow control panels
- **RGB Splitting** - Glitch effects on transitions
- **4D Rotation Matrices** - Core mathematical foundation
- **MVEP Kernel** - Data-driven timeline visualization

---

## 🛠️ Development Roadmap

### **Phase 1: Foundation** ✅
- [x] Extract examples #8 and #14 from choreography engine
- [x] Extract all dependency files
- [x] Create GitHub repository
- [x] Analyze system architecture
- [x] Design hybrid choreography + reaction system

### **Phase 2: Flutter Port** (In Progress)
- [ ] Port AudioAnalyzer to Dart
- [ ] Port ChoreographyEngine to Dart
- [ ] Port RotationChoreographer to Dart
- [ ] Build VIB3+ Engine mobile bundle
- [ ] Implement WebView bridge

### **Phase 3: Smart UI** (Planned)
- [ ] Collapsed control pill
- [ ] Expanded control panel
- [ ] Gesture overlay system
- [ ] Parameter routing editor
- [ ] Preset browser

### **Phase 4: Polish** (Planned)
- [ ] Performance optimization (60 FPS)
- [ ] Battery optimization
- [ ] Preset library (10+ curated)
- [ ] Sequence library (bass-drops, build-ups, etc.)
- [ ] Integration testing

---

## 🤝 Contributing

This is a Paul Phillips Manifestation and part of the Exoditical Moral Architecture Movement. Contributions welcome!

**Areas needing help**:
- Flutter widget design (Smart UI components)
- Dart audio processing optimization
- Preset/sequence creation
- Mobile device testing
- Documentation improvements

---

## 📄 License

**© 2025 Paul Phillips - Clear Seas Solutions LLC**
**All Rights Reserved - Proprietary Technology**

For commercial licensing inquiries: Paul@clearseassolutions.com

---

## 🌟 A Paul Phillips Manifestation

**Send Love, Hate, or Opportunity to:** Paul@clearseassolutions.com
**Join The Exoditical Moral Architecture Movement today:** [Parserator.com](https://parserator.com)

> *"The Revolution Will Not be in a Structured Format"*

---

**Built with passion by Paul Phillips and the Exoditical community.**
**Pioneering 4D Geometric Processing & Multi-Dimensional UI Architecture**

🔮 4D Visualization | 🎵 Audio Choreography | 📱 Mobile-First | ⚡ Real-Time Performance
