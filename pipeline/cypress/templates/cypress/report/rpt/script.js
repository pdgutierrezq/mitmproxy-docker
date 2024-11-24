let currentEnvironment = "dev";
let data = {};

async function readData(){
  try {
    const response = await fetch(BASE_URL+"rpt/data.json");
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

function createDynamicBody() {
  // Create main container
  const mainContainer = document.createElement('div');

  // Create top menu section
  const topMenu = document.createElement('div');
  topMenu.className = 'top-menu';

  // Create environment section
  const environmentSection = document.createElement('div');
  environmentSection.className = 'environment-section';
  environmentSection.id = 'environmentSection';
  topMenu.appendChild(environmentSection);

  // Create inner top menu
  const innerTopMenu = document.createElement('div');
  innerTopMenu.className = 'top-menu';

  // Create filter section with input and button
  const filterSection = document.createElement('div');
  filterSection.className = 'filter-section';

  const filterInput = document.createElement('input');
  filterInput.type = 'text';
  filterInput.id = 'filterInput';
  filterInput.placeholder = 'Enter filter (e.g., api, frontend, channels)';

  const applyFilter = document.createElement('div');
  applyFilter.className = 'menu-item';
  applyFilter.textContent = 'Apply Filter';
  applyFilter.onclick = loadPageWithEnv;

  filterSection.appendChild(filterInput);
  filterSection.appendChild(applyFilter);

  // Create second filter section
  const secondFilterSection = document.createElement('div');
  secondFilterSection.className = 'filter-section';
  secondFilterSection.id = 'filterSection';

  innerTopMenu.appendChild(filterSection);
  innerTopMenu.appendChild(secondFilterSection);
  topMenu.appendChild(innerTopMenu);

  // Create content section
  const content = document.createElement('div');
  content.className = 'content';
  content.id = 'content';

  // Append everything to main container
  mainContainer.appendChild(topMenu);
  mainContainer.appendChild(content);

  // Add to document body
  document.body.appendChild(mainContainer);
}


window.onload = async function () {
  await createDynamicBody();
  await readData();
  await createEnvironmentMenu();
  await createFilterMenu();
  loadPage(await createIframeData());
};
