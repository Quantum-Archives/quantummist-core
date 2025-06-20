#!/bin/bash
# upload_panel_files.sh – Wgrywanie plików panelu Ishkarima do struktury serwera

set -e
SOURCE_DIR="/home/nd5/Pobrane/Panel Ishkarim"
DEST_ROOT="/srv/quantummist"

# Pliki HTML/JS do panelu
cp -v "$SOURCE_DIR/ishkarim_admin_panel_ui.html" "$DEST_ROOT/admin/panel/"
cp -v "$SOURCE_DIR/admin.js" "$DEST_ROOT/scripts/"
cp -v "$SOURCE_DIR/admin_config.json" "$DEST_ROOT/admin/config/"

# Pliki markdown (.txt → .md)
TXT_MD=(
  "fazy_rozkładow.txt:fazy_rozkładów.md:/sections/tarot/zadaniowiec/"
  "struktury_arkana.txt:struktury_arkana.md:/sections/tarot/zadaniowiec/"
  "kronika_samotnosci.txt:kronika_samotnosci.md:/aerendal/teksty/"
  "przeplywy_karmiczne.txt:przeplywy_karmiczne.md:/aerendal/teksty/"
  "przytoczenia.txt:przytoczenia.md:/aerendal/teksty/"
)

for entry in "${TXT_MD[@]}"; do
  IFS=":" read -r src dest path <<< "$entry"
  cp -v "$SOURCE_DIR/$src" "$DEST_ROOT$path$dest"
done

# Pozostałe pliki konfiguracyjne
cp -v "$SOURCE_DIR/sections_index.json" "$DEST_ROOT/admin/config/"
cp -v "$SOURCE_DIR/section_tarot_zadaniowiec_index.json" "$DEST_ROOT/sections/tarot/zadaniowiec/index.json"
cp -v "$SOURCE_DIR/aerendal_index.json" "$DEST_ROOT/aerendal/aerendal_index.json"

# Potwierdzenie
echo "✅ Wszystkie pliki zostały skopiowane."
