function formatBytes(bytes, locale) {
  if (bytes < 1024) {
    return bytes.toLocaleString(locale) + ' B';
  } else if (bytes < 1024 * 1024) {
    return formatDecimal(bytes / 1024, locale) + ' KB';
  } else if (bytes < 1024 * 1024 * 1024) {
    return formatDecimal(bytes / (1024 * 1024), locale) + ' MB';
  } else {
    return formatDecimal(bytes / (1024 * 1024 * 1024), locale) + ' GB';
  }
}

function formatDecimal(value, locale) {
  var rounded = Number(value.toFixed(1));
  if (typeof Intl !== 'undefined' && Intl.NumberFormat) {
    return new Intl.NumberFormat(locale, { minimumFractionDigits: 1, maximumFractionDigits: 1 }).format(rounded);
  }
  return rounded.toLocaleString(locale);
}
