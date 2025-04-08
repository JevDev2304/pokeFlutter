class Pokemon {
  String pokedex_description;
  List<String> types;
  List<String> sprites;

  Pokemon({
    required this.pokedex_description,
    required this.types,
    required this.sprites,
  });
  factory Pokemon.fromJSON(Map<String, dynamic> json) {
    return Pokemon(
      pokedex_description: json['pokedex_description'],
      types: List<String>.from(json['types']),
      sprites: List<String>.from(json['sprites']),
    );
  }
  Map<String, dynamic> toJSON() {
    return {
      'pokedex_description': pokedex_description,
      'types': types,
      'sprites': sprites,
    };
  }
}
