# SoSison Hub

**Developer:** SoSison Prime  
**Version:** 0.2.0  
**Architecture:** modular Luau project, GitHub source + Rojo deployment

This is a complete starter repository for an experience you own or are authorized to develop. GitHub stores the source. Rojo syncs the source into Roblox Studio. The client `loader.client.lua` starts the modules inside the Roblox experience.

> This is not an executor exploit loader. It does not fetch raw Lua from GitHub and execute it inside a third-party game. Roblox experiences do not provide that execution model as a normal supported client API. No MM2 combat cheats, automated kills, aimbots, RemoteEvent abuse, anti-cheat bypasses, or executor APIs are included.

## Repository layout

```text
SoSison-Hub/
├── README.md
├── default.project.json
├── .gitignore
├── docs/
│   ├── ARCHITECTURE.md
│   └── FEATURES.md
└── src/
    ├── ReplicatedStorage/
    │   └── SoSisonHub/
    │       ├── Config.lua
    │       ├── Core/
    │       │   ├── Logger.lua
    │       │   └── State.lua
    │       ├── Features/
    │       │   ├── Audio.lua
    │       │   └── Lighting.lua
    │       └── UI/
    │           └── Window.lua
    └── StarterPlayer/
        └── StarterPlayerScripts/
            └── SoSisonHub.client.lua
```

## Setup

### 1. Install tools

- Install Roblox Studio.
- Install the Rojo toolchain: https://rojo.space/docs/
- Create a GitHub repository named `SoSison-Hub` and push this folder.

### 2. Add WindUI

Add the WindUI library as a `ModuleScript` named `WindUI` under `ReplicatedStorage`. Follow the library's own official installation and licensing instructions. This project intentionally does not embed or mirror third-party library source.

### 3. Sync into your own experience

From the repository root:

```bash
rojo serve
```

Connect the Rojo plugin in Roblox Studio. The project maps `src` into the Roblox data model. Test in an experience you own or are authorized to modify.

For a one-time build:

```bash
rojo build -o SoSisonHub.rbxlx
```

### 4. Update workflow

1. Edit source files locally.
2. Commit and push to GitHub.
3. Run `rojo serve` and sync the changes into your development place.
4. Publish your own experience when ready.

The loader is an in-experience bootstrap: it requires sibling ModuleScripts from `ReplicatedStorage`. It is not a remote code downloader.

## Included modules

- WindUI window and tab setup.
- Home dashboard and status notification.
- Local lighting preferences with restore.
- Audio playback for numeric Roblox audio asset IDs that you own or are authorized to use.
- Session state and simple logging.
- Central configuration and feature register.

## Compatibility notes

WindUI's API can change between releases. The UI adapter is isolated in `src/ReplicatedStorage/SoSisonHub/UI/Window.lua`, so API adjustments should be made there. Roblox audio playback is subject to asset permissions and experience settings.

## Branding

All project branding uses **SoSison Hub** and **SoSison Prime**. No Pulse Hub or legacy author branding is included.
