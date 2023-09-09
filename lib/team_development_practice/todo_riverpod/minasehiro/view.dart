import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../todo.dart';
import 'controller.dart';
import 'model.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 一覧'),
      ),
      body: ref.watch(todosFutureProvider).when(
            data: (todos) => ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) => _TodoItem(todos[index]),
            ),
            error: (_, __) => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (context) => const _AddTodoBottomSheet(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TodoItem extends ConsumerWidget {
  const _TodoItem(this.todo);

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          todo.isDone ? Icons.check_box_outlined : Icons.check_box_outline_blank,
        ),
        onPressed: () => ref.read(todosControllerProvider).toggleCompletionStatus(todo: todo),
      ),
      title: Text(todo.title),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      subtitle: Text(todo.description),
      trailing: Text(DateFormat('yyyy年M月d日').format(todo.dueDateTime)),
    );
  }
}

class _AddTodoBottomSheet extends ConsumerStatefulWidget {
  const _AddTodoBottomSheet();

  @override
  ConsumerState<_AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends ConsumerState<_AddTodoBottomSheet> {
  late final TextEditingController _titleTextEditingController;
  late final TextEditingController _descriptionTextEditingController;
  late final TextEditingController _dueDateTimeTextEditingController;
  DateTime? _selectedDateTime;

  @override
  void initState() {
    _titleTextEditingController = TextEditingController();
    _descriptionTextEditingController = TextEditingController();
    _dueDateTimeTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    _dueDateTimeTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 32,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Todo の追加',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleTextEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'タイトル',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionTextEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '説明',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _dueDateTimeTextEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '締め切り日',
            ),
            readOnly: true,
            onTap: () async {
              final now = DateTime.now();
              final nextYear = DateTime(now.year + 1, now.month, now.day);
              final date = await showDatePicker(
                context: context,
                initialDate: now,
                firstDate: now,
                lastDate: nextYear,
              );
              if (date == null) {
                return;
              }
              _selectedDateTime = date;
              _dueDateTimeTextEditingController.text = DateFormat('yyyy年M月d日').format(date);
              setState(() {});
            },
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await ref.read(todosControllerProvider).addTodo(
                      title: _titleTextEditingController.text,
                      description: _descriptionTextEditingController.text,
                      dueDateTime: _selectedDateTime!,
                    );
                navigator.pop();
              },
              child: const Text('Todo を追加する'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
