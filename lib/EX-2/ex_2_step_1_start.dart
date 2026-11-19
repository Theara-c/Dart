import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const new({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Text",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  Text("Subtext"),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            icon: isFavourite
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border),
          ),
        ],
      ),
      // YOUR CODE
    );
  }
}
