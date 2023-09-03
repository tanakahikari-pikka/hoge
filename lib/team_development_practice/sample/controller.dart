import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../todo.dart';
import 'model.dart';

final sampleTodosControllerProvider = Provider.autoDispose<SampleTodosController>(
  (ref) => SampleTodosController(
    todoService: ref.watch(sampleTodoServiceProvider),
  ),
);

class SampleTodosController {
  const SampleTodosController({
    required TodoService todoService,
  }) : _todoService = todoService;

  final TodoService _todoService;

  /// [Todo] を追加する。
  Future<void> addTodo({
    required String title,
    required String description,
    required DateTime dueDateTime,
  }) async {
    await _todoService.add(
      title: title,
      description: description,
      dueDateTime: dueDateTime,
    );
  }

  /// 指定した [Todo] の `isDone` をトグルする。
  Future<void> toggleCompletionStatus({
    required Todo todo,
  }) =>
      _todoService.updateCompletionStatus(
        firestoreId: todo.firestoreId!,
        status: !todo.isDone,
      );
}
