// IMPORTANT: This script works in Internet Explorer 8!

var BASE_URL = '/api/localsend/v2';

var i18n = {};
var sessionId = sessionStorage.getItem('sessionId');
var queryParams = location.search.slice(1).split('&');
var queryPin = null;

// Parse query parameters manually for IE
for (var i = 0; i < queryParams.length; i++) {
  var pair = queryParams[i].split('=');
  if (pair[0] === 'pin') {
    queryPin = decodeURIComponent(pair[1]);
    break;
  }
}

function firstRequestFiles() {
  document.getElementById('status-text').innerText = i18n.waiting;
  var initialUrl = BASE_URL + '/prepare-download';

  if (sessionId) {
    initialUrl += '?sessionId=' + encodeURIComponent(sessionId);
    if (queryPin) {
      initialUrl += '&pin=' + encodeURIComponent(queryPin);
    }
  } else if (queryPin) {
    initialUrl += '?pin=' + encodeURIComponent(queryPin);
  }

  makeRequest(initialUrl, 'POST', function (response) {
    if (response.status === 401) {
      pinRequestFiles(true);
      return;
    }

    if (response.status === 403) {
      document.getElementById('status-text').innerText = i18n.rejected;
      return;
    }

    if (response.status === 429) {
      document.getElementById('status-text').innerText = i18n.tooManyAttempts;
      return;
    }

    if (response.status !== 200) {
      document.getElementById('status-text').innerText = 'Error: ' + response.status;
      return;
    }

    handleSuccess(response);
  });
}

function pinRequestFiles(firstAttempt) {
  var pin = prompt(i18n.enterPin + (firstAttempt ? '' : '\n' + i18n.invalidPin));
  if (!pin) {
    document.getElementById('status-text').innerText = i18n.invalidPin;
    return;
  }

  makeRequest(BASE_URL + '/prepare-download?pin=' + encodeURIComponent(pin), 'POST', function (response) {
    if (response.status === 401) {
      pinRequestFiles(false);
      return;
    }

    if (response.status === 403) {
      document.getElementById('status-text').innerText = i18n.rejected;
      return;
    }

    if (response.status === 429) {
      document.getElementById('status-text').innerText = i18n.tooManyAttempts;
      return;
    }

    if (response.status !== 200) {
      document.getElementById('status-text').innerText = 'Error: ' + response.status;
      return;
    }

    handleSuccess(response);
  });
}

function makeRequest(url, method, callback) {
  var xhr = new XMLHttpRequest();
  xhr.open(method, url, true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      callback(xhr);
    }
  };
  xhr.send();
}

function fetchI18n(then) {
  makeRequest('/i18n.json', 'GET', function (response) {
    if (response.status === 200) {
      i18n = JSON.parse(response.responseText);
      then();
    }
  });
}

function init() {
  fetchI18n(firstRequestFiles);
}

function handleSuccess(response) {
  var data = JSON.parse(response.responseText);
  var files = data.files;
  sessionId = data.sessionId;
  sessionStorage.setItem('sessionId', sessionId);

  document.getElementById('status-text').innerText = i18n.files + ' (' + getKeys(data.files).length + ')';

  // Handling file display
  handleFilesDisplay(files, sessionId);
}

function handleFilesDisplay(files, sessionId) {
  var html= '';
  var fileKeys = getKeys(files);
  for (var i = 0; i < fileKeys.length; i++) {
    var file = files[fileKeys[i]];
    html += '<a class="file-item" href="' + BASE_URL + '/download?sessionId=' + encodeURIComponent(sessionId) + '&fileId=' + encodeURIComponent(fileKeys[i]) + '">' +
        '<div class="file-index-cell">' + (i + 1) + '</div>' +
        '<div class="file-name-cell">' + escapeHtml(file.fileName) + '</div>' +
        '<div class="file-size-cell">' + formatBytes(file.size) + '</div>' +
        '</a>';
  }

  if (fileKeys.length === 1) {
    document.getElementById('single-file').innerHTML = html;
  } else {
    document.getElementById('file-list').innerHTML = html;
  }
}

function escapeHtml(text) {
  if (text === null || text === undefined) {
    return '';
  }
  var map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  };
  return String(text).replace(/[&<>"']/g, function(m) { return map[m]; });
}

function formatBytes(bytes) {
  if (bytes < 1024) {
    return bytes + ' B';
  } else if (bytes < 1024 * 1024) {
    return (bytes / 1024).toFixed(1) + ' KB';
  } else if (bytes < 1024 * 1024 * 1024) {
    return (bytes / (1024 * 1024)).toFixed(1) + ' MB';
  } else {
    return (bytes / (1024 * 1024 * 1024)).toFixed(1) + ' GB';
  }
}

function getKeys(obj) {
  var keys = [];
  for (var key in obj) {
      keys.push(key);
  }
  return keys;
}

init();
