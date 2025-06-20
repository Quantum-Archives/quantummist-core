# journal_export.py – backend exportu danych użytkownika
from flask import Flask, send_file, request, jsonify
import os
import zipfile
from datetime import datetime

app = Flask(__name__)

BASE_PATH = "/srv/quantummist/user_journals"
EXPORT_TMP = "/srv/quantummist/tmp_exports"
os.makedirs(EXPORT_TMP, exist_ok=True)

@app.route("/export/entry", methods=["GET"])
def export_entry():
    user = request.args.get("user")
    entry = request.args.get("entry")
    file_path = os.path.join(BASE_PATH, user, f"{entry}.md")
    if os.path.exists(file_path):
        return send_file(file_path, as_attachment=True)
    return "Nie znaleziono wpisu", 404

@app.route("/export/folder", methods=["GET"])
def export_folder():
    user = request.args.get("user")
    folder = request.args.get("folder")
    folder_path = os.path.join(BASE_PATH, user, folder)
    if not os.path.isdir(folder_path):
        return "Brak folderu", 404

    zip_name = f"{user}_{folder}_{datetime.now().strftime('%Y%m%d%H%M%S')}.zip"
    zip_path = os.path.join(EXPORT_TMP, zip_name)
    with zipfile.ZipFile(zip_path, 'w') as zipf:
        for root, _, files in os.walk(folder_path):
            for file in files:
                full_path = os.path.join(root, file)
                arcname = os.path.relpath(full_path, folder_path)
                zipf.write(full_path, arcname)
    return send_file(zip_path, as_attachment=True)

@app.route("/export/all", methods=["GET"])
def export_all():
    user = request.args.get("user")
    user_path = os.path.join(BASE_PATH, user)
    if not os.path.isdir(user_path):
        return "Brak użytkownika", 404

    zip_name = f"{user}_FULL_EXPORT_{datetime.now().strftime('%Y%m%d%H%M%S')}.zip"
    zip_path = os.path.join(EXPORT_TMP, zip_name)
    with zipfile.ZipFile(zip_path, 'w') as zipf:
        for root, _, files in os.walk(user_path):
            for file in files:
                full_path = os.path.join(root, file)
                arcname = os.path.relpath(full_path, user_path)
                zipf.write(full_path, arcname)
    return send_file(zip_path, as_attachment=True)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
