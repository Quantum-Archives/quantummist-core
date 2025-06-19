#!/bin/bash
# cleanup_quantummist.sh – Reset porządkowy serwera ND5
# Czyści śmieci, zeruje logi, blokuje porty i zapisuje raport

set -e

LOGFILE="/home/nd5/quantummist_cleanup_$(date +%F_%H-%M-%S).log"
echo "🚿 QuantumMist Cleanup – Start: $(date)" | tee $LOGFILE

# 🧹 Pliki logów i stare śmieci
echo -e "\n🧽 Usuwanie nieaktywnych logów i śladów PHP/Webmina..." | tee -a $LOGFILE
find /var/log -type f \( -name '*.log' -o -name '*.bak' -o -name '*.old' \) -exec rm -v {} \; 2>>$LOGFILE | tee -a $LOGFILE

# 🧼 Zerowanie systemowych logów binarnych (nie usuwamy ich)
echo -e "\n🧼 Zerowanie btmp, lastlog, wtmp..." | tee -a $LOGFILE
> /var/log/btmp && echo "wyczyszczono btmp" | tee -a $LOGFILE
> /var/log/wtmp && echo "wyczyszczono wtmp" | tee -a $LOGFILE
> /var/log/lastlog && echo "wyczyszczono lastlog" | tee -a $LOGFILE

# 🔥 Dezaktywacja zbędnych pakietów (opcjonalnie)
echo -e "\n📦 (Komentarz: nie usuwamy pakietów PHP/Webmin automatycznie – decyduje ND5)" | tee -a $LOGFILE

# 🔐 FIREWALL
echo -e "\n🛡️ RESET FIREWALL + otwarcie wymaganych portów" | tee -a $LOGFILE
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh        # port 22
ufw allow 5000/tcp   # Flask
ufw allow 80         # HTTP (jeśli chcesz wystawić publicznie)
ufw allow 443        # HTTPS (jeśli będzie certyfikat SSL)
ufw --force enable

ufw status verbose | tee -a $LOGFILE

# ✅ Koniec
echo -e "\n✅ QuantumMist Cleanup zakończony o: $(date)" | tee -a $LOGFILE
echo "📄 Zapisano log do: $LOGFILE"
