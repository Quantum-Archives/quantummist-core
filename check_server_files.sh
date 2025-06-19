#!/bin/bash
# check_server_files.sh – Sprawdza zawartość wszystkich plików na serwerze i tworzy log do analizy

LOGFILE="/home/nd5/quantummist_file_audit_$(date +%F_%H-%M-%S).log"
echo "🔍 QuantumMist – Skan zawartości plikowej serwera" | tee $LOGFILE

echo -e "\n📁 Katalogi główne /srv/quantummist/" | tee -a $LOGFILE
find /srv/quantummist/ -type d | tee -a $LOGFILE

echo -e "\n📄 Lista plików wraz z wagą i rozszerzeniem" | tee -a $LOGFILE
find /srv/quantummist/ -type f -exec ls -lh {} + | awk '{print $9, "→", $5}' | tee -a $LOGFILE

echo -e "\n🗃️ Podejrzane rozszerzenia lub pozostałości (.txt, .bak, .old, .php)" | tee -a $LOGFILE
find /srv/quantummist/ -type f \( -iname "*.txt" -o -iname "*.bak" -o -iname "*.old" -o -iname "*.php" \) | tee -a $LOGFILE

# Można rozbudować o kontrolę .log i .sh w /home/nd5 też

echo -e "\n🧠 Skan zakończony. Zapisano w: $LOGFILE"
