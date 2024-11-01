import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/providers/settings_providers.dart';
import 'package:myeditor/providers/text_editing_provider.dart';

class TextBuffer extends ConsumerWidget {
  const TextBuffer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = ref.watch(focusNodeProvider);
    final textStyle = ref.watch(textStyleProvider);
    final textEditingState = ref.watch(textEditingProvider);
    return Focus(
      focusNode: focusNode,
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyUpEvent) {
          return KeyEventResult.ignored;
        }

        if (event.logicalKey == LogicalKeyboardKey.backspace) {
          ref.read(textEditingProvider.notifier).delChar();
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.enter) {
          ref.read(textEditingProvider.notifier).newLine();
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          ref.read(textEditingProvider.notifier).moveCursorRight();
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          ref.read(textEditingProvider.notifier).moveCursorLeft();
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          ref.read(textEditingProvider.notifier).moveCursorUp();
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          ref.read(textEditingProvider.notifier).moveCursorDown();
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.tab) {
          print('tab pressed');
          ref.read(textEditingProvider.notifier).tab();
          return KeyEventResult.handled;
        }

        if (event.character != null) {
          ref.read(textEditingProvider.notifier).addChar(event.character);
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: RichText(
        text: TextSpan(
          style: textStyle,
          children: [
            for (String line in textEditingState.lines!)
              TextSpan(
                text: '$line\n',
                style: const TextStyle(),
              ),
          ],
        ),
      ),
    );
  }
}
