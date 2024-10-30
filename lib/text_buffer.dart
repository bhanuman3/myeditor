import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/providers/text_editing_provider.dart';

class TextBuffer extends ConsumerWidget {
  const TextBuffer({
    super.key,
    required this.text,
    required this.textStyle,
  });

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = ref.watch(focusNodeProvider);
    return Focus(
      focusNode: focusNode,
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyUpEvent) {
          return KeyEventResult.ignored;
        }

        if (event.logicalKey == LogicalKeyboardKey.backspace) {
          ref.read(textEditingProvider.notifier).delChar();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          ref.read(textEditingProvider.notifier).moveCursorRight();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          ref.read(textEditingProvider.notifier).moveCursorLeft();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          ref.read(textEditingProvider.notifier).moveCursorUp();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          ref.read(textEditingProvider.notifier).moveCursorDown();
        } else if (event.character != null) {
          ref.read(textEditingProvider.notifier).addChar(event.character);
        }

        return KeyEventResult.handled;
      },
      child: RichText(
        text: TextSpan(
          style: textStyle,
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
