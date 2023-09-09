import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../todo.dart';

/// すべての [Todo] を dueDateTime の昇順で購読する。

/// TodoService を外部から呼べるように
final sampleTodoServiceProvider = Provider.autoDispose<TodoService>(
  (ref) => const TodoService(),
);

/// [Todo] を操作するメソッドを管理する。
class TodoService {
  const TodoService();

  /// [Todo] を追加する。
  Future<void> add() async {}

  /// 指定した [Todo] の `isDone` を更新する。
  Future<void> updateCompletionStatus() async {}
}
