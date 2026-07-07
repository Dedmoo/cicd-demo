#!/usr/bin/env bash
set -euo pipefail

DEPLOY_DIR="${1:-/opt/helloapi}"
PREVIOUS_DIR="${2:-/opt/helloapi.previous}"

if [ ! -d "$PREVIOUS_DIR" ]; then
  echo "Geri alinacak surum yok: $PREVIOUS_DIR"
  exit 1
fi

pkill -f "dotnet ${DEPLOY_DIR}" || true
sleep 1
rm -rf "$DEPLOY_DIR"
cp -a "$PREVIOUS_DIR" "$DEPLOY_DIR"
systemctl restart helloapi
echo "Onceki surume geri alindi: $PREVIOUS_DIR -> $DEPLOY_DIR"
