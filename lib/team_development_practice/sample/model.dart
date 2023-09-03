import "package:cloud_firestore/cloud_firestore.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../todo.dart';

/// すべての [Todo] を dueDateTime の昇順で購読する。
final todosFutureProvider = StreamProvider.autoDispose<List<Todo>>((ref) {
  // 前半の処理は ripository などに分けるのがベターだが今回はそのままにしている
  final todoCollectionReference = FirebaseFirestore.instance.collection('todos').withConverter<Todo>(
        fromFirestore: (ds, _) => Todo.fromDocumentSnapshot(ds),
        toFirestore: (_, __) => throw UnimplementedError(),
      );
  final Query<Todo> query = todoCollectionReference.orderBy('dueDateTime', descending: false);
  var streamQs = query.snapshots();

  return streamQs.map((qs) {
    final result = qs.docs.map((qds) => qds.data()).toList();
    return result;
  });
});

final sampleTodoServiceProvider = Provider.autoDispose<TodoService>(
  (ref) => const TodoService(),
);

/// [Todo] を操作するメソッドを管理する。
class TodoService {
  const TodoService();

  /// [Todo] を追加する。
  Future<void> add({
    required String title,
    required String description,
    required DateTime dueDateTime,
  }) =>
      FirebaseFirestore.instance.collection('todos').add({
        "title": title,
        "description": description,
        "isDone": false,
        "dueDateTime": dueDateTime,
      });

  /// 指定した [Todo] の `isDone` を更新する。
  Future<void> updateCompletionStatus({
    required String firestoreId,
    required bool status,
  }) =>
      FirebaseFirestore.instance.collection('todos').doc(firestoreId).update({
        "isDone": status,
      });
}
