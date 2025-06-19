#!/bin/bash
# diagnose_server.sh – Kompletny skan diagnostyczny serwera ND5
# Mordzia-style: patrzymy w strukturę atomową serwera 😏

set -e
LOGFILE="/root/quantummist_diagnose_$(date +%F_%H-%M-%S).log"
echo "📋 Rozpoczynam pełny skan serwera..." | tee $LOGFILE

# --- System ---
echo -e "\n🔍 SYSTEM INFO" | tee -a $LOGFILE
uname -a | tee -a $LOGFILE
lsb_release -a 2>/dev/null || cat /etc/*release | tee -a $LOGFILE

# --- Użytkownicy i uprawnienia ---
echo -e "\n👥 USERS & PERMISSIONS" | tee -a $LOGFILE
cut -d: -f1 /etc/passwd | tee -a $LOGFILE

# --- Otwarte porty ---
echo -e "\n🌐 OPEN PORTS" | tee -a $LOGFILE
ss -tulpen | tee -a $LOGFILE

# --- Pliki i katalogi ---
echo -e "\n🧱 FOLDER STRUCTURE (TOP LEVEL)" | tee -a $LOGFILE
ls -lah /srv/ | tee -a $LOGFILE
ls -lah /var/www/ || true | tee -a $LOGFILE

# --- Nieznane pliki i podejrzane rzeczy ---
echo -e "\n🕵️ POTENCJALNE ZOSTAWIONE ŚMIECI" | tee -a $LOGFILE
find /srv/ -type f -name "*index.html" | tee -a $LOGFILE
find /srv/ -name "*.php" | tee -a $LOGFILE
find /srv/ -name "*.bak" | tee -a $LOGFILE
find /srv/ -name "*.old" | tee -a $LOGFILE

# --- Procesy i zasoby ---
echo -e "\n⚙️ PROCESY I ZUŻYCIE" | tee -a $LOGFILE
top -b -n 1 | head -20 | tee -a $LOGFILE

# --- Pamięć i dysk ---
echo -e "\n💽 STORAGE" | tee -a $LOGFILE
df -h | tee -a $LOGFILE

# --- Zainstalowane pakiety ---
echo -e "\n📦 INSTALLED PACKAGES" | tee -a $LOGFILE
if command -v dpkg &>/dev/null; then dpkg -l | tee -a $LOGFILE
elif command -v rpm &>/dev/null; then rpm -qa | tee -a $LOGFILE
else echo "Nieznany system pakietów" | tee -a $LOGFILE
fi

# --- Logi ---
echo -e "\n📁 SYSTEM LOGS" | tee -a $LOGFILE
ls -lh /var/log/ | tee -a $LOGFILE

# --- Sieć ---
echo -e "\n🌍 SIEĆ & IP" | tee -a $LOGFILE
ip a | tee -a $LOGFILE
hostname -I | tee -a $LOGFILE

# --- Podsumowanie ---
echo -e "\n✅ SKAN ZAKOŃCZONY" | tee -a $LOGFILE
echo "📄 Raport zapisany do: $LOGFILE"
