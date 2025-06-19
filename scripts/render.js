// ishkarim:core:render.js
// Centralny moduł renderujący markdown i konfigurujący widoki dla sekcji tematycznych

function loadSection(sectionID, sectionStyle) {
  localStorage.setItem("section_id", sectionID);
  localStorage.setItem("section_mode", sectionStyle);
  window.location.href = "/section_view.html";
}

function loadEntryMarkdown(filePath, targetElementID = "entry-content") {
  fetch(filePath)
    .then(res => res.text())
    .then(md => {
      const html = marked.parse(md);
      document.getElementById(targetElementID).innerHTML = html;
    });
}

function blockUserInteraction(targetID = "entry-content") {
  const container = document.getElementById(targetID);
  if (container) {
    container.setAttribute("oncontextmenu", "return false");
    container.style.userSelect = "none";
  }
}

function createEntryMenu(entries, containerID = "entry-menu", basePath = "") {
  const container = document.getElementById(containerID);
  container.innerHTML = "";
  entries.forEach(entry => {
    const btn = document.createElement("button");
    btn.innerText = entry.title;
    btn.title = entry.description;
    btn.className = "px-3 py-1 bg-indigo-800 hover:bg-indigo-600 rounded text-xs";
    btn.onclick = () => loadEntryMarkdown(basePath + entry.file);
    container.appendChild(btn);
  });
}
