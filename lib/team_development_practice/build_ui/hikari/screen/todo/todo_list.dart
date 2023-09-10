part of 'todo_screen.dart';

class _TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return _TodoTile(todo: todos[index]);
      },
    );
  }
}
