#!/bin/bash
# quantummist_deploy.sh – ND5 Deploy Script

# 📍 Ustawienia
LOCAL_DIR="/home/aerendal/Pobrane/PanelIshkarim"
REMOTE_USER="nd5"
REMOTE_IP="49.13.135.149"
REMOTE_PATH="/srv/quantummist"
ARCHIVE_NAME="quantummist_build_$(date +%F_%H-%M-%S).tar.gz"

# 🌀 Tworzenie paczki
echo "📦 Pakowanie projektu z $LOCAL_DIR..."
tar -czf "$ARCHIVE_NAME" -C "$LOCAL_DIR" .
echo "✅ Utworzono: $ARCHIVE_NAME"

# 🚀 Wysyłka na serwer
echo "📤 Wysyłka na $REMOTE_USER@$REMOTE_IP..."
scp "$ARCHIVE_NAME" "$REMOTE_USER@$REMOTE_IP:/tmp/"

# 🔥 Zdalna instalacja
ssh "$REMOTE_USER@$REMOTE_IP" <<EOF
  echo "🧨 Czyszczenie starego katalogu: $REMOTE_PATH"
  rm -rf "$REMOTE_PATH"
  mkdir -p "$REMOTE_PATH"

  echo "📦 Rozpakowywanie paczki..."
  tar -xzf "/tmp/$ARCHIVE_NAME" -C "$REMOTE_PATH"

  echo "🧹 Usuwanie tymczasowej paczki..."
  rm "/tmp/$ARCHIVE_NAME"

  echo "🔁 Restart (jeśli istnieje usługa)..."
  sudo systemctl restart quantummist || echo "⚠️ Brak usługi – pomijam restart."
EOF

# 🧼 Lokalne czyszczenie
rm "$ARCHIVE_NAME"
echo "✅ Deploy zakończony pomyślnie. ND5."
