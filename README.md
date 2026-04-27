# NP2 Kernel

Custom kernel for **Nothing Phone 2 (Pong)** with root and hiding built in.

Based on [LineageOS kernel](https://github.com/LineageOS/android_kernel_nothing_sm8475.git) (android13-5.10, sublevel 246).
Integrates [ReSukiSU](https://github.com/ReSukiSU/ReSukiSU) for root and [SuSFS](https://gitlab.com/simonpunk/susfs4ksu) for hiding.

Also the [Releases](https://github.com/MiguVT/NP2_Kernel/releases) could include builds for other kernels (e.g arter97), the workflow of them are based on the main one but with some changes, you can find them in the [branches](https://github.com/MiguVT/NP2_Kernel/branches)

## Features

- **[ReSukiSU](https://github.com/ReSukiSU/ReSukiSU)**: Kernel-level root (SukiSU-Ultra fork)
- **[SUSFS](https://gitlab.com/simonpunk/susfs4ksu)**: Hide root from banking apps, games, and safety checks

## Install

1. Download the AnyKernel3 zip from [Releases](https://github.com/MiguVT/NP2_Kernel/releases)
2. Boot into recovery (TWRP / OrangeFox)
3. Flash the zip → reboot
4. Install [ReSukiSU Manager](https://resukisu.github.io/guide/install.html#Get-manager) to manage root (Under development but recommended), you could use other KSU-based manager but no guarantee

> **Backup your stock boot image first.** Bootloader must be unlocked. Use at your own risk.

## Build it yourself

1. Fork this repo
2. Go to **Actions** → **Build NP2 Kernel** → **Run workflow**
3. Download the zip from the completed run

Two variants are built automatically:
- **ReSukiSU-SUSFS** - ReSukiSU + SUSFS (recommended)
- **ReSukiSU** - ReSukiSU only

<details>
<summary>Workflow inputs</summary>

| Input | Default | Description |
|-------|---------|-------------|
| `kernel_repo` | `LineageOS/android_kernel_nothing_sm8475` | Kernel source repo URL |
| `kernel_branch` | `lineage-23.2` | Branch to build |
| `kernel_defconfig` | `gki_defconfig` | Defconfig (relative to `arch/arm64/configs/`) |
| `extra_configs` | `vendor/waipio_GKI.config vendor/nothing/waipio_GKI.config vendor/debugfs.config` | Config fragments to merge |

</details>

## Credits

- [WildKernels](https://github.com/WildKernels/Wild_KSU) - WildKSU
- [simonpunk](https://gitlab.com/simonpunk/susfs4ksu) - SUSFS
- [osm0sis](https://github.com/osm0sis/AnyKernel3) - AnyKernel3
- [LineageOS](https://github.com/LineageOS) - Kernel source
