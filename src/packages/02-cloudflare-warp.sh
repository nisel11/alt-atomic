#!/bin/bash
set -euo pipefail

echo "::group:: ===$(basename "$0")==="

VER=2025.1.861
TEMP_DIR="/tmp/cloudflare-warp"

mkdir "$TEMP_DIR" && cd "$TEMP_DIR"
wget https://pkg.cloudflareclient.com/pool/noble/main/c/cloudflare-warp/cloudflare-warp_${VER}.0_amd64.deb -O cloudflare-warp.deb
ar p cloudflare-warp.deb data.tar.gz | tar -xz

cp bin/* /usr/bin/
cp lib/systemd/system/warp-svc.service /usr/lib/systemd/system/

systemctl enable warp-svc

echo "Cleaning up..."
rm -rf "${TEMP_DIR}"

echo "::endgroup::"
