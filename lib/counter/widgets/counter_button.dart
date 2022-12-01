import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.tooltip,
    this.backgroundColor,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String tooltip;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: backgroundColor,
      child: Icon(icon),
    );
  }
}
