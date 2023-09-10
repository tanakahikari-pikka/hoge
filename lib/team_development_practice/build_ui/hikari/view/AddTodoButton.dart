import 'package:flutter/material.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('ここからTodoを追加できます!!'),
            action: SnackBarAction(
              label: '閉じる',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: const Icon(Icons.add),
      ),
    );
  }
}
