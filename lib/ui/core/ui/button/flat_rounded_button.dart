import 'package:flutter/material.dart';

class FlatRoundedButton extends StatelessWidget {
  const FlatRoundedButton({
    required this.onPressed,
    required this.label,
    this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      icon: icon == null
          ? const SizedBox.shrink()
          : Icon(
              icon,
              color: Colors.red,
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
    );
  }
}
