import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/models/settings.dart';
import 'package:myeditor/notifiers/settings_notifier.dart';

final settingsProvider =
    NotifierProvider<SettingsNotifier, Settings>(SettingsNotifier.new);

final textStyleProvider = Provider<TextStyle>((ref) {
  final settings = ref.watch(settingsProvider);
  return TextStyle(
    fontSize: settings.fontSize,
    color: settings.color,
    fontFamily: settings.fontFamily,
  );
});

final cursorSizeProvider = Provider<Size>((ref) {
  final style = ref.watch(textStyleProvider);
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: 'H', style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout();

  return textPainter.size;
});
