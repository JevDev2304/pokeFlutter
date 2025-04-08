import 'package:flutter/material.dart';
import 'package:poke_flutter/models/games_model.dart';

class PokemonGameProvider extends ChangeNotifier {
  final List<PokemonGame> _games = pokemonGames; // Your predefined list
  final List<PokemonGame> _filteredGames = []; // List for filtered games
  List<PokemonGame> get filteredGames =>
      _filteredGames; // Getter for filtered games
  List<PokemonGame> get games => _games; // Getter to access the games
  void filterGamesByName(String name) {
    _filteredGames.clear();
    if (name.isEmpty) {
      notifyListeners();
      return;
    } else {
      _filteredGames.addAll(
        _games.where(
          (game) => game.name.toLowerCase().contains(name.toLowerCase()),
        ),
      );
      notifyListeners();
      return;
    }
  }
}
