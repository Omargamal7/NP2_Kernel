#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <base-boot.img> <output-boot.img>" >&2
  exit 2
fi

base_boot="$1"
output_boot="$2"
image="${KERNEL_DIR:-kernel}/out/arch/arm64/boot/Image"
magiskboot="${ANYKERNEL_DIR:-AnyKernel3}/tools/magiskboot"
repo_root="$(pwd)"

for file in "$base_boot" "$image" "$magiskboot"; do
  if [ ! -f "$file" ]; then
    echo "Required file missing: $file" >&2
    exit 1
  fi
done

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
cp "$base_boot" "$workdir/base-boot.img"

pushd "$workdir" >/dev/null
"$magiskboot" unpack base-boot.img

if [ ! -f kernel ]; then
  echo 'The supplied image does not contain a standard boot kernel payload' >&2
  exit 1
fi

cp "$repo_root/$image" kernel
"$magiskboot" repack base-boot.img

if [ ! -f new-boot.img ]; then
  echo 'magiskboot did not produce new-boot.img' >&2
  exit 1
fi

cp new-boot.img "$repo_root/$output_boot"
popd >/dev/null

echo "Created $output_boot from the verified base boot image"
