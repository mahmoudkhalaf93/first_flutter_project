import 'package:flutter/material.dart';

/// Widget to display customized text
class DisplayTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color textColor;
  final bool isBold;

  const DisplayTextWidget({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontFamily = '',
    this.textColor = Colors.black,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: textColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
