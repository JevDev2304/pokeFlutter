import 'package:flutter/material.dart';
import 'package:poke_flutter/providers/games_provider.dart';
import 'package:poke_flutter/widgets/game_card.dart';
import 'package:provider/provider.dart';

class Videogames extends StatefulWidget {
  const Videogames({super.key});
  @override
  _VideoGameState createState() => _VideoGameState();
}

class _VideoGameState extends State<Videogames> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    final pokemonsProvider = Provider.of<PokemonGameProvider>(
      context,
      listen: false,
    );
    // No es necesario acceder a pokemonsProvider.games aquí,
    // el Consumer lo reconstruirá cuando cambie.
    return Scaffold(
      appBar: AppBar(
        title:
            _isSearching
                ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  onChanged: (text) {
                    setState(() {
                      _searchText = text;
                      pokemonsProvider.filterGamesByName(_searchText);
                    });
                  },
                )
                : const Text('Videogames'),
        backgroundColor: Colors.white,
        actions: [
          _isSearching
              ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchController.clear();
                    _searchText = '';
                    pokemonsProvider.filterGamesByName('');
                  });
                },
              )
              : IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _isSearching = true;
                  });
                },
              ),
        ],
      ),
      body: Consumer<PokemonGameProvider>(
        builder: (context, provider, child) {
          final gamesToShow =
              _searchText.isEmpty ? provider.games : provider.filteredGames;

          return ListView.builder(
            itemCount: gamesToShow.length,
            itemBuilder: (context, index) {
              return gameCard(context, gamesToShow[index]);
            },
          );
        },
      ),
    );
  }
}
