#!/bin/bash
# setup.sh – Skrypt przygotowujący środowisko serwera QuantumMist

set -e

echo "🔧 Tworzenie struktury folderów..."
mkdir -p /srv/quantummist/{admin/uploads,admin/panel,admin/config,admin/logs}
mkdir -p /srv/quantummist/aerendal/teksty
mkdir -p /srv/quantummist/sections/tarot/{zadaniowiec,wrazliwy,opiekun}
mkdir -p /srv/quantummist/sections/horoskop/zadaniowiec
mkdir -p /srv/quantummist/sections/numerologia/zadaniowiec
mkdir -p /srv/quantummist/scripts
mkdir -p /srv/quantummist/static/{img,css,js}
mkdir -p /srv/quantummist/templates
mkdir -p /srv/quantummist/users

echo "📦 Instalacja środowiska Python + Flask..."
apt update && apt install -y python3 python3-pip
pip3 install flask

echo "🧠 Tworzenie pliku startowego main.py..."
cat <<EOF > /srv/quantummist/main.py
from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
    return 'QuantumMist działa!'
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

echo "✅ Serwer gotowy. Uruchom za pomocą:"
echo "cd /srv/quantummist && python3 main.py"
