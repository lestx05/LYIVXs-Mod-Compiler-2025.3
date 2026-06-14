# LYIVX's Mod Compiler - 2025.3 Fork

MCreator API-support plugin for **MCreator 2025.3** and the **Forge 1.20.1** generator. It adds an External API named **Use Compiled Mods**.

When enabled, the plugin creates and reads this folder in the MCreator workspace root:

```text
compile-mods-1.20.1/
```

Place compiled Forge 1.20.1 mod jars there so the workspace can compile and run against them.

## Compatibility

| Target | Supported |
| --- | --- |
| MCreator | 2025.3 only (`2025003`) |
| Minecraft | 1.20.1 only |
| Loader | Forge only |
| Generator ID | `forge-1.20.1` |

No support is claimed for MCreator 2026.1, NeoForge, Fabric, Quilt, Bukkit, or other Minecraft versions.

## Install

1. Download `lyivxs-mod-compiler-2025.3-forge-1.20.1.zip` from the latest GitHub Release.
2. In MCreator, open **Preferences -> Manage plugins**.
3. Click **Load plugin** and select the ZIP.
4. Restart MCreator.
5. Open a Forge 1.20.1 workspace.
6. Open **Workspace settings -> External APIs**.
7. Enable **Use Compiled Mods**.
8. Reload Gradle or run the workspace.

Do not install GitHub's source-code ZIP. The installable ZIP must contain `plugin.json` at the ZIP root:

```text
plugin.json
apis/use_compiled_mods.yaml
```

## Jar Naming

Jar files in `compile-mods-1.20.1/` must use this format:

```text
modname-1.20.1-modversion.jar
```

Good examples:

```text
examplemod-1.20.1-1.0.0.jar
lyivxsfurnituremod-1.20.1-0.6.1.jar
```

Bad examples:

```text
examplemod.jar
examplemod-forge.jar
examplemod-1.19.2-1.0.0.jar
```

If a mod needs dependencies, place those dependency jars in `compile-mods-1.20.1/` too.

## Limits

This plugin does not port mods between Minecraft versions, convert loaders, fix broken external mods, or guarantee that every Forge mod can run inside an MCreator development workspace. Mods can still fail because of missing dependencies, mixins/coremods, side-only loading issues, incompatible Forge versions, or APIs that need a dedicated MCreator plugin.

Only use compiled jars from sources you trust.

## Build Locally

PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\package-plugin.ps1
```

Bash:

```bash
bash scripts/package-plugin.sh
```

Both commands create:

```text
dist/lyivxs-mod-compiler-2025.3-forge-1.20.1.zip
```

## Release

1. Build the ZIP locally.
2. Test the ZIP in MCreator 2025.3 with a Forge 1.20.1 workspace.
3. Confirm that `Use Compiled Mods` appears in **Workspace settings -> External APIs**.
4. Confirm that `runClient` and `build` work with at least one real Forge 1.20.1 jar.
5. Push a tag such as `v1.2.0-2025.3`.

The GitHub Actions workflow packages the plugin and attaches the ZIP to the tag release.

## Credits

Original plugin by **LYIVX** and **Tarantel**. 2024.2-2024.4 compatibility fork reference by **maxhaaa**.

This fork keeps MIT attribution and targets MCreator 2025.3 / Forge 1.20.1 only.
