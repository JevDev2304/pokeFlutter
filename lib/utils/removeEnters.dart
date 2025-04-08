String removeEnters(String text) {
  return text
      .replaceAll('\n', '')
      .replaceAll('\r', '')
      .replaceAll('\t', '')
      .replaceAll('  ', ' ')
      .trim();
}
