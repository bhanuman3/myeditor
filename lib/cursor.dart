import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/providers/settings_providers.dart';
import 'package:myeditor/providers/text_editing_provider.dart';

class Cursor extends ConsumerWidget {
  const Cursor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursorSize = ref.watch(cursorSizeProvider);
    final state = ref.watch(textEditingProvider);

    return Positioned(
      left: cursorSize.width * (state.cursorPosition.col - 1),
      top: cursorSize.height * (state.cursorPosition.line - 1),
      child: Container(
        width: cursorSize.width,
        height: cursorSize.height,
        color: Colors.green,
      ),
    );
  }
}
