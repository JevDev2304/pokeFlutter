import 'package:poke_flutter/screens/pokemon_detail.dart';
import 'package:poke_flutter/utils/capitalize.dart';
import 'package:poke_flutter/utils/extractPokemonNumber.dart';
import 'package:poke_flutter/utils/formatIndex.dart';
import 'package:flutter/material.dart';

Widget pokemonCard(BuildContext context, dynamic pokemon, int index) {
  final pokemonNumber = extractPokemonNumber(pokemon['url']);
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => PokemonDetail(
                pokemonName: pokemon['name'],
                pokemonIndex: pokemonNumber,
                imageUrl:
                    'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/${formatIndexForImage(pokemonNumber)}.png',
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
                    'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/${formatIndexForImage(pokemonNumber)}.png',
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
                      'N.° ${formatIndexForNum(pokemonNumber)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Color(0xFFA9A9A9),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      capitalize(pokemon['name'].toString()),
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
