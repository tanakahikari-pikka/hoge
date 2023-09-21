part of 'todo_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo 一覧'),
          actions: const [SettingButton()],
        ),
        body: _TodoList(),
        floatingActionButton: const AddTodoButton());
  }
}
