import 'package:flutter/material.dart';

class StarToggle extends StatefulWidget {
  const StarToggle({super.key});

  @override
  _StarToggleState createState() => _StarToggleState();
}

class _StarToggleState extends State<StarToggle> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    final icon = isStarred ? Icons.star : Icons.star_border;
    final color = isStarred ? Colors.amber : Colors.grey;

    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      iconSize: 20,
      icon: Icon(icon, color: color),
      onPressed: () {
        setState(() {
          isStarred = !isStarred;
        });
      },
    );
  }
}
