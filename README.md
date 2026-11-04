# SoSison Hub

Modular Luau project for Murder Mystery 2. `loader.lua` is the public bootstrap; it downloads the generated GUI bundle from `dist/SoSisonHub.lua`.

## UI framework: WindUI
We selected [Footagesus/WindUI](https://github.com/Footagesus/WindUI), an open-source, MIT-licensed Luau UI framework. It offers themes, responsive/mobile UI, tabs, controls, notifications, dialogs and config persistence. Upstream currently labels it beta, so we will pin and test a version before release.

## Layout
- `loader.lua` — bootstrap entry point
- `src/main.lua` — GUI entry point
- `src/ui/` — window and navigation
- `src/tabs/` — 15 original feature tabs
- `src/features/` — individual feature implementations
- `src/services/` — shared game services
- `src/core/` — state, cleanup and safe callbacks
- `dist/` — generated single-file release; do not edit manually
- `docs/FEATURES.md` — migration checklist from `ww2.lua`

## Setup
1. Create a GitHub repository named `SoSison-Hub`.
2. Upload this project.
3. Replace `YOUR_GITHUB_USERNAME` in `loader.lua`.
4. Build and publish `dist/SoSisonHub.lua`.

The loader intentionally reports an error until the generated bundle is published.

## Migration scope
The feature checklist records the feature areas found in the supplied `ww2.lua`. UI and legitimate utilities will be ported. Attack automation, exploit/remote abuse and disruptive actions against other players will not be implemented as working cheats.
