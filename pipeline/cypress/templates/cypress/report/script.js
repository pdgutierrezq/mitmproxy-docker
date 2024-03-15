function loadPage(pageUrl) {
  if (pageUrl === `stg`) {
    for (let i = 1; i <= 7; i++) {
      const inputField = document.getElementById(`input` + i);
      inputField.value = inputField.value.replace(`dev`, `stg`);
    }
  } else {
    for (let i = 1; i <= 7; i++) {
      const inputField = document.getElementById(`input` + i);
      inputField.value = inputField.value.replace(`stg`, `dev`);
    }
  }
  reloadIframes();
}

function changeIframeSrc(iframeId) {
  const baseUrl = "https://jenkins.rb-pre-ops.net/view/bavv-pasivo-qa/job/"
  const input = baseUrl + document.getElementById(
      `input` + iframeId.slice(-1)).value;
  document.getElementById(iframeId).src = input;
}

function reloadIframes() {
  const baseUrl = "https://jenkins.rb-pre-ops.net/view/bavv-pasivo-qa/job/"
  for (let i = 1; i <= 7; i++) {
    document.getElementById(`iframe` + i).src = baseUrl
        + document.getElementById(`input` + i).value;
  }
}

window.onload = function () {
  loadPage(`dev`);
};
