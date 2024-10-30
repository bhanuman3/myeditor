import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/cursor.dart';
import 'package:myeditor/providers/settings_providers.dart';
import 'package:myeditor/providers/text_editing_provider.dart';
import 'package:myeditor/status_bar.dart';
import 'package:myeditor/text_buffer.dart';

final FocusNode focusNode = FocusNode();

class Window extends ConsumerWidget {
  const Window({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = ref.watch(textStyleProvider);
    final textEditingState = ref.watch(textEditingProvider);
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
              ElevatedButton(
                onPressed: () {
                  ref.read(textEditingProvider.notifier).addChar('s');
                },
                child: const Text('Add char'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(textEditingProvider.notifier).delChar();
                },
                child: const Text('Remove char'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(textEditingProvider.notifier).moveCursorRight();
                },
                child: const Text('Cur R'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(textEditingProvider.notifier).moveCursorLeft();
                },
                child: const Text('Cur L'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(textEditingProvider.notifier).moveCursorDown();
                },
                child: const Text('Cur Dn'),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                const Cursor(),
                TextBuffer(
                  text: textEditingState.content,
                  textStyle: textStyle,
                ),
              ],
            ),
          ),
          const StatusBar(),
        ],
      ),
    );
  }
}
