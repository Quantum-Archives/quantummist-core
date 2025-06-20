# 🚀 README_DEPLOY.md – QuantumMist: Instrukcja uruchomienia

> Kompletna instrukcja uruchomienia i wdrożenia projektu QuantumMist z panelem Ishkarima, serwerem Flask i strukturą plików

---

## 📦 Wymagania
- Linux (Ubuntu 20.04 lub wyżej)
- Python 3.9+
- pip, Flask
- nginx (opcjonalnie do reverse proxy)
- dostęp `sudo`

---

## 📁 Struktura projektu `/srv/quantummist`
```
quantummist/
├── templates/                 # HTML (index, panel, section view)
├── static/
│   ├── css/                  # style.css
│   ├── scripts/              # render.js, menu.js
├── scripts/                  # admin.js, funkcje logiki
├── sections/                 # tarot, horoskop, numerologia
├── aerendal/                 # strefa wewnętrzna ND5
├── admin/
│   ├── panel/                # ishkarim_admin_panel_ui.html
│   ├── config/               # admin_config.json, slot_visibility.json
│   └── logs/, uploads/       # miejsce na przyszłe dane
├── main.py                   # serwer Flask
```

---

## 🔧 Krok po kroku

### 1. 🔥 Instalacja Flask
```bash
sudo apt update
sudo apt install python3-pip -y
pip3 install flask
```

### 2. 📥 Skopiuj projekt na serwer
Wgraj cały folder `quantummist/` do:
```
/srv/quantummist/
```

### 3. 🎛️ Uruchom serwer
```bash
cd /srv/quantummist
python3 main.py
```

Strona będzie działać pod:
```
http://YOUR_SERVER_IP:5000/index
```

### 4. 🔐 (Opcjonalnie) Reverse proxy z nginx + SSL
Plik `nginx.conf` (dostępny w osobnym dzienniku) może służyć jako konfiguracja do podpięcia pod domenę i HTTPS.

---

## ✅ Testy funkcjonalności
| Element | Adres | Opis |
|--------|-------|------|
| Strona główna | `/index` | Start QuantumMist |
| Panel Ishkarima | `/admin/panel/ishkarim_admin_panel_ui.html` | Admin slot + preview |
| Sekcje (`.md`) | `/section_view.html` | Render wpisów z index.json |

---

## 🧠 Dodatkowe skrypty
- `setup.sh` – przygotowanie serwera
- `upload_public_site.sh` – przerzut plików frontend
- `check_server_files.sh`, `purge_old_files.sh` – diagnostyka i cleanup

---

## 🔚 Gotowe
QuantumMist uruchomiony.  
Dalsze kroki: AI, rozbudowa UI, synchronizacja z backendem Ishkarima.

ND5 może działać.
System gotowy do aktywacji rytmów użytkownika 😎
