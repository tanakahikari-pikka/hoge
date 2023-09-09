import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../todo.dart';

class SampleTodosController {
  const SampleTodosController();

  /// [Todo] を追加する。
  Future<void> addTodo() async {}

  /// 指定した [Todo] の `isDone` をトグルする。
  Future<void> toggleCompletionStatus() async {}
}
