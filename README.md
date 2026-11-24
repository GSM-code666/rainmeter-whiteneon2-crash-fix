# WhiteNeon 2 Dock (v1.1 — Performance Edition)

A lightweight, customizable macOS-style application dock for **Rainmeter**, engineered for **0% idle CPU usage**, smooth 60 FPS Lua hover animations, and unlimited icon scalability.

## Features

* **0% Idle CPU Usage:** `HoverAnim.lua` automatically puts itself to sleep (`!DisableMeasure`) whenever the cursor leaves the dock and wakes on hover—consuming `0%` CPU while gaming or idling.
* **Dynamic Icon Scaling (No Hardcoded Limits):** Automatically detects any number of `[MeterIconN]` entries (`MeterIcon1` through `MeterIcon100`) and reads their exact base `X`, `Y`, and `W` coordinates directly from `Dock.ini`.
* **Legacy `ActionTimer` Removed:** Replaced heavy legacy `ActionTimer.dll` measures with a single clean Lua script to eliminate skin freezes and memory leaks.
* **Safe Double-Click Shutdown:** Built-in native double-click shutdown trigger (`conhost.exe --headless`) prevents accidental single-click shutdowns without console flashes or deprecated VBScript warnings.

## Installation

### Method 1: One-Click `.rmskin` Installer (Recommended)
1. Download the latest `WhiteNeon_2_Dock_v1.1.rmskin` from the **[Releases](../../releases)** page.
2. Double-click the `.rmskin` file and click **Install**.
3. The dock will load automatically on your desktop.

### Method 2: Manual Installation
1. Download or clone this repository into `Documents\Rainmeter\Skins\WhiteNeon 2\`.
2. Right-click the Rainmeter tray icon → **Refresh all**.
3. Load `WhiteNeon 2\Dock\Dock.ini` from the **Manage Rainmeter** window.

## Customization

1. Right-click the dock and select **Edit skin** to open `Dock.ini`.
2. Under `[Variables]`, update `LocationPath1`–`LocationPath10` with your preferred folders, executables, or Windows URI commands (`ms-settings:`, `ms-windows-store:`).
3. To add more icons, copy any `[MeterIcon]` block, increment the number (`[MeterIcon12]`, `[MeterIcon13]`, etc.), adjust its `X` position, and update `SetHover(N, 1)` / `SetHover(N, 0)`—`HoverAnim.lua` detects new icons automatically.
4. Save `Dock.ini` and click **Refresh skin**.

## Credits & Attribution

* **Original Skin:** Dock adapted from [WhiteNeon2](https://www.deviantart.com/shorbete/art/WhiteNeon2-944470230) by **shorbete**, originally based on the dock from **Simple Epoca** by **Hiphopium**.
* **v1.1 Optimization & Lua Rewrite:** Rewritten hover animation engine (`HoverAnim.lua`), 0% idle auto-disable logic, `ActionTimer` removal and native double-click shutdown by **[GSM-code666](https://github.com/GSM-code666)**.
* **Disclaimer:** Shared free of cost for personal desktop customization. All third-party application logos remain the property of their respective trademark owners.
