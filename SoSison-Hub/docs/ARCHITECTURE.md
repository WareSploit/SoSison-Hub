# Architecture
`loader.lua` downloads the generated single-file bundle from `dist/SoSisonHub.lua`. The bundle is built from modular `src/` files.
- `tabs/` creates controls and binds them to feature modules.
- `features/` implements feature groups.
- `services/` owns shared player, role, visual and server queries.
- `core/` contains state, cleanup and guarded callbacks.
Do not edit generated `dist/` files manually.
