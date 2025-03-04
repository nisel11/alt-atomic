#!/bin/bash
set -euo pipefail

echo "::group:: ===$(basename "$0")==="

DEV_PACKAGES=(
  mc
  git
  hasher
  hasher-priv
  gear
  gcc
  make
  python
  patch
  rpmdevtools
  rpm-utils
  rpm-build
  rpmlint
  rpm-build-licenses
  github2spec
  mkimage
  mkimage-preinstall
)

apt-get install -y \
  "${DEV_PACKAGES[@]}"

echo "::endgroup::"
