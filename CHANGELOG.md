# Changelog

## Unreleased

No unreleased changes.

## 1.2.3-2025.3

- Added a Gradle compatibility check that warns when compiled mod JARs include mixin configs without refmaps.
- Documented runtime mixin crashes such as `No refMap loaded`, `MixinApplyError`, and `Critical injection failure`.
- Updated the plugin metadata version for the next installable release.

## 1.2.2-2025.3

- Replaced free-form Markdown issue templates with guided GitHub Issue Forms.
- Added a usage-question form for install, JAR naming, folder, dependency, and Gradle help.
- Added issue-template contact links for the latest release and general MCreator support.
- Replaced the old ForgeGradle `fg.deobf(...)` dependency call with ModDevGradle's `modImplementation` configuration for MCreator 2025.3 Forge 1.20.1 workspaces.
- Fixed the plugin metadata version for the next installable release.

## 1.2.1-2025.3

- Allowed compiled mod JAR versions with hyphens, such as `forge-15.20.0.105`.
- Created `compile-mods-1.20.1` during Gradle configuration so the folder appears after enabling the API.
- Cleaned Gradle folder-creation formatting.
- Fixed small README wording issues around API support and JAR naming.
- Updated the compatibility issue template to use an existing GitHub label.

## 1.2.0-2025.3

- Simplified the public repository layout.
- Moved user and release instructions into `README.md`.
- Removed empty or duplicate folders from the tracked source.
- Standardized the MIT license text so GitHub can detect it.
- Updated the packaging workflow to call the local Bash package script.
- Tightened compiled mod JAR filename validation for Forge 1.20.1.

- Ported the plugin metadata to MCreator 2025.3.
- Updated `supportedversions` to `[2025003]`.
- Added `plugin/plugin.json` as the release manifest.
- Added `plugin/apis/use_compiled_mods.yaml` as the installable API definition.
- Targeted the `forge-1.20.1` workspace generator ID.
- Added automatic creation of the `compile-mods-1.20.1` workspace folder.
- Added a `flatDir` repository pointing to `compile-mods-1.20.1`.
- Added safe scanning for compiled `.jar` files in `compile-mods-1.20.1`.
- Replaced the old strict filename assertion behavior with safer JAR filename validation and Gradle warnings.
