const iframes = [
  { id: 1, value: "bavv-pasivo-qa-api-dev/Test" },
  { id: 2, value: "bavv-pasivo-qa-frontend-dev-cda/Serenity" },
  { id: 3, value: "bavv-pasivo-qa-frontend-dev-cdt/Serenity" },
  { id: 4, value: "bavv-pasivo-qa-frontend-dev-cncc/Serenity" },
  { id: 5, value: "bavv-pasivo-qa-frontend-dev-cnsc/Serenity" },
  { id: 6, value: "bavv-pasivo-qa-frontend-dev-cpcol/Serenity" },
  { id: 7, value: "bavv-pasivo-qa-frontend-dev-deposit/Serenity" },
  { id: 8, value: "bavv-pasivo-qa-api-dev-channels/Test" },
  { id: 9, value: "bavv-pasivo-qa-frontend-dev-channels-cda/Serenity" },
  { id: 10, value: "bavv-pasivo-qa-frontend-dev-channels-cdt/Serenity" },
  { id: 11, value: "bavv-pasivo-qa-frontend-dev-channels-cnsc/Serenity" },
  { id: 12, value: "bavv-pasivo-qa-frontend-dev-deposit-mfe/Serenity" }
];

function loadPage(pageUrl, iframes) {
  loadIframes(iframes)
  if (pageUrl === `stg`) {
    for (let i = 1; i <= iframes.length; i++) {
      const inputField = document.getElementById(`input` + i);
      inputField.value = inputField.value.replace(`dev`, `stg`);
    }
  } else {
    for (let i = 1; i <= iframes.length; i++) {
      const inputField = document.getElementById(`input` + i);
      inputField.value = inputField.value.replace(`stg`, `dev`);
    }
  }
  reloadIframes(iframes.length);
}

function loadIframes(iframes) {
  const content = document.getElementById('content');
  iframes.forEach(data => {
    const container = document.createElement('div');
    container.className = 'iframe-container';
    container.innerHTML = `
      <input type="text" id="input${data.id}" value="${data.value}" oninput="changeIframeSrc('iframe${data.id}')">
      <iframe id="iframe${data.id}" class="iframe"></iframe>
    `;
    content.appendChild(container);
  });
}

function changeIframeSrc(iframeId) {
  const baseUrl = "https://jenkins.rb-pre-ops.net/view/bavv-pasivo-qa/job/";
  const input = baseUrl + document.getElementById(
      `input` + iframeId.slice(-1)).value;
  document.getElementById(iframeId).src = input;
}

function reloadIframes(iframesNumber) {
  const baseUrl = "https://jenkins.rb-pre-ops.net/view/bavv-pasivo-qa/job/";
  for (let i = 1; i <= iframesNumber; i++) {
    document.getElementById(`iframe` + i).src = baseUrl
        + document.getElementById(`input` + i).value;
  }
}

window.onload = function () {
  loadPage(`dev`,iframes);
};
