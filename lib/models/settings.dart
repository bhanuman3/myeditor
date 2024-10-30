import 'package:flutter/material.dart';

class Settings {
  Settings({
    required this.fontSize,
    required this.color,
    required this.fontFamily,
  });

  final double fontSize;
  final Color color;
  final String fontFamily;

  Settings copyWith({
    double? fontSize,
    Color? color,
    String? fontFamily,
  }) {
    return Settings(
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
