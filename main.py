# ishkarim:backend:main.py
# Główny plik backendowy dla serwera sekcji i treści markdown (Flask)

from flask import Flask, send_from_directory, jsonify, abort
import os

app = Flask(__name__)

# Ścieżki do danych
BASE_DIR = os.path.abspath(os.path.dirname(__file__))
SECTIONS_DIR = os.path.join(BASE_DIR, "sections")
AERENDAL_DIR = os.path.join(BASE_DIR, "aerendal")

@app.route("/sections/<section>/<style>/<filename>")
def get_markdown_file(section, style, filename):
    target_dir = os.path.join(SECTIONS_DIR, section, style)
    file_path = os.path.join(target_dir, filename)
    if os.path.isfile(file_path):
        return send_from_directory(target_dir, filename)
    else:
        abort(404)

@app.route("/sections/<section>/<style>/index.json")
def get_index_json(section, style):
    target_file = os.path.join(SECTIONS_DIR, section, style, "index.json")
    if os.path.isfile(target_file):
        return send_from_directory(os.path.dirname(target_file), "index.json")
    else:
        abort(404)

@app.route("/aerendal/<path:subpath>")
def serve_aerendal(subpath):
    full_path = os.path.join(AERENDAL_DIR, subpath)
    if os.path.isfile(full_path):
        return send_from_directory(os.path.dirname(full_path), os.path.basename(full_path))
    else:
        abort(404)

if __name__ == "__main__":
    app.run(debug=True, port=5000)
