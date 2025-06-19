// ishkarim:admin:admin.js
// Skrypt zarządzający widokiem panelu admina ND5

fetch("/admin/config/admin_config.json")
  .then(res => res.json())
  .then(data => {
    const sectionList = document.getElementById("section-list");
    data.sections.forEach(section => {
      const wrapper = document.createElement("div");
      wrapper.className = "bg-white/10 p-3 rounded border border-white/10";
      const title = document.createElement("h3");
      title.innerText = `📂 ${section.title}`;
      title.className = "font-semibold mb-2";
      wrapper.appendChild(title);

      const ul = document.createElement("ul");
      section.styles.forEach(style => {
        const li = document.createElement("li");
        li.innerHTML = `🌀 <strong>${style}</strong> – <code>${section.basePath + style}/index.json</code>`;
        ul.appendChild(li);
      });

      wrapper.appendChild(ul);
      sectionList.appendChild(wrapper);
    });
  });
