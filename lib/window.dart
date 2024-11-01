import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/cursor.dart';
import 'package:myeditor/providers/settings_providers.dart';
import 'package:myeditor/status_bar.dart';
import 'package:myeditor/text_buffer.dart';

final FocusNode focusNode = FocusNode();

class Window extends ConsumerWidget {
  const Window({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(settingsProvider.notifier).increaseFontSize();
                },
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(settingsProvider.notifier).decreaseFontSize();
                },
                child: const Text('-'),
              ),
            ],
          ),
          const Expanded(
            child: Stack(
              children: [
                Cursor(),
                TextBuffer(),
              ],
            ),
          ),
          const StatusBar(),
        ],
      ),
    );
  }
}
