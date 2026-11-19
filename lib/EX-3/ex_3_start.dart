import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: HomeScreen(),
  ),
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int imageIndex = 0;
  void nextImage() {
    setState(() {
      imageIndex = ( imageIndex + 1) % images.length;
    });
  }

  void preImage() {
    setState(() {
      imageIndex = ( imageIndex - 1) % images.length;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          ButtonIcon(label: "Go to the previous image", action: preImage, icon: Icons.navigate_before),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: ButtonIcon(label: "Go to the next image", action: nextImage, icon: Icons.navigate_next),
          ),
        ],
      ),
      body: Image.asset(images[imageIndex]),
    );
    ;
  }
}
class ButtonIcon extends StatelessWidget {
  final String label;
  final VoidCallback action;
  final IconData icon;
  const ButtonIcon({super.key,required this.label, required this.action, required this.icon });

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon:  Icon(icon),
            tooltip: label,
            onPressed: action,
          );
  }
}
