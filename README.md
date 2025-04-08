# 📱 Pokémon Flutter App

A Flutter application for Pokémon fans featuring a Pokédex, a favorites list, and a collection of mainline Pokémon video games.

---

## 🧩 Features

### 🔖 Favorites
- Save your favorite Pokémon locally using `shared_preferences`.
- Easily access and manage your custom favorite list.

### 📘 Pokédex
- Fetches real-time Pokémon data from the [PokéAPI v2](https://pokeapi.co/docs/v2).
- Detailed Pokémon view includes:
  - Main Pokémon image
  - Pokédex index number
  - Pokémon types
  - Sprites (normal and shiny)

### 🎮 Video Games
- Explore the main Pokémon video games, from **Red/Blue** to **Scarlet/Violet**.
- **All video game information is statically stored in the code.**
- Each game has a standalone description with no dependencies on previous titles.

---

## 🛠️ Tech Stack

- **Flutter** & **Dart**
- **Provider** (`ChangeNotifier`) for state management
- **shared_preferences** for local storage
- **HTTP** for API requests

---

## 📚 Learning Resources

This app was built as part of my learning journey through the following resources:

- [Flutter Course – Platzi](https://platzi.com/cursos/flutter/)
- [The Complete Dart & Flutter Developer Course | Full Tutorial For Beginners to Advanced – YouTube](https://www.youtube.com/watch?v=CzRQ9mnmh44)
- **Mobile App Development subject** – Universidad de Medellín

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/pokemon-flutter-app.git
   cd pokemon-flutter-app
