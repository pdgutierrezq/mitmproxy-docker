function loadPage(pageUrl) {
  fetch(pageUrl)
  .then(response => response.text())
  .then(data => {
    document.getElementById(`content`).innerHTML = data;
  });
}

function changeIframeSrc(iframeId) {
  const input = document.getElementById(`input` + iframeId.slice(-1)).value;
  document.getElementById(iframeId).src = input;
}

function loadPage(pageUrl) {
  fetch(pageUrl)
  .then(response => response.text())
  .then(data => {
    document.getElementById(`content`).innerHTML = data;
  });
}

window.onload = function() {
  document.getElementById(`iframe1`).src = document.getElementById(`input1`).value;
  document.getElementById(`iframe2`).src = document.getElementById(`input2`).value;
  document.getElementById(`iframe3`).src = document.getElementById(`input3`).value;
  document.getElementById(`iframe4`).src = document.getElementById(`input4`).value;
  document.getElementById(`iframe5`).src = document.getElementById(`input5`).value;
  document.getElementById(`iframe6`).src = document.getElementById(`input6`).value;
  document.getElementById(`iframe7`).src = document.getElementById(`input7`).value;
  loadPage(`dev.html`)
};
