import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  const Todo({
    this.firestoreId,
    required this.title,
    required this.description,
    required this.isDone,
    required this.dueDateTime,
    this.updatedAt,
  });

  final String? firestoreId;
  final String title;
  final String description;
  final bool isDone;
  final DateTime dueDateTime;
  final DateTime? updatedAt;

  factory Todo._fromJson(Map<String, dynamic> json) {
    return Todo(
      firestoreId: json['firestoreId'] as String,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isDone: json['isDone'] as bool? ?? false,
      dueDateTime: (json['dueDateTime'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  factory Todo.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Todo._fromJson(<String, dynamic>{
      ...data,
      'firestoreId': ds.id,
      'path': ds.reference.path,
    });
  }
}
