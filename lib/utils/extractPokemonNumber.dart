int extractPokemonNumber(String url) {
  final regex = RegExp(r'/pokemon/(\d+)/');
  final match = regex.firstMatch(url);
  if (match != null) {
    return int.parse(match.group(1)!);
  }
  return -1; // Retorna -1 si no se encuentra un número
}
