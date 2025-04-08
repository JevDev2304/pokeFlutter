import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:poke_flutter/models/pokemon_model.dart';

class DetailPokemonProvider extends ChangeNotifier {
  Pokemon? _pokemon;
  bool _isLoading = false;
  String _errorMessage = '';

  Pokemon? get pokemon => _pokemon;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchPokemonDetails(int pokemonIndex) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response1 = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonIndex'),
      );
      final response2 = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonIndex'),
      );

      if (response1.statusCode == 200 && response2.statusCode == 200) {
        final data1 = json.decode(response1.body);
        final data2 = json.decode(response2.body);

        String pokedexDescription = 'No description available';
        try {
          pokedexDescription =
              data2['flavor_text_entries'].firstWhere(
                (entry) => entry['language']['name'] == 'en',
                orElse: () => {'flavor_text': 'No description available'},
              )['flavor_text'];
        } catch (_) {}

        List<String> types =
            (data1['types'] as List)
                .map((t) => t['type']['name'].toString())
                .toList();

        List<String> sprites =
            [
              data1['sprites']['front_default'],
              data1['sprites']['back_default'],
              data1['sprites']['front_shiny'],
              data1['sprites']['back_shiny'],
            ].where((sprite) => sprite != null).cast<String>().toList();

        _pokemon = Pokemon(
          pokedex_description: pokedexDescription,
          types: types,
          sprites: sprites,
        );
      } else {
        _errorMessage = 'Error al obtener los datos del Pokémon.';
      }
    } catch (e) {
      _errorMessage = 'Error de conexión o formato de datos incorrecto.';
    }

    _isLoading = false;
    notifyListeners();
  }
}
