#!/bin/bash
# purge_old_files.sh – ND5 Cleanup Script: Usuwa śmieci, logi, pliki testowe z serwera QuantumMist

LOGFILE="/home/nd5/quantummist_purge_$(date +%F_%H-%M-%S).log"
echo "🧹 QuantumMist Cleanup Start: $(date)" | tee $LOGFILE

# Usuwamy niepotrzebne .txt (jeśli mamy już .md)
echo "\n🧾 TXT pliki (do usunięcia):" | tee -a $LOGFILE
find /srv/quantummist -type f -iname "*.txt" -exec rm -v {} \; 2>&1 | tee -a $LOGFILE

# Usuwamy pliki backupowe i stare logi
echo "\n🧼 Backupy i .bak/.old/.log niepotrzebne:" | tee -a $LOGFILE
find /srv/quantummist -type f \( -iname "*.bak" -o -iname "*.old" -o -iname "*_backup*" \) -exec rm -v {} \; 2>&1 | tee -a $LOGFILE

# Usuwanie pustych folderów
echo "\n📂 Usuwanie pustych katalogów:" | tee -a $LOGFILE
find /srv/quantummist -type d -empty -exec rmdir -v {} \; 2>&1 | tee -a $LOGFILE

# Potwierdzenie
echo "\n✅ Cleanup zakończony o: $(date)" | tee -a $LOGFILE
echo "📄 Zapisano raport do: $LOGFILE"
