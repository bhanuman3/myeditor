import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myeditor/status_bar.dart';
import 'package:myeditor/text_buffer.dart';

class Cursor extends StatelessWidget {
  final String text;
  final TextStyle style;

  const Cursor({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    final Size textSize = _calculateTextSize(text, style);

    return Positioned(
      width: textSize.width,
      height: textSize.height,
      child: Container(
        width: textSize.width,
        height: textSize.height,
        color: Colors.green,
      ),
    );
  }

  Size _calculateTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size;
  }
}
