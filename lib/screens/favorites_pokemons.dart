import 'package:flutter/material.dart';
import 'package:poke_flutter/providers/favorites_provider.dart';
import 'package:poke_flutter/screens/pokemon_detail.dart';
import 'package:poke_flutter/utils/capitalize.dart';
import 'package:poke_flutter/utils/formatIndex.dart';
import 'package:provider/provider.dart';

class FavoritesPokemons extends StatelessWidget {
  const FavoritesPokemons({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final sortedFavorites = List<Map<String, dynamic>>.from(
      favoritesProvider.favoritesPokemons,
    )..sort((a, b) => a['index'].compareTo(b['index']));

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pokemons'),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(sortedFavorites),
    );
  }

  Widget _buildBody(List<Map<String, dynamic>> sortedFavorites) {
    if (sortedFavorites.isEmpty) {
      return const Center(
        child: Text(
          'You don\'t have any favorite Pokémon yet.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: sortedFavorites.length,
        itemBuilder: (context, index) {
          final pokemon = sortedFavorites[index];
          return _FavoritePokemonCard(context, pokemon);
        },
      );
    }
  }

  Widget _FavoritePokemonCard(
    BuildContext context,
    Map<String, dynamic> pokemon,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => PokemonDetail(
                  pokemonName: pokemon['name'],
                  pokemonIndex: pokemon['index'],
                  imageUrl: pokemon['image'],
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      pokemon['image'],
                      fit: BoxFit.fill,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 50),
                    ),
                  ),
                ),
                const SizedBox(width: 26),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'N.° ${formatIndexForNum(pokemon['index'])}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xFFA9A9A9),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        capitalize(pokemon['name']),
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<FavoritesProvider>(
                      context,
                      listen: false,
                    ).removeFavorite(pokemon['name']);
                  },
                  icon: const Icon(Icons.catching_pokemon, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
