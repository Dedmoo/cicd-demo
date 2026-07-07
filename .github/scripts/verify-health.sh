#!/usr/bin/env bash
set -euo pipefail

HEALTH_URL="${1:-http://127.0.0.1:5191/health}"
MAX_ATTEMPTS="${2:-12}"
SLEEP_SECONDS="${3:-5}"

for attempt in $(seq 1 "$MAX_ATTEMPTS"); do
  RESPONSE=$(curl -fsS --max-time 10 "$HEALTH_URL" 2>/dev/null || true)
  if echo "$RESPONSE" | grep -q '"status":"ok"'; then
    echo "Health check basarili (deneme $attempt/$MAX_ATTEMPTS)"
    exit 0
  fi
  echo "Health check basarisiz (deneme $attempt/$MAX_ATTEMPTS), ${SLEEP_SECONDS}s bekleniyor..."
  sleep "$SLEEP_SECONDS"
done

echo "Health check $MAX_ATTEMPTS denemeden sonra basarisiz: $HEALTH_URL"
exit 1
