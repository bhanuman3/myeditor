import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/models/text_editing_state.dart';

class TextEditingNotifier extends Notifier<TextEditingState> {
  @override
  TextEditingState build() {
    return TextEditingState(
      cursorIndex: 0,
      content: """class Main {
  public static void main(String args[]) {
    System.out.println("Hello world");
  }
}""",
      cursorPosition: CursorPosition(1, 1),
    );
  }

  void addChar(String? char) {
    final pos = state.cursorPosition;
    final List<String> list = state.content.split('');
    list.insert(state.cursorIndex, char!);
    state = state.copyWith(
      content: list.join(),
      cursorPosition: CursorPosition(pos.line, pos.col + 1),
      cursorIndex: state.cursorIndex + 1,
    );
  }

  void delChar() {
    final pos = state.cursorPosition;
    final List<String> list = state.content.split('');
    list.removeAt(state.cursorIndex - 1);
    state = state.copyWith(
      content: list.join(),
      cursorPosition: CursorPosition(pos.line, pos.col - 1),
      cursorIndex: state.cursorIndex - 1,
    );
  }

  void moveCursorRight() {
    final pos = state.cursorPosition;
    state = state.copyWith(
      cursorPosition: CursorPosition(pos.line, pos.col + 1),
      cursorIndex: state.cursorIndex + 1,
    );
  }

  void moveCursorLeft() {
    final pos = state.cursorPosition;
    state = state.copyWith(
      cursorPosition: CursorPosition(pos.line, pos.col - 1),
      cursorIndex: state.cursorIndex - 1,
    );
  }

  void moveCursorUp() {
    final pos = state.cursorPosition;
    state = state.copyWith(
      cursorPosition: CursorPosition(pos.line - 1, pos.col),
    );
  }

  void moveCursorDown() {
    final pos = state.cursorPosition;
    state = state.copyWith(
      cursorPosition: CursorPosition(pos.line + 1, pos.col),
    );
  }
}
