from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
import os
import hashlib
from typing import Optional

app = FastAPI(title="Ishkarim Hybrid Core")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"message": "Witaj w Hybrydzie Ishkarim - Core AI API działa"}

@app.get("/scribe/init")
def scribe_init():
    folder_path = "data/folder_structure.txt"
    try:
        with open(folder_path, "r", encoding="utf-8") as f:
            content = f.read()
        return {
            "status": "Scribe initiated",
            "file_loaded": True,
            "content_preview": content[:500]
        }
    except FileNotFoundError:
        return {
            "status": "Scribe initiated",
            "file_loaded": False,
            "error": f"Nie znaleziono pliku: {folder_path}"
        }

@app.get("/scribe/logs")
def scribe_list_logs():
    logs_path = "journals/"
    if not os.path.exists(logs_path):
        return {"status": "Brak folderu journals/", "logs": []}
    logs = [f for f in os.listdir(logs_path) if f.endswith(".md") or f.endswith(".txt")]
    return {"status": "Znaleziono", "logs": logs}

@app.get("/scribe/read")
def scribe_read_log(name: str = Query(..., description="Nazwa pliku do odczytu")):
    filepath = f"journals/{name}"
    if not os.path.exists(filepath):
        raise HTTPException(status_code=404, detail="Nie znaleziono pliku")
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()
    return {"status": "Odczytano", "content": content}

@app.post("/scribe/write")
def scribe_write_log(name: str = Query(...), content: str = Query(...)):
    filepath = f"journals/{name}"
    os.makedirs("journals", exist_ok=True)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    return {"status": "Zapisano", "file": filepath}

@app.post("/scribe/append")
def scribe_append_log(name: str = Query(...), content: str = Query(...)):
    filepath = f"journals/{name}"
    if not os.path.exists(filepath):
        raise HTTPException(status_code=404, detail="Nie znaleziono pliku")
    with open(filepath, "a", encoding="utf-8") as f:
        f.write("\n" + content)
    return {"status": "Dopisano", "file": filepath}

@app.post("/scribe/rename")
def scribe_rename_log(old_name: str = Query(...), new_name: str = Query(...)):
    old_path = f"journals/{old_name}"
    new_path = f"journals/{new_name}"
    if not os.path.exists(old_path):
        raise HTTPException(status_code=404, detail="Nie znaleziono starego pliku")
    os.rename(old_path, new_path)
    return {"status": "Zmieniono nazwę", "nowa_nazwa": new_path}

@app.delete("/scribe/delete")
def scribe_delete_log(name: str = Query(...)):
    filepath = f"journals/{name}"
    if not os.path.exists(filepath):
        raise HTTPException(status_code=404, detail="Nie znaleziono pliku")
    os.remove(filepath)
    return {"status": "Usunięto plik", "file": name}

@app.get("/lab/test_modal")
def lab_test():
    return {"status": "Test modal rendering initiated"}

@app.get("/watcher/scan")
def watcher_scan():
    base_structure_file = "data/folder_structure.txt"
    if not os.path.exists(base_structure_file):
        return {"status": "Brak pliku bazowego do porównania."}

    with open(base_structure_file, "r", encoding="utf-8") as f:
        expected_structure = [line.strip() for line in f.readlines() if line.strip()]

    missing_paths = []
    for path in expected_structure:
        if not os.path.exists(path):
            missing_paths.append(path)

    return {
        "status": "Scan completed",
        "expected_paths": len(expected_structure),
        "missing": missing_paths,
        "missing_count": len(missing_paths)
    }

@app.post("/watcher/create-missing")
def watcher_create_missing():
    base_structure_file = "data/folder_structure.txt"
    if not os.path.exists(base_structure_file):
        return {"status": "Brak pliku bazowego do odtworzenia."}

    with open(base_structure_file, "r", encoding="utf-8") as f:
        expected_structure = [line.strip() for line in f.readlines() if line.strip()]

    created = []
    for path in expected_structure:
        if not os.path.exists(path):
            if "." in os.path.basename(path):
                os.makedirs(os.path.dirname(path), exist_ok=True)
                with open(path, "w", encoding="utf-8") as file:
                    file.write("")
            else:
                os.makedirs(path, exist_ok=True)
            created.append(path)

    return {
        "status": "Created missing paths",
        "created_count": len(created),
        "created": created
    }

@app.get("/watcher/report")
def watcher_report():
    summary_file = "logs/watcher_summary.log"
    os.makedirs("logs", exist_ok=True)
    result = watcher_scan()
    with open(summary_file, "w", encoding="utf-8") as f:
        f.write("WATCHER SCAN REPORT\n")
        f.write(f"Expected paths: {result['expected_paths']}\n")
        f.write(f"Missing count: {result['missing_count']}\n")
        for missing in result['missing']:
            f.write(f"- {missing}\n")
    return {"status": "Report saved", "report_path": summary_file}

@app.get("/watcher/logs")
def watcher_logs():
    logs_dir = "logs/"
    if not os.path.exists(logs_dir):
        return {"status": "Brak folderu logs/", "files": []}
    files = [f for f in os.listdir(logs_dir) if f.endswith(".log") or f.endswith(".txt")]
    return {"status": "Znaleziono", "files": files}

@app.get("/watcher/alert-system")
def watcher_alert_system(threshold_missing: int = 5):
    result = watcher_scan()
    if result["missing_count"] >= threshold_missing:
        return {
            "alert": True,
            "message": f"Wykryto {result['missing_count']} brakujących plików!",
            "details": result
        }
    return {"alert": False, "message": "Brak istotnych braków", "details": result}

@app.get("/health")
def health_check():
    return {"status": "OK", "hybrid_mode": True, "ai_local": True, "internet_access": True}
