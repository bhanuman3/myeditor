class CursorPosition {
  final int line;
  final int col;

  CursorPosition(this.line, this.col);
}

class TextEditingState {
  final int cursorIndex;
  final String content;
  final CursorPosition cursorPosition;

  TextEditingState({
    required this.cursorIndex,
    required this.content,
    required this.cursorPosition,
  });

  TextEditingState copyWith({
    int? cursorIndex,
    String? content,
    CursorPosition? cursorPosition,
  }) {
    return TextEditingState(
      cursorIndex: cursorIndex ?? this.cursorIndex,
      content: content ?? this.content,
      cursorPosition: cursorPosition ?? this.cursorPosition,
    );
  }
}
