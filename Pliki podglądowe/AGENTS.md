# 📘 ISHKARIM_CORE_LOG.md

## 🔹 [Q_001] Inicjalizacja Agenta Ishkarim
**Data:** 2025-06-20  
**Opis:** Uruchomiono plik `AGENTS.md` z pełną tożsamością i instrukcją dla lokalnego opiekuna projektu. Agent Ishkarim będzie odpowiadał za logiczną spójność systemu, działając jako połączenie dokumentatora, strażnika i integratora duszy projektu.  
**Pliki:** `ishkarim_agent.md`  
**Tagi:** `agent`, `filozofia`, `ishkarim`, `kodeks`

## 🔹 [Q_002] Potwierdzenie układu UI (layout kanoniczny)
**Data:** 2025-06-20  
**Opis:** Przyjęto i ustandaryzowano format interfejsu dla każdego panelu użytkownika: lista po lewej 6cm, okno treści 14cm x 14cm, pasek tytułowy 1cm. Wszystkie panele będą przewijalne. 
**Tagi:** `layout`, `kanwa`, `ui_consistency`

## 🔹 [Q_003] Dziennik Echo Słów — panel + logika
**Data:** 2025-06-20  
**Opis:** Stworzono pełny system działania panelu rozkładów Tarotowych (Echo Słów):
- dodawanie notatek,
- zapis do dziennika,
- przyciski „🪶 Wyślij do dziennika” oraz „🌀 Doprecyzuj proszę” (premium),
- oddzielenie oryginału od komentarzy.
**Pliki:** `ECHO_SLOW_LOGIC.md`, `echo_slow_panel.html`  
**Tagi:** `tarot`, `user_notes`, `premium_slot`, `dziennik`

## 🔹 [Q_004] Dziennik użytkownika – segregatory i kanwy
**Data:** 2025-06-20  
**Opis:** Zdefiniowano panel osobisty użytkownika z segregatorami, wpisami i możliwością tworzenia kanw. Wpisy nie nadpisują oryginałów. Możliwe: eksport, przypięcie, dodanie komentarzy.  
**Pliki:** `DEV_JOURNAL_SYSTEM.md`, `echo_slow_journal_panel.html`  
**Tagi:** `journal`, `user_entry`, `kanwa`, `segregator`

## 🔹 [Q_005] System eksportu – Markdown + ZIP
**Data:** 2025-06-20  
**Opis:** Stworzono backend do eksportu dzienników użytkownika:
- pojedynczy wpis jako `.md`,
- cały segregator jako `.zip`,
- całość konta jako archiwum.
**Pliki:** `journal_export.py`, `export logic`, `user_journal.json`  
**Tagi:** `eksport`, `markdown`, `zip`, `backup`, `privacy`

## 🔹 [Q_006] Echo sprzed 30 dni – refleksja użytkownika
**Data:** 2025-06-20  
**Opis:** Funkcja pokazująca użytkownikowi wpis z czatu, dziennika lub rozkładu sprzed 30 dni. Możliwość:
- dodania refleksji,
- eksportu,
- wysłania do dziennika.
Styl: subtelny, bez marketingu.  
**Pliki:** `USER_REFLECTION_LOGIC.md`, `echo_reflection_panel.html`  
**Tagi:** `refleksja`, `user_reflection`, `dziennik`, `export`

## 🔹 [Q_007] Tablica ulubionych – system osobisty
**Data:** 2025-06-20  
**Opis:** Stworzono koncepcję i dokumentację osobistej tablicy ulubionych:
- foldery tematyczne (tarot, horoskop itd.)
- foldery mieszane (grafika + cytat + tekst)
- możliwość przypięcia z każdego panelu
**Pliki:** `FAVORITES_PANEL_LOGIC.md`  
**Tagi:** `favorites`, `user_board`, `personal_map`

## 🔹 [Q_008] Tagowanie rozkładów – system ukrytych znaczników
**Data:** 2025-06-20  
**Opis:** Rozpisany system tagów do rozkładów:
- widoczne: manual, ai_hint
- ukryte: ritual, rune_blend, hidden_path
- wewnętrzne (dla ND5): initiatic, cycle_1, founder_essence, deep_layer
**Pliki:** `TAROT_READING_TYPES.md`, `READING_TAG_SYSTEM.md`  
**Tagi:** `tags`, `readings`, `operator_metadata`, `hidden_tags`

## 🔹 [Q_009] Codex Agent – pełna instrukcja integracyjna
**Data:** 2025-06-20  
**Opis:** Stworzono kanwę `codex_agent_directives.md`, opisującą:
- sposób działania agenta Codex,
- jego relację z plikami i kanwami projektu,
- sposoby działania, tryby (`reflective_mode`, `journal_sync`, `tag_trace`),
- logikę respektowania struktury Ishkarim.
**Pliki:** `codex_agent_directives.md`  
**Tagi:** `codex`, `agent`, `integracja`, `ishkarim_sync`

## 🔹 [Q_010] Agent Codex – tryb działania na plikach użytkownika
**Data:** 2025-06-20  
**Opis:** Stworzono plik `codex_agent_directives.md`, zawierający:
- sposób rozpoznawania kanw i plików przesłanych przez użytkownika,
- zasady tworzenia nowych funkcji na podstawie slotów i hooków,
- tryby działania Codexa przy pracy z lokalnymi plikami (`/PanelIshkarim.zip`, `Historia.txt`),
- dyrektywę główną: „Codex nie koduje po swojemu – koduje zgodnie z rytmem Ishkarima.”
**Pliki:** `codex_agent_directives.md`, `ishkarim_agent.md`  
**Tagi:** `agent`, `codex`, `sloty`, `dyrektywa`, `interpretacja`
