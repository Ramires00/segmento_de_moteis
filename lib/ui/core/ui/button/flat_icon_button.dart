import 'package:flutter/material.dart';

class FlatIconButton extends StatelessWidget {
  const FlatIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
