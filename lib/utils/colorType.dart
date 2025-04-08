import 'package:flutter/material.dart';

// Mapa de colores según el tipo de Pokémon
final Map<String, Color> typeColors = {
  'normal': Colors.brown[400]!,
  'fire': Colors.red[400]!,
  'water': Colors.blue[400]!,
  'electric': Colors.yellow[600]!,
  'grass': Colors.green[400]!,
  'ice': Colors.cyan[300]!,
  'fighting': Colors.orange[700]!,
  'poison': Colors.purple[400]!,
  'ground': Colors.brown[300]!,
  'flying': Colors.blue[200]!,
  'psychic': Colors.pink[400]!,
  'bug': Colors.lightGreen[500]!,
  'rock': Colors.brown[600]!,
  'ghost': Colors.indigo[400]!,
  'dragon': Colors.indigo[700]!,
  'dark': Colors.grey[800]!,
  'steel': Colors.blueGrey[400]!,
  'fairy': Colors.pink[300]!,
};

// Función para obtener el color de fondo de un tipo
Color getTypeColor(String type) {
  return typeColors[type.toLowerCase()] ?? Colors.grey;
}
