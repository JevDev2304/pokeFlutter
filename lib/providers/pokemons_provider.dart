import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonsProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Map<String, dynamic>> _pokemons = [];
  List<Map<String, dynamic>> get pokemons => _pokemons;
  Future<void> fetchPokemons() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon?limit=1025&offset=0',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _pokemons = List<Map<String, dynamic>>.from(
          data['results'].cast<Map<String, dynamic>>(),
        );
      } else {
        _pokemons = [];
      }
    } catch (e) {
      _pokemons = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> filterPokemonsByName(String name) {
    return _pokemons
        .where(
          (pokemon) => pokemon['name'].toString().toLowerCase().contains(
            name.toLowerCase(),
          ),
        )
        .toList();
  }
}
