# Changelog

## 1.2.0-2025.3

- Ported to MCreator 2025.3.
- Updated plugin metadata with `supportedversions: [2025003]`.
- Updated API format to a modern YAML file under `apis/use_compiled_mods.yaml`.
- Reduced Gradle injection to avoid overriding generator `minecraft` or `legacyForge` config.
- Targeted only the confirmed `forge-1.20.1` generator id for the Spectrall Forge 1.20.1 generator.
- Replaced the old hard `assert` with safe jar-name validation and clear Gradle warnings.
- Added automatic creation of `compile-mods-1.20.1`.
- Added dependency injection through `modImplementation` for the MCreator 2025.3 Spectrall generator, with a guarded `fg.deobf` fallback for older ForgeGradle-style environments.
