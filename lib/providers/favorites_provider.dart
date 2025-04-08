import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Map<String, dynamic>> favoritesPokemons = [];

  FavoritesProvider() {
    _loadFavorites();
  }

  // Cargar favoritos desde SharedPreferences
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('favorites_pokemons');
    if (jsonString != null) {
      favoritesPokemons = List<Map<String, dynamic>>.from(
        jsonDecode(jsonString),
      );
      notifyListeners();
    }
  }

  // Guardar favoritos en SharedPreferences
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(favoritesPokemons);
    await prefs.setString('favorites_pokemons', jsonString);
  }

  // Agregar un Pokémon a favoritos
  void addFavorite(Map<String, dynamic> pokemon) {
    if (!isFavorite(pokemon['name'])) {
      favoritesPokemons.add(pokemon);
      _saveFavorites();
      notifyListeners();
    }
  }

  // Eliminar un Pokémon de favoritos
  void removeFavorite(String pokemonName) {
    favoritesPokemons.removeWhere((p) => p['name'] == pokemonName);
    _saveFavorites();
    notifyListeners();
  }

  // Verificar si un Pokémon está en favoritos
  bool isFavorite(String pokemonName) {
    return favoritesPokemons.any((p) => p['name'] == pokemonName);
  }

  // Alternar favorito (agregar si no está, eliminar si ya está)
  void toggleFavorite(Map<String, dynamic> pokemon) {
    if (isFavorite(pokemon['name'])) {
      removeFavorite(pokemon['name']);
    } else {
      addFavorite(pokemon);
    }
  }
}
