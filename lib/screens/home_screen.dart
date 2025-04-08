import 'package:flutter/material.dart';
import 'package:poke_flutter/providers/pokemons_provider.dart';
import 'package:poke_flutter/widgets/pokemon_card.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    final pokemonsProvider = Provider.of<PokemonsProvider>(
      context,
      listen: false,
    );
    pokemonsProvider.fetchPokemons();
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
                    });
                  },
                )
                : const Text('Pokedex'),
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
      body: Consumer<PokemonsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent),
            );
          } else if (provider.pokemons.isEmpty) {
            return const Center(child: Text('No Pokémon found'));
          } else {
            final filteredPokemons =
                _searchText.isEmpty
                    ? provider.pokemons
                    : provider.filterPokemonsByName(_searchText);

            return ListView.builder(
              itemCount: filteredPokemons.length,
              itemBuilder: (context, index) {
                return pokemonCard(context, filteredPokemons[index], index);
              },
            );
          }
        },
      ),
    );
  }
}
