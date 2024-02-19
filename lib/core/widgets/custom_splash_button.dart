import 'package:flutter/material.dart';

class CustomSplashButton extends StatelessWidget {
  final Color color;
  final TextStyle textStyle;
  final String text;
  final VoidCallback? onPressed;
  const CustomSplashButton({
    super.key,
    required this.color,
    required this.textStyle,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(152, 60),
        elevation: 0,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
