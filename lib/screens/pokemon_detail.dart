import 'package:flutter/material.dart';
import 'package:poke_flutter/providers/favorites_provider.dart';
import 'package:poke_flutter/providers/pokemon_detail_provider.dart';
import 'package:poke_flutter/utils/capitalize.dart';
import 'package:poke_flutter/utils/colorType.dart';
import 'package:poke_flutter/utils/formatIndex.dart';
import 'package:provider/provider.dart';

class PokemonDetail extends StatelessWidget {
  final String pokemonName;
  final int pokemonIndex;
  final String imageUrl;

  const PokemonDetail({
    super.key,
    required this.pokemonName,
    required this.pokemonIndex,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) =>
              DetailPokemonProvider()..fetchPokemonDetails(pokemonIndex),
      child: Scaffold(
        appBar: AppBar(
          title: Text(capitalize(pokemonName)),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.redAccent),
          ),
        ),
        body: Consumer<DetailPokemonProvider>(
          builder: (context, detailProvider, child) {
            if (detailProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.redAccent),
              );
            }

            final pokemon = detailProvider.pokemon;
            if (pokemon == null) {
              return const Center(
                child: Text('No se pudo cargar la información.'),
              );
            }

            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              imageUrl,
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.contain,
                              errorBuilder:
                                  (_, __, ___) =>
                                      const Icon(Icons.broken_image, size: 100),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'N.° ${formatIndexForNum(pokemonIndex)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            capitalize(pokemonName),
                            style: const TextStyle(
                              fontSize: 26,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Pokedex Description',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            pokemon.pokedex_description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Types',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _PokemonTypes(types: pokemon.types),
                          const SizedBox(height: 10),
                          const Text(
                            'Videogame Sprites',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _PokemonSprites(sprites: pokemon.sprites),
                          const SizedBox(height: 10),
                          Consumer<FavoritesProvider>(
                            builder: (context, favoritesProvider, child) {
                              final isFavorite = favoritesProvider
                                  .favoritesPokemons
                                  .any((p) => p['name'] == pokemonName);
                              return ElevatedButton.icon(
                                onPressed: () {
                                  isFavorite
                                      ? favoritesProvider.removeFavorite(
                                        pokemonName,
                                      )
                                      : favoritesProvider.addFavorite({
                                        'name': pokemonName,
                                        'image': imageUrl,
                                        'index': pokemonIndex,
                                      });
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.catching_pokemon
                                      : Icons.catching_pokemon,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                                label: Text(
                                  isFavorite ? 'Delete Pokemon' : 'Add Pokemon',
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PokemonTypes extends StatelessWidget {
  final List<String> types;

  const _PokemonTypes({required this.types});

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8.0, children: _buildTypeChips());
  }

  List<Widget> _buildTypeChips() {
    return types.map((type) {
      return Chip(
        label: Text(capitalize(type)),
        backgroundColor: getTypeColor(type),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Montserrat',
        ),
      );
    }).toList();
  }
}

class _PokemonSprites extends StatelessWidget {
  final List<String> sprites;

  const _PokemonSprites({required this.sprites});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildSpriteImages(),
      ),
    );
  }

  List<Widget> _buildSpriteImages() {
    return sprites.map((sprite) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.network(
          sprite,
          width: 160,
          height: 160,
          fit: BoxFit.contain,
        ),
      );
    }).toList();
  }
}
