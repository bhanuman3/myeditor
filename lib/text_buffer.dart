import 'package:flutter/material.dart';

class TextBuffer extends StatelessWidget {
  const TextBuffer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: 'Menlo',
        ),
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(),
          ),
        ],
      ),

      // children: [
      //   Text(text),
      //   Container(
      //     height: 30,
      //     width: 2,
      //     color: Colors.black,
      //   ),
      // ],
    );
  }

  Size _calculateTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(); // Lays out the text to calculate size

    return textPainter.size;
  }
}
