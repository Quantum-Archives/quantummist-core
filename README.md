# QuantumMist Core

This repository contains scripts and configuration for the QuantumMist portal.

## Structure

- `admin/` – admin panel HTML and configuration files
- `aerendal/` – texts for the Aerendal area
- `sections/` – thematic markdown sections (e.g. tarot, horoskop)
- `scripts/` – client‑side JavaScript files
- `static/` – assets such as CSS
- `templates/` – public HTML views
- `users/` – placeholder for user data

## Usage

Run `setup.sh` to prepare a target server directory. To start the test server locally run:

```bash
python3 main.py
```

Deployment helper scripts `upload_public_site.sh` and `upload_panel_files.sh` copy the
HTML, JS and configuration files to the `/srv/quantummist` structure defined in
`setup.sh`.
