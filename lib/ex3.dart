import 'package:flutter/material.dart';

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(color: Colors.blue),

            child: Column(
              children: [
                card(
                  path: ProductData.dart.path,
                  title: ProductData.dart.title,
                  subtitile: ProductData.dart.subtitle,
                ),
                card(
                  path: ProductData.firebase.path,
                  title: ProductData.firebase.title,
                  subtitile: ProductData.firebase.subtitle,
                ),
                card(
                  path: ProductData.flutter.path,
                  title: ProductData.flutter.title,
                  subtitile: ProductData.flutter.subtitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ProductData {
  dart(
    path: "assets/ex3/dart.png",
    title: "Dart",
    subtitle: "The best object language",
  ),
  firebase(
    path: "assets/ex3/firebase.png",
    title: "Firebase",
    subtitle: "The best mobile widget library",
  ),
  flutter(
    path: "assets/ex3/flutter.png",
    title: "Flutter",
    subtitle: "The best cloud database",
  );

  const ProductData({
    required this.path,
    required this.title,
    required this.subtitle,
  });

  final String path;
  final String title;
  final String subtitle;
}

class card extends StatelessWidget {
  const card({
    super.key,
    required this.path,
    required this.title,
    required this.subtitile,
  });
  final String title;
  final String path;
  final String subtitile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(path, width: 200, height: 200, fit: BoxFit.cover),
                Text(title, style: TextStyle(fontSize: 28)),
                Text(subtitile),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
