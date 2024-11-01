import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/models/text_editing_state.dart';

String content = """abcd
efgh
ijkl""";

class TextEditingNotifier extends Notifier<TextEditingState> {
  @override
  TextEditingState build() {
    return TextEditingState(
      cursorIndex: 0,
      content: content,
      cursorPosition: CursorPosition(0, 0),
    );
  }

  void addChar(String? char) {
    final pos = state.cursorPosition;
    final List<String> lines = state.lines!;
    final chars = lines[pos.row].split('');
    chars.insert(pos.col, char!);
    lines[pos.row] = chars.join();
    state = state.copyWith(
      lines: lines,
      cursorPosition: CursorPosition(pos.row, pos.col + 1),
    );
  }

  void tab() {
    final pos = state.cursorPosition;
    final List<String> lines = state.lines!;
    final chars = lines[pos.row].split('');
    chars.insert(pos.col, '  ');
    lines[pos.row] = chars.join();
    state = state.copyWith(
      lines: lines,
      cursorPosition: CursorPosition(pos.row, pos.col + 2),
    );
  }

  void delChar() {
    final pos = state.cursorPosition;
    final List<String> lines = state.lines!;
    final chars = lines[pos.row].split('');

    if (pos.col == 0 && pos.row == 0) {
      return;
    }

    if (pos.col == 0) {
      String currentLine = lines.removeAt(pos.row);
      int col = lines[pos.row - 1].length;
      lines[pos.row - 1] = lines[pos.row - 1] + currentLine;
      state = state.copyWith(
        lines: lines,
        cursorPosition: CursorPosition(pos.row - 1, col),
      );
      return;
    }

    chars.removeAt(pos.col - 1);
    lines[pos.row] = chars.join();
    state = state.copyWith(
      lines: lines,
      cursorPosition: CursorPosition(pos.row, pos.col - 1),
    );
  }

  void newLine() {
    final pos = state.cursorPosition;
    final List<String> lines = state.lines!;
    final chars = lines[pos.row].split('');

    final rightChars = chars.sublist(pos.col);
    final leftChars = chars.sublist(0, pos.col);

    lines[pos.row] = leftChars.join();
    lines.insert(pos.row + 1, rightChars.join());

    state = state.copyWith(
      lines: lines,
      cursorPosition: CursorPosition(pos.row + 1, 0),
    );
  }

  void moveCursorRight() {
    final pos = state.cursorPosition;
    final List<String> lines = state.lines!;
    final chars = lines[pos.row].split('');

    if (pos.col == chars.length) {
      return;
    }

    state = state.copyWith(
      cursorPosition: CursorPosition(pos.row, pos.col + 1),
    );
  }

  void moveCursorLeft() {
    if (state.cursorPosition.col == 0) {
      return;
    }
    final pos =
        CursorPosition(state.cursorPosition.row, state.cursorPosition.col - 1);
    state = state.copyWith(
      cursorPosition: pos,
    );
  }

  void moveCursorUp() {
    final pos = state.cursorPosition;
    final List<String> lines = state.lines!;

    int col = pos.col;

    if (pos.row == 0) {
      return;
    }

    if (lines[pos.row - 1].length < col) {
      col = lines[pos.row - 1].length;
    }

    state = state.copyWith(
      cursorPosition: CursorPosition(pos.row - 1, col),
    );
  }

  void moveCursorDown() {
    final pos = state.cursorPosition;
    final List<String> lines = state.lines!;

    int col = pos.col;

    if (pos.row == state.lines!.length - 1) {
      return;
    }

    if (lines[pos.row + 1].length < col) {
      col = lines[pos.row + 1].length;
    }

    state = state.copyWith(
      cursorPosition: CursorPosition(pos.row + 1, col),
    );
  }
}
