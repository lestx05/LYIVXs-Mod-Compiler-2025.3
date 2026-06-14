$ErrorActionPreference = "Stop"

$RootDir = Resolve-Path "$PSScriptRoot\.."
$PluginDir = Join-Path $RootDir "plugin"
$DistDir = Join-Path $RootDir "dist"
$ZipName = if ($env:ZIP_NAME) { $env:ZIP_NAME } else { "lyivxs-mod-compiler-2025.3-forge-1.20.1.zip" }
$ZipPath = Join-Path $DistDir $ZipName

$RequiredFiles = @(
    (Join-Path $PluginDir "plugin.json"),
    (Join-Path $PluginDir "apis\use_compiled_mods.yaml")
)

foreach ($RequiredFile in $RequiredFiles) {
    if (!(Test-Path $RequiredFile)) {
        throw "Missing $RequiredFile"
    }
}

if (!(Test-Path $DistDir)) {
    New-Item -ItemType Directory -Path $DistDir | Out-Null
}

if (Test-Path $ZipPath) {
    Remove-Item $ZipPath
}

Compress-Archive -Path (Join-Path $PluginDir "*") -DestinationPath $ZipPath
Write-Host "Created $ZipPath"
