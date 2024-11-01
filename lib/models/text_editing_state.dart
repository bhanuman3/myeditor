class CursorPosition {
  final int row;
  final int col;

  CursorPosition(this.row, this.col);
}

class TextEditingState {
  final int cursorIndex;
  final String content;
  final CursorPosition cursorPosition;
  List<String>? lines = [];

  TextEditingState({
    required this.cursorIndex,
    required this.content,
    required this.cursorPosition,
    this.lines,
  }) {
    lines ??= content.split('\n');
  }

  TextEditingState copyWith({
    int? cursorIndex,
    String? content,
    CursorPosition? cursorPosition,
    List<String>? lines,
  }) {
    return TextEditingState(
        cursorIndex: cursorIndex ?? this.cursorIndex,
        content: content ?? this.content,
        cursorPosition: cursorPosition ?? this.cursorPosition,
        lines: lines ?? this.lines);
  }
}
