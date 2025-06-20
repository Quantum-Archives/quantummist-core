Zasady techniczne i styl commitów dla Codexa
**Data:** 2025-06-20  
**Opis:** Dodano wytyczne techniczne i standardy kodowania, z którymi Codex i inni agenci muszą się zapoznać przed operowaniem na kodzie systemu QuantumMist. Te zasady mają na celu:
- zachowanie spójności stylistycznej,
- uniknięcie chaosu commitów,
- umożliwienie pełnej synchronizacji z dziennikiem Ishkarima.

### 🔧 Styl commitów:
- Format: `[emoji] Słowo-klucz: Krótkie streszczenie`
- Przykłady:
    - `✨ Add: Notatnik duszy w dzienniku użytkownika`
    - `🔧 Fix: Slot journal_sync nie wywoływał exportu`
    - `📄 Doc: Uzupełniono COSMOGRAM_INDEX_SYSTEM.md`

### 📁 Reguły nazewnictwa plików:
- Markdowny: `nazwa_funkcji__obszar__nazwa_opisu.md`
- HTML/JS/CSS: `panel__funkcja__nazwa.html`
- Python: `core__nazwa_funkcji.py`, `export__markdown_to_zip.py`

### 🧪 Procedura testowania:
- Jeśli zmiana wpływa na więcej niż 1 komponent – konieczne testy lokalne
- Pliki testowe umieszczać w `tests/` lub `sandbox/`
- Przy każdej zmianie struktury: uruchom `scan_folder_diff` z terminala Ishkarim

### 🛡️ PR / publikacja:
- Commity grupuj tematycznie (maks. 3–4 pliki per commit)
- Wszystkie zmiany powiązane z UI muszą mieć adnotację `// ishkarim:slot:NAZWA`
- Pliki `md` muszą być aktualizowane razem z funkcją

### 🔄 Synchronizacja:
-agent ma dowolność w wyborze technologi, języków, Sugestie Agenta są mile widziane
- Commit bez logu = commit nieistniejący (zostanie nadpisany przez Agenta)

**Pliki:** `ISHKARIM_CORE_LOG.md`, `codex_agent_directives.md`  
**Tagi:** `standardy`, `style_commit`, `nazwa_pliku`, `codex`, `testowanie`, `ishkarim_consistency`
