<div align="center">

# ConfidenceVR 🌱

### *Practice • Progress • Connect*

An immersive, accessible WebXR application designed to help individuals overcome social anxiety and build conversational confidence through simulated social exposure, interactive dialogue, and gamified progress tracking.

[![WebXR](https://img.shields.io/badge/WebXR-Enabled-38bdf8?style=flat-square&logo=webxr&logoColor=white)](https://immersiveweb.dev/)
[![A-Frame](https://img.shields.io/badge/A--Frame-v1.5.0-ef4444?style=flat-square)](https://aframe.io/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](LICENSE)
[![Zero Build Steps](https://img.shields.io/badge/Build-Static%20HTML5-34d399?style=flat-square)](#quick-start)

[Live Demo](#quick-start) • [Scenarios](#scenarios) • [Features](#key-features) • [Controls](#controls--navigation) • [Architecture](#technical-architecture)

</div>

---

## 📌 Overview

**ConfidenceVR** provides a safe, controlled, and judgment-free environment to practice everyday social interactions at your own pace. Built directly on top of WebXR standards and **A-Frame**, the platform runs client-side in standard desktop/mobile browsers while providing full immersive 6DOF VR support for standalone headsets such as Meta Quest devices.

The project blends psychological exposure therapy principles with interactive conversational agents, voice synthesis/recognition, real-time response latency scoring, and grounding exercises for nervous system regulation.

---

## 🎯 Scenarios

| Scenario | Setting | Focus Area | Character |
|---|---|---|---|
| ☕ **Coffee Shop** | Urban café counter | Casual small talk, ordering, polite greetings | Maya (Barista) |
| 🎓 **Classroom** | University seminar | Speaking up in front of peers, active engagement | Prof. Davies |
| 💼 **Job Interview** | Formal corporate office | Structured behavioral answers, resilience, Q&A | Sarah (Hiring Manager) |
| 🎤 **Auditorium** | Large conference stage | Public speaking, pacing, dealing with audience attention | Audience Moderator |

---

## ✨ Key Features

- **Multi-Modal Conversational Interface**:
  - **Voice Input**: Integrated browser-native `SpeechRecognition` (Web Speech API) with visual mic pulsing.
  - **Spoken Audio**: Dynamic browser `SpeechSynthesis` providing audible voice responses from avatars.
  - **Quick-Reply Suggestions**: Scaffolded dialogue options for users needing immediate conversational inspiration.
  - **Text Fallback**: Standard keyboard text prompt support for quiet or non-mic environments.

- **AI Session Feedback & Coaching**:
  - Automatically assesses completion time, response counts, and response latency.
  - Generates actionable performance insights: highlights key conversational strengths and suggests areas for the next session.

- **Gamification & Analytics**:
  - Tracks practice streaks, experience points (XP), player levels, and per-scenario competency meters.
  - Unlocks milestone badges (e.g., *Zen Master*, *Coffee Connoisseur*, *Job Candidate*).
  - Persists all session records and profile preferences directly in browser `localStorage`.

- **Safety & Grounding System**:
  - **4-7-8 Breathing Overlay**: An interactive visual pacing circle providing grounding cycles when feeling overwhelmed.
  - **Panic/Emergency Exit**: Single-click or `ESC` hotkey to instantly terminate a scenario and reset to the neutral Confidence Hub.

- **Peer Multiplayer Mock Rooms**:
  - Interactive lobby interface designed for simulated peer-to-peer room connections and private meeting codes.

---

## 🎮 Controls & Navigation

### Desktop Simulator Mode
| Action | Key / Input |
|---|---|
| **Move Around** | <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> |
| **Look / Aim** | Mouse Click & Drag |
| **Interact / Select** | Mouse Left-Click on buttons and 3D objects |
| **Toggle Voice Input** | <kbd>M</kbd> or click the 🎙️ mic button |
| **Quick Jump to Scenario** | <kbd>1</kbd> (Coffee), <kbd>2</kbd> (Classroom), <kbd>3</kbd> (Interview), <kbd>4</kbd> (Auditorium) |
| **Emergency Exit to Hub** | <kbd>ESC</kbd> |

### VR / Standalone Headset Mode (e.g., Meta Quest)
- **Enter VR**: Click the headset icon in the bottom right corner of the viewport.
- **Pointer & Laser Interaction**: Point hand controller at buttons/portals and pull the **Trigger**.
- **Movement / Gaze**: Head tracking provides full 360° rotational and positional tracking.

---

## 🚀 Quick Start

ConfidenceVR is entirely client-side and requires **no build step, bundler, or package manager**.

### Option 1: Direct Local File
1. Clone or download this repository:
   ```bash
   git clone https://github.com/your-username/confidence-vr.git
   cd confidence-vr
   ```
2. Open `index.html` in any modern Chromium-based browser (Chrome, Edge, Brave, or Oculus Browser).

### Option 2: Local HTTP Server (Recommended for Web Speech & WebXR)
Some Web Speech API features and WebXR session entry require a secure origin (`localhost` or `https://`):

```bash
# Using Python 3
python3 -m http.server 8080

# Using Node.js (npx)
npx serve .
```
Navigate to `http://localhost:8080` in your browser or Meta Quest Browser.

---

## 🏗️ Technical Architecture

```
confidence-vr/
├── index.html            # Single-file WebXR application (3D Scene + HUD + App Logic)
└── README.md             # Project documentation
```

### Stack Breakdown
- **Runtime 3D Engine**: [A-Frame v1.5.0](https://aframe.io/) (Entity-Component System running on [three.js](https://threejs.org/)).
- **UI Architecture**: Glassmorphic HUD overlay layer styled with responsive CSS variables, backdrop blur filters, and flex layouts.
- **Audio & Speech**:
  - `window.webkitSpeechRecognition` / `window.SpeechRecognition`
  - `window.speechSynthesis` / `SpeechSynthesisUtterance`
- **State Management**: Zero-dependency modular JavaScript objects:
  - `DataManager`: Persistent `localStorage` wrapper.
  - `ProgressManager`: XP, level curves, and competency score calculation.
  - `ConversationManager`: Step-based branching dialogue system.
  - `VoiceManager`: Microphone capture and voice synthesis lifecycle.
  - `SceneManager`: Virtual environment swapping and camera rig translation.
  - `SafetyManager`: Interval-driven grounding breath pacing and emergency reset.

---

## ⚠️ Wellness & Safety Disclaimer

**ConfidenceVR** is an educational, self-improvement, and wellness simulator designed to practice social communication skills. **It is not medical software and is not intended to diagnose, treat, prevent, or cure clinical social anxiety disorders, panic disorders, or any mental health condition.** If you are experiencing severe anxiety or distress, please consult a licensed mental health professional.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE) — feel free to modify, extend, and deploy it for research, education, or personal use.
