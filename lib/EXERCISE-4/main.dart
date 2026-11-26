import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavouritePage(),
      ),
    );

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int? selectedIndex; // null = no favorite selected yet

  void onFavoriteClick(int index) {
    setState(() {
      selectedIndex = (selectedIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return FavoriteCard(
            title: joke.title,
            description: joke.description,
            isFavorite: selectedIndex == index,
            onFavoriteTap: () => onFavoriteClick(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  IconData get heartIcon => isFavorite ? Icons.favorite : Icons.favorite_border;
  Color get heartColor => isFavorite ? Colors.red : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteTap,
            icon: Icon(heartIcon, color: heartColor),
          ),
        ],
      ),
    );
  }
}

class Joke {
  final String title;
  final String description;

  const Joke({required this.title, required this.description});
}

const List<Joke> jokes = [
  Joke(
    title: 'The Programmer\'s Wife',
    description: 'A programmer\'s wife tells him: "Go to the store and buy a loaf of bread. If they have eggs, buy a dozen." He comes home with 12 loaves of bread.',
  ),
  Joke(
    title: 'Dark Mode',
    description: 'Why do programmers prefer dark mode? Because light attracts bugs.',
  ),
  Joke(
    title: 'Infinite Loop',
    description: 'How do you keep a programmer in the shower all day? Give them a bottle of shampoo that says: Lather, Rinse, Repeat.',
  ),
  Joke(
    title: 'Array Indexing',
    description: 'There are only two hard things in Computer Science: cache invalidation, naming things, and off-by-one errors.',
  ),
  Joke(
    title: 'SQL Query',
    description: 'A SQL query walks into a bar, walks up to two tables, and asks: "Can I join you?"',
  ),
  Joke(
    title: 'Binary People',
    description: 'There are 10 types of people in the world: those who understand binary, and those who don\'t.',
  ),
  Joke(
    title: 'Debugging',
    description: 'Debugging is like being the detective in a crime movie where you are also the murderer.',
  ),
  Joke(
    title: 'Java vs C',
    description: 'Why do Java developers wear glasses? Because they don\'t C#.',
  ),
  Joke(
    title: 'Git Commit',
    description: 'In case of fire: 1. git commit 2. git push 3. leave building.',
  ),
  Joke(
    title: 'UDP Joke',
    description: 'I would tell you a UDP joke, but you might not get it.',
  ),
  Joke(
    title: 'TCP Joke',
    description: 'I\'d tell you a TCP joke, and I\'d keep telling it until you got it.',
  ),
  Joke(
    title: 'Missing Semicolon',
    description: 'A programmer spent 4 hours looking for a bug. It was a missing semicolon. He stared at the wall for another hour.',
  ),
  Joke(
    title: 'Inheritance',
    description: 'What is the object-oriented way to become wealthy? Inheritance.',
  ),
  Joke(
    title: 'Recursion',
    description: 'To understand recursion, you must first understand recursion.',
  ),
  Joke(
    title: 'Cloud Storage',
    description: 'There is no cloud—it is just someone else\'s computer.',
  ),
  Joke(
    title: 'Flutter Hot Reload',
    description: 'Why did the Flutter developer stay calm during the exam? Because everything was just a StatelessWidget until they needed setState.',
  ),
  Joke(
    title: 'Hardware vs Software',
    description: 'Hardware is the part of a computer that you can kick. Software is the part you can only curse at.',
  ),
  Joke(
    title: 'Works on My Machine',
    description: '"It works on my machine!" — Every developer right before shipping to production.',
  ),
  Joke(
    title: 'Stack Overflow',
    description: '99 little bugs in the code, 99 little bugs. Take one down, patch it around, 127 little bugs in the code.',
  ),
  Joke(
    title: 'HTML Programming',
    description: 'Someone said HTML is their favorite programming language. The compiler laughed.',
  ),
  Joke(
    title: 'Null Pointer',
    description: 'Why did the developer break up with Null? There was just nothing there.',
  ),
  Joke(
    title: 'Boolean',
    description: 'A boolean walks into a bar. The bartender asks: "Are you having a drink?" The boolean says: "True."',
  ),
];