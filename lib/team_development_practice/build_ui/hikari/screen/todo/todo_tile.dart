part of 'todo_screen.dart';

class _TodoTile extends StatelessWidget {
  const _TodoTile({Key? key, required this.todo}) : super(key: key);

  final String todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: (bool? value) {},
      ),
      title: Text(todo),
    );
  }
}
