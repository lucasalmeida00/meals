import 'package:flutter/material.dart';

class ItemDrawer extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onTap;

  const ItemDrawer(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
