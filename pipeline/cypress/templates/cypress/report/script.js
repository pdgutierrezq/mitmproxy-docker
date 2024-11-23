let currentEnvironment = "dev";
const baseUrl = "http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/report";
let data = {};

async function readData(baseUrl=""){
  try {
    const response = await fetch(baseUrl+"/rpt-data.json");
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    data = await response.json();
  } catch (error) {
    console.error("Error loading");
    return [];
  }
}

async function createIframeData(filterRegex = null) {
  const envPrefix = currentEnvironment;
  const processedData = data.iframes.map(item => ({
    ...item,
    value: item.value.replace("{envPrefix}", envPrefix)
  }));

  if (filterRegex instanceof RegExp) {
    return processedData.filter(item => filterRegex.test(item.value));
  }
  return processedData;
}

async function setEnvironment(env) {
  currentEnvironment = env;
  loadPage(await createIframeData(currentEnvironment));
}

async function loadPageWithEnv() {
  const filterInput = document.getElementById("filterInput").value;
  const filter = filterInput ? new RegExp(filterInput) : null;
  loadPage(await createIframeData(filter));
}

function loadPage(iframes) {
  loadIframes(iframes);
  reloadIframes();
}

function loadIframes(iframes) {
  const content = document.getElementById("content");
  content.innerHTML = "";
  iframes.forEach(data => {
    const container = document.createElement("div");
    container.className = "iframe-container";
    container.innerHTML = `
      <input type="text" id="input${data.id}" value="${data.value}" oninput="changeIframeSrc("iframe${data.id}")">
      <iframe id="iframe${data.id}" class="iframe"></iframe>
    `;
    content.appendChild(container);
  });
}

function changeIframeSrc(iframeId) {
  const input = data.baseUrl + document.getElementById(
      `input` + iframeId.slice(-1)).value;
  document.getElementById(iframeId).src = input;
}

function reloadIframes() {
  const iframes = document.getElementsByClassName(`iframe`);
  Array.from(iframes).forEach(iframe => {
    const input = iframe.previousElementSibling;
    if (input && input.tagName === "INPUT") {
      iframe.src = data.baseUrl + input.value;
    }
  });
}

function createEnvironmentMenu() {
  const environmentSection = document.getElementById("environmentSection");

  data.environments.forEach(env => {
    const menuItem = document.createElement("div");
    menuItem.className = "menu-item";
    menuItem.onclick = () => setEnvironment(env.id);
    menuItem.textContent = env.name;
    environmentSection.appendChild(menuItem);
  });
}

function createFilterMenu() {
  const filterSection = document.getElementById("filterSection");

  data.filters.forEach(filter => {
    const menuItem = document.createElement("div");
    menuItem.className = "menu-item";
    menuItem.onclick = () => setFilter(filter.value);
    menuItem.textContent = filter.name;
    filterSection.appendChild(menuItem);
  });
}

function setFilter(filter) {
    document.getElementById("filterInput").value = filter;
    loadPageWithEnv();
}

window.onload = async function () {
  await readData(baseUrl);
  await createEnvironmentMenu();
  await createFilterMenu();
  loadPage(await createIframeData());
};
