import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/providers/text_editing_provider.dart';

class StatusBar extends ConsumerWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingState = ref.watch(textEditingProvider);
    final line = textEditingState.cursorPosition.line;
    final col = textEditingState.cursorPosition.col;
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      color: Colors.blue[900],
      child: Row(
        children: [
          Text(
            'Ln $line, Col $col',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
