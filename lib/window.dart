import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/cursor.dart';
import 'package:myeditor/status_bar.dart';
import 'package:myeditor/text_buffer.dart';

final FocusNode focusNode = FocusNode();

class Window extends ConsumerWidget {
  const Window({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Cursor(),
                TextBuffer(),
              ],
            ),
          ),
          StatusBar(),
        ],
      ),
    );
  }
}
