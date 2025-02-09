import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
      ),
      icon: icon == null
          ? const SizedBox.shrink()
          : Icon(
              icon,
              color: Colors.red,
            ),
    );
  }
}
