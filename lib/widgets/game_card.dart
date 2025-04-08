import 'package:flutter/material.dart';
import 'package:poke_flutter/models/games_model.dart';
import 'package:poke_flutter/screens/game_detail.dart';
import 'package:poke_flutter/utils/capitalize.dart';

Widget gameCard(BuildContext context, PokemonGame game) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GameDetail(game: game)),
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
                    game.image,
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
                      capitalize(game.name),
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
