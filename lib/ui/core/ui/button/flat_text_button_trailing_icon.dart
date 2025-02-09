import 'package:flutter/material.dart';

class FlatTextButtonTrailingIcon extends StatelessWidget {
  const FlatTextButtonTrailingIcon({
    required this.label,
    required this.trailing,
    required this.onPressed,
    super.key,
  });

  final String label;
  final Widget trailing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      iconAlignment: IconAlignment.end,
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: trailing,
    );
  }
}
