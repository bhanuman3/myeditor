import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myeditor/cursor.dart';
import 'package:myeditor/status_bar.dart';
import 'package:myeditor/text_buffer.dart';

class Window extends StatefulWidget {
  const Window({super.key});

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  String text = """class Main {
  public static void main(String args[]) {
    System.out.println("Hello world");
  }
}
""";
  final FocusNode focusNode = FocusNode();

  final textStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: 'Menlo',
  );

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyUpEvent) {
          return KeyEventResult.ignored;
        }

        if (event.logicalKey == LogicalKeyboardKey.backspace) {
          setState(() {
            List<String> c = text.split('');
            c.removeLast();
            text = c.join();
          });
          return KeyEventResult.handled;
        }

        if (event.character != null) {
          setState(() {
            text = text + event.character!;
            print(text);
          });
        }

        return KeyEventResult.handled;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  // const Cursor(),
                  TextBuffer(text: text),
                ],
              ),
            ),
            const StatusBar(),
          ],
        ),
      ),
    );
  }
}
