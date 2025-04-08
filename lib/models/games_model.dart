class PokemonGame {
  final String name;
  final String releaseDate;
  final String description;
  final String image;
  final String trailerUrl;

  PokemonGame({
    required this.name,
    required this.releaseDate,
    required this.description,
    required this.image,
    required this.trailerUrl,
  });
}

final List<PokemonGame> pokemonGames = [
  PokemonGame(
    name: 'Red',
    releaseDate: 'October 5, 1999',
    description:
        'An adventure set in the Kanto region, where players collect and battle 151 unique creatures in their quest to become a Pokémon Master.',
    image: 'https://i.blogs.es/27bdb8/pokemon-rojo/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=C19O5xm51dk',
  ),
  PokemonGame(
    name: 'Blue',
    releaseDate: 'October 5, 1999',
    description:
        'An adventure set in the Kanto region, where players collect and battle 151 unique creatures in their quest to become a Pokémon Master.',
    image: 'https://i.blogs.es/4d1895/pokemon-azul/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=4VzzBEKhYqE',
  ),
  PokemonGame(
    name: 'Yellow',
    releaseDate: 'June 16, 2000',
    description:
        'A journey through the Kanto region with Pikachu as your partner, featuring the original 151 creatures and inspired by the animated series.',
    image: 'https://i.blogs.es/c20c1e/pokemon-amarillo/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=Fj_cCNy_Zmo',
  ),
  PokemonGame(
    name: 'Gold',
    releaseDate: 'April 6, 2001',
    description:
        'A classic adventure in the Johto region, where players discover 100 new creatures, explore new towns, and experience a dynamic day-night cycle.',
    image: 'https://i.blogs.es/744f42/pokemon-oro/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=r1ahDq8eCMM',
  ),
  PokemonGame(
    name: 'Silver',
    releaseDate: 'April 6, 2001',
    description:
        'A journey through the Johto region filled with 100 new creatures, real-time elements like day and night, and exciting creature battles.',
    image: 'https://i.blogs.es/929e60/pokemon-plata/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=yVv6uVeAxMA',
  ),
  PokemonGame(
    name: 'Crystal',
    releaseDate: 'November 2, 2001',
    description:
        'An expanded adventure in the Johto region featuring over 100 creatures, battle animations, a deeper story, and the option to play as a female character.',
    image: 'https://i.blogs.es/cf9b75/pokemon-cristal/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=hZ6cUkgmu4E',
  ),
  PokemonGame(
    name: 'Ruby',
    releaseDate: 'July 25, 2003',
    description:
        'An epic quest in the Hoenn region, where players encounter over 100 new creatures, face powerful teams, and experience strategic double battles and dynamic weather.',
    image: 'https://i.blogs.es/b241e0/pokemon-rubi/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=KeSO1hXpdB4',
  ),
  PokemonGame(
    name: 'Sapphire',
    releaseDate: 'July 25, 2003',
    description:
        'An adventure across the Hoenn region filled with over 100 new creatures, intense team rivalries, double battles, and changing weather conditions.',
    image: 'https://i.blogs.es/6af15c/pokemon-zafiro/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=q3rUUTU59To',
  ),
  PokemonGame(
    name: 'Fire Red',
    releaseDate: 'October 1, 2004',
    description:
        'A modernized return to the Kanto region with updated visuals, new features, and the original 151 creatures to catch, train, and battle.',
    image: 'https://i.blogs.es/dd1904/pokemon-rojo-fuego/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=XBmgAp_PlgI',
  ),
  PokemonGame(
    name: 'Leaf Green',
    releaseDate: 'October 1, 2004',
    description:
        'A modernized return to the Kanto region with updated visuals, new features, and the original 151 creatures to catch, train, and battle.',
    image: 'https://i.blogs.es/d7b41e/pokemon-verde-hoja/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=Mdm3yVPfdYs',
  ),
  PokemonGame(
    name: 'Emerald',
    releaseDate: 'October 21, 2005',
    description:
        'An enhanced journey through the Hoenn region, combining new challenges, animated battles, and a powerful legendary creature shaping the story.',
    image: 'https://i.blogs.es/01e244/pokemon-esmeralda/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=tnvwWrt7Rw0',
  ),
  PokemonGame(
    name: 'Diamond',
    releaseDate: 'July 27, 2007',
    description:
        'A journey through the Sinnoh region, introducing powerful new creatures, a snowy environment, and a deeper focus on time, space, and mythology.',
    image: 'https://i.blogs.es/4260b9/pokemon-diamante/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=sMhIn479gTQ',
  ),
  PokemonGame(
    name: 'Pearl',
    releaseDate: 'July 27, 2007',
    description:
        'A journey through the Sinnoh region, introducing powerful new creatures, a snowy environment, and a deeper focus on time, space, and mythology.',
    image: 'https://i.blogs.es/2c46b3/pokemon-perla/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=jP2jPp0adgA',
  ),
  PokemonGame(
    name: 'Platinum',
    releaseDate: 'May 22, 2009',
    description:
        'An enhanced version of the Sinnoh adventure, with a new dimension to explore, faster battles, and expanded story elements involving legendary Pokémon.',
    image: 'https://i.blogs.es/5ec2f0/pokemon-platino/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=YiUz-5ikZ9w',
  ),
  PokemonGame(
    name: 'Heart Gold',
    releaseDate: 'March 26, 2010',
    description:
        'A visually upgraded remake of the Johto journey, with updated graphics, touch controls, and the ability for Pokémon to follow the player outside of battle.',
    image: 'https://i.blogs.es/a2fee2/pokemon-hg/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=Ox28WPEYwrA',
  ),
  PokemonGame(
    name: 'Soul Silver',
    releaseDate: 'March 26, 2010',
    description:
        'A visually upgraded remake of the Johto journey, with updated graphics, touch controls, and the ability for Pokémon to follow the player outside of battle.',
    image: 'https://i.blogs.es/072953/pokemon-ss/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=QSjO2RYhEEg',
  ),
  PokemonGame(
    name: 'White',
    releaseDate: 'March 4, 2011',
    description:
        'A bold new start in the Unova region, with all-new creatures, a modern city-based setting, and a story focused on ideals and truth.',
    image: 'https://i.blogs.es/91fa64/pokemon-blanco/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=s9kOIkve5qY',
  ),
  PokemonGame(
    name: 'Black',
    releaseDate: 'March 4, 2011',
    description:
        'A bold new start in the Unova region, with all-new creatures, a modern city-based setting, and a story focused on ideals and truth.',
    image: 'https://i.blogs.es/3b91a1/pokemon-negro/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=zWOEowMhG0I',
  ),
  PokemonGame(
    name: 'White 2',
    releaseDate: 'October 7, 2012',
    description:
        'A sequel set in the Unova region with new locations, characters, and creatures, continuing the story two years after the original Black and White.',
    image: 'https://i.blogs.es/8ef82c/pokemon-blanco2/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=IH4uj6e2fok',
  ),
  PokemonGame(
    name: 'Black 2',
    releaseDate: 'October 7, 2012',
    description:
        'A sequel set in the Unova region with new locations, characters, and creatures, continuing the story two years after the original Black and White.',
    image: 'https://i.blogs.es/6e04da/pokemon-negro2/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=vfb2j4HmnPU',
  ),
  PokemonGame(
    name: 'X',
    releaseDate: 'October 12, 2013',
    description:
        'A journey through the Kalos region, inspired by France, featuring fully 3D visuals, Mega Evolutions, and deep character customization.',
    image: 'https://i.blogs.es/84caaa/pokemon-x/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=T9VRAmMaRbo',
  ),
  PokemonGame(
    name: 'Y',
    releaseDate: 'October 12, 2013',
    description:
        'A journey through the Kalos region, inspired by France, featuring fully 3D visuals, Mega Evolutions, and deep character customization.',
    image: 'https://i.blogs.es/b63719/pokemon-y/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=oBbMGFkyDPg',
  ),
  PokemonGame(
    name: 'Alpha Sapphire',
    releaseDate: 'November 28, 2014',
    description:
        'A reimagined journey through the Hoenn region with 3D visuals, new forms of legendary Pokémon, and expanded lore.',
    image: 'https://i.blogs.es/cddbb0/pokemon-az/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=nnlg92dGZcs',
  ),
  PokemonGame(
    name: 'Omega Ruby',
    releaseDate: 'November 28, 2014',
    description:
        'A reimagined journey through the Hoenn region with 3D visuals, new forms of legendary Pokémon, and expanded lore.',
    image: 'https://i.blogs.es/e0c80f/pokemon-or/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=G60Jn8z7_b4&t=2s',
  ),
  PokemonGame(
    name: 'Sun',
    releaseDate: 'November 23, 2016',
    description:
        'A tropical adventure in the Alola region, featuring a new format without traditional gyms, regional creature variations, and a relaxed island vibe.',
    image: 'https://i.blogs.es/f57636/pokemon-sol/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=Zrk6LXxBUuU',
  ),
  PokemonGame(
    name: 'Moon',
    releaseDate: 'November 23, 2016',
    description:
        'An Alola region journey with new Pokémon forms, cultural influences, and a time system that flips day and night compared to Sun.',
    image: 'https://i.blogs.es/fdfb82/pokemon-luna/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=xuMOM1EAisY',
  ),
  PokemonGame(
    name: 'Ultra Sun',
    releaseDate: 'November 17, 2017',
    description:
        'A deeper look into the Alola region, with alternate realities, new gameplay features, and more legendary encounters.',
    image: 'https://i.blogs.es/d579d9/pokemon-us/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=2zN17uFYLmY',
  ),
  PokemonGame(
    name: 'Ultra Moon',
    releaseDate: 'November 17, 2017',
    description:
        'A deeper look into the Alola region, with alternate realities, new gameplay features, and more legendary encounters.',
    image: 'https://i.blogs.es/0c87e8/pokemon-ul/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=2Qz9BUHJouk',
  ),
  PokemonGame(
    name: "Let's Go, Pikachu!",
    releaseDate: 'November 16, 2018',
    description:
        'A modern reimagining of the Kanto region with updated visuals, simplified controls, mechanics inspired by Pokémon GO, and Pikachu as your partner.',
    image: 'https://i.blogs.es/6e40fd/pokemon-pikachu/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=C6vBRUPe10Y',
  ),
  PokemonGame(
    name: "Let's Go, Eevee!",
    releaseDate: 'November 16, 2018',
    description:
        'A refreshed journey through the Kanto region featuring Eevee as your loyal partner, with colorful 3D graphics and an approachable gameplay style for new players.',
    image: 'https://i.blogs.es/d079d4/pokemon-eevee/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=LW2hEn7XI7U',
  ),
  PokemonGame(
    name: "Shield",
    releaseDate: 'November 15, 2019',
    description:
        'A journey through the Galar region, inspired by the UK, with open-world areas, massive Dynamax battles, and a focus on competitive play.',
    image: 'https://i.blogs.es/873bd1/pokemon-escudo/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=9HWxmC6UE70',
  ),
  PokemonGame(
    name: "Sword",
    releaseDate: 'November 15, 2019',
    description:
        'A journey through the Galar region, inspired by the UK, with open-world areas, massive Dynamax battles, and a focus on competitive play.',
    image: 'https://i.blogs.es/af38b5/pokemon-espada/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=LIE-xjdEKUE',
  ),
  PokemonGame(
    name: "Brilliant Diamond",
    releaseDate: 'November 19, 2021',
    description:
        'A faithful remake of the Sinnoh region adventure with updated visuals, classic gameplay, and a nostalgic return to a beloved world.',
    image: 'https://i.blogs.es/26e9c2/pokemon-diamante-brillante/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=UBgZhm1I1KU',
  ),
  PokemonGame(
    name: "Shining Pearl",
    releaseDate: 'November 19, 2021',
    description:
        'A faithful remake of the Sinnoh region adventure with updated visuals, classic gameplay, and a nostalgic return to a beloved world.',
    image: 'https://i.blogs.es/cf5c6f/pokemon-perla-reluciente/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=UBgZhm1I1KU',
  ),
  PokemonGame(
    name: "Scarlet",
    releaseDate: 'November 18, 2022',
    description:
        'An open-world adventure in the Paldea region, where players explore freely, attend an academy, and encounter creatures in natural environments.',
    image: 'https://i.blogs.es/aa08f6/pokemon-escarlata/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=-kDFFZ-gCAU',
  ),
  PokemonGame(
    name: "Violet",
    releaseDate: 'November 18, 2022',
    description:
        'An open-world adventure in the Paldea region, where players explore freely, attend an academy, and encounter creatures in natural environments.',
    image: 'https://i.blogs.es/63dddb/pokemon-purpura/450_1000.webp',
    trailerUrl: 'https://www.youtube.com/watch?v=3JqSd3CmGuw',
  ),
];
