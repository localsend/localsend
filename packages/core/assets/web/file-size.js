function formatBytes(bytes) {
  if (bytes < 1024) {
    return bytes.toLocaleString() + ' B';
  } else if (bytes < 1024 * 1024) {
    return formatDecimal(bytes / 1024) + ' KB';
  } else if (bytes < 1024 * 1024 * 1024) {
    return formatDecimal(bytes / (1024 * 1024)) + ' MB';
  } else {
    return formatDecimal(bytes / (1024 * 1024 * 1024)) + ' GB';
  }
}

function formatDecimal(value) {
  var rounded = Number(value.toFixed(1));
  if (typeof Intl !== 'undefined' && Intl.NumberFormat) {
    return new Intl.NumberFormat(undefined, { minimumFractionDigits: 1, maximumFractionDigits: 1 }).format(rounded);
  }
  return rounded.toLocaleString();
}
