# Changelog

## Unreleased

- Simplified the public repository layout.
- Moved user and release instructions into `README.md`.
- Removed empty or duplicate folders from the tracked source.
- Standardized the MIT license text so GitHub can detect it.
- Updated the packaging workflow to call the local Bash package script.
- Tightened compiled mod jar filename validation for Forge 1.20.1.

## 1.2.0-2025.3

- Ported the plugin metadata to MCreator 2025.3.
- Updated `supportedversions` to `[2025003]`.
- Added `plugin/plugin.json` as the release manifest.
- Added `plugin/apis/use_compiled_mods.yaml` as the installable API definition.
- Targeted the `forge-1.20.1` workspace generator ID.
- Added automatic creation of the `compile-mods-1.20.1` workspace folder.
- Added a `flatDir` repository pointing to `compile-mods-1.20.1`.
- Added safe scanning for compiled `.jar` files in `compile-mods-1.20.1`.
- Replaced the old hard jar-name assertion behavior with safer jar-name validation and Gradle warnings.
