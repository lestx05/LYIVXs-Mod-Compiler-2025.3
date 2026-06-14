# LYIVX's Mod Compiler - 2025.3 Fork

This is a small MCreator API-support plugin for MCreator 2025.3 workspaces using the community Forge 1.20.1 generator. It adds an External API entry named `Use Compiled Mods`.

When enabled, the API creates and reads a workspace-root folder named `compile-mods-1.20.1`. Place compiled Forge 1.20.1 mod jars in that folder so the workspace can compile and run against them.

## Compatibility

- MCreator: 2025.3 (`supportedversions` code `2025003`)
- Minecraft: 1.20.1
- Loader: Forge
- Generator: `forge-1.20.1`
- Verified against the installed Spectrall Forge 1.20.1 Generator V1.3 package for MCreator 2025.3, whose plugin id is `generator-1.20.1` and workspace generator id is `forge-1.20.1`.

No support is claimed for MCreator 2026.1, NeoForge, Fabric, or other Minecraft versions.

## Installation

1. In MCreator, open `Preferences -> Manage plugins`.
2. Import `lyivxs-mod-compiler-2025-3.zip`.
3. Restart MCreator if prompted.
4. Open or create a Forge 1.20.1 workspace using the community Forge 1.20.1 generator.
5. Open `Workspace Settings -> External APIs`.
6. Enable `Use Compiled Mods`.
7. Regenerate code or reload the Gradle project.

## Adding Compiled Mods

Put Forge 1.20.1 compiled mod jars in this folder at the workspace root:

```text
compile-mods-1.20.1
```

Jar names must follow this pattern:

```text
modname-minecraftversion-modversion.jar
```

Example:

```text
lyivxsfurnituremod-1.20.1-0.6.1.jar
```

The Gradle logic splits the file name at the final dash. For the example above, Gradle sees:

```text
artifactId = lyivxsfurnituremod-1.20.1
version = 0.6.1
```

Badly named jars are skipped with a warning instead of crashing Gradle.

## Gradle Behavior

This fork intentionally avoids overriding the generator's `minecraft` or `legacyForge` configuration. The Spectrall 2025.3 generator owns mappings, runs, Forge version, mixins, and reobfuscation setup.

The API Gradle snippet only:

- creates `compile-mods-1.20.1` when missing
- adds a `flatDir` repository pointing at that folder
- scans `*.jar` files in the folder
- validates jar names safely
- adds valid jars as remapped mod dependencies
- makes `compileJava`, `runClient`, `runServer`, and `build` depend on the folder creation task when those tasks exist

The 2025.3 Spectrall generator uses `net.neoforged.moddev.legacyforge`, which exposes `modImplementation` for remapped Forge mod dependencies. This fork uses `modImplementation` there, and keeps a guarded `fg.deobf` fallback for older ForgeGradle-style environments.

## Known Limitations

- Dependencies of compiled mods are not resolved automatically from the jar file. If a compiled mod requires another mod or library, place that dependency in `compile-mods-1.20.1` too, or add it through another compatible Gradle/API setup.
- Client-only mods may fail on server runs if they are not safe to load server-side.
- GeckoLib-like libraries may still need the matching MCreator API/plugin if your workspace procedures or generated code need plugin-provided blocks, templates, or codegen support.
- This plugin does not convert incompatible mods. The jar must already be a Forge 1.20.1 mod.

## Troubleshooting

### The External API does not appear

Confirm the workspace uses generator id `forge-1.20.1` and that MCreator 2025.3 loaded the plugin under `Preferences -> Manage plugins`.

### The folder did not appear

Reload the Gradle project, regenerate code, or run `compileJava`, `runClient`, `runServer`, or `build`. The folder is created at the workspace root, next to `build.gradle`.

### Gradle says a jar was skipped

Rename the jar to the required pattern:

```text
modname-minecraftversion-modversion.jar
```

### Gradle cannot resolve a dependency

Check that the parsed artifact id and version match the jar name. For a jar named `examplemod-1.20.1-2.0.0.jar`, Gradle resolves `compile-mods:examplemod-1.20.1:2.0.0`.

### The game launches but the mod fails

Make sure every required dependency for that compiled mod is also available, and confirm the mod is actually built for Forge 1.20.1.

## Attribution

Original LYIVX's Mod Compiler by LYIVX and Tarantel, released under the MIT License. This fork preserves the API concept and attribution while updating the plugin metadata and Gradle injection for MCreator 2025.3 / Forge 1.20.1.

The 2024.2/2024.3/2024.4 fork by maxhaaa was inspected for compatibility context only. This fork does not copy its NeoForge additions or broader version structure.
