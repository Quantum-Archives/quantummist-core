#!/bin/bash
# upload_public_site.sh – Wgrywanie plików publicznej strony QuantumMist

set -e
SOURCE_DIR="/home/nd5/Panel Ishkarim"
DEST_ROOT="/srv/quantummist"

# HTML do templates
sudo cp -v "$SOURCE_DIR/index.html" "$DEST_ROOT/templates/"
sudo cp -v "$SOURCE_DIR/section_view.html" "$DEST_ROOT/templates/"
sudo cp -v "$SOURCE_DIR/aerendal_view.html" "$DEST_ROOT/templates/"

# Skrypty JS
sudo mkdir -p "$DEST_ROOT/scripts"
sudo cp -v "$SOURCE_DIR/render.js" "$DEST_ROOT/scripts/"

# Style (ND5 basic)
sudo mkdir -p "$DEST_ROOT/static/css"
sudo cp -v "$SOURCE_DIR/style.css" "$DEST_ROOT/static/css/"

# Obrazy (jeśli masz)
# sudo cp -v "$SOURCE_DIR/img/*" "$DEST_ROOT/static/img/"

echo "✅ Pliki publiczne zostały przesłane. Sprawdź /index po odpaleniu serwera."
