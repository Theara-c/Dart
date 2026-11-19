import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(spacing: 15, children: [CsBtn(), CsBtn()]),
        // child:
      ),
    ),
  ),
);

class CsBtn extends StatefulWidget {
  const new({super.key});

  @override
  State<CsBtn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CsBtn> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isClick ? Colors.blue[500] : Colors.grey,
        ),
        onPressed: ()  {
          setState(() {
            isClick = !isClick;
          });
        },
        child: Center(
          child: Text(
            isClick ? "Selected" : "Not Selected",
            style: TextStyle(color: isClick ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
