import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My hobbies")),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(40),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            buttonCs(label: "Submit", icon: Icons.home, color: ButtonType.primary.value),
            buttonCs(
              label: "Time",
              icon: Icons.lock_clock,
              color: ButtonType.secondary.value,
              leftPos: false,
            ),
            buttonCs(
              label: "Account",
              icon: Icons.account_box,
              color: ButtonType.disabled.value,
            ),
          ],
        ),
      ),
    );
  }
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color value;
  const ButtonType(this.value);
}

Widget buttonCs({
  required String label,
  required IconData icon,
  bool leftPos = true,
  required Color color,
}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(16),
    child: leftPos
        ? Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), Text(label)],
          )
        : ordering(label, icon),
  );
}

Widget ordering(String label, IconData icon) {
  return Row(
    spacing: 8,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Text(label), Icon(icon)],
  );
}
