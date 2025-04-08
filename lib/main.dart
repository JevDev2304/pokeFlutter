import 'package:flutter/material.dart';
import 'package:poke_flutter/providers/favorites_provider.dart';
import 'package:poke_flutter/providers/games_provider.dart';
import 'package:poke_flutter/providers/pokemon_detail_provider.dart';
import 'package:poke_flutter/providers/pokemons_provider.dart';
import 'package:poke_flutter/screens/favorites_pokemons.dart';
import 'package:poke_flutter/screens/home_screen.dart';
//import 'package:poke_flutter/screens/regions.dart';
import 'package:poke_flutter/screens/videogames.dart';
import 'package:provider/provider.dart';
import 'package:poke_flutter/screens/start_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonsProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => DetailPokemonProvider()),
        ChangeNotifierProvider(create: (_) => PokemonGameProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        home: const StartScreen(),
      ),
    );
  }
}

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    FavoritesPokemons(),
    HomeScreen(),
    Videogames(),
    // Regions(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Team',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Pokedex'),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'VideoGames',
          ),
          //BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Regions'),
        ],
      ),
    );
  }
}
