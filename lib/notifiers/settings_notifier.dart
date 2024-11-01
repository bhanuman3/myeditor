import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/models/settings.dart';

class SettingsNotifier extends Notifier<Settings> {
  @override
  Settings build() {
    return Settings(
      fontSize: 18,
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
