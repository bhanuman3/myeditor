import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/models/settings.dart';

class SettingsNotifier extends Notifier<Settings> {
  @override
  Settings build() {
    return Settings(
      fontSize: 24,
      color: Colors.black,
      fontFamily: 'Menlo',
    );
  }

  void increaseFontSize() {
    state = state.copyWith(fontSize: state.fontSize + 1);
  }

  void decreaseFontSize() {
    state = state.copyWith(fontSize: state.fontSize - 1);
  }
}

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
