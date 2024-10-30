import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeditor/models/text_editing_state.dart';
import 'package:myeditor/notifiers/text_editing_notifier.dart';

final textEditingProvider =
    NotifierProvider<TextEditingNotifier, TextEditingState>(
        TextEditingNotifier.new);

final focusNodeProvider = Provider<FocusNode>((ref) {
  return FocusNode();
});
