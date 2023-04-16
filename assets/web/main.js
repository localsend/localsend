const BASE_URL = '/api/localsend/v1';

let i18n = {};
let sessionId = null;

async function requestFiles() {
  document.getElementById('status-text').innerText = i18n.waiting;
  const response = await fetch(
    `${BASE_URL}/receive-request`,
    {
      method: 'POST',
    },
  );

  if (response.status === 403) {
    document.getElementById('status-text').innerText = i18n.rejected;
    return;
  } else if (response.status !== 200) {
    document.getElementById('status-text').innerText = `Error: ${response.status}`;
    return;
  }

  const data = await response.json();
  const files = data.files;
  sessionId = data.sessionId;
  document.getElementById('status-text').innerText = `${i18n.files} (${Object.keys(data.files).length})`;

  document.getElementById('file-list').innerHTML = `
    <table>
      <thead>
        <tr>
          <th>${i18n.fileName}</th>
          <th>${i18n.size}</th>
        </tr>
      </thead>
      <tbody>
        ${Object.keys(files).map((key) => `
          <tr>
            <td>
              <a href="${BASE_URL}/receive?sessionId=${sessionId}&fileId=${key}" target="_blank">
                ${files[key].fileName}
              </a>
            </td>
            <td class="size-cell">
              ${formatBytes(files[key].size)}
            </td>
          </tr>
        `).join('')}
      </tbody>
    </table>
  `;
}

async function fetchI18n() {
  const response = await fetch('/i18n.json');
  i18n = await response.json();
}

async function init() {
  await fetchI18n();
  await requestFiles();
}

init();

function formatBytes(bytes) {
    if (bytes < 1024) {
      return `${bytes} B`;
    } else if (bytes < 1024 * 1024) {
      return `${(bytes / 1024).toFixed(1)} KB`;
    } else if (bytes < 1024 * 1024 * 1024) {
      return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
    } else {
      return `${(bytes / (1024 * 1024 * 1024)).toFixed(1)} GB`;
    }
}
