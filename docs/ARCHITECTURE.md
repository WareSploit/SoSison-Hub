# Architecture

## Runtime flow

1. Roblox starts `SoSisonHub.client.lua` from `StarterPlayerScripts`.
2. The loader locates `ReplicatedStorage.SoSisonHub`.
3. It loads Config, State, Logger, feature modules, and the UI adapter with `require`.
4. The UI adapter creates the WindUI window and passes tab handles to feature modules.
5. Features operate only on client-local Lighting and SoundService state.

## Why GitHub + Rojo

GitHub is the source-control and distribution location for source files. Rojo maps those files into Roblox's data model during development. The game client then requires ModuleScripts that are part of the experience. This avoids pretending that a normal Roblox LocalScript can execute arbitrary raw GitHub Lua text.

## Extension rule

Keep each feature in its own ModuleScript. Add a feature by:
- creating a module under `Features/`;
- exporting `CreateTab(window, context)`;
- requiring it in the loader;
- invoking it inside the loader's protected startup sequence.

Do not place secrets, private API keys, or privileged server logic in client modules.
