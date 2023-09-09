import 'package:flutter/material.dart';

List<String> todos = [
  "タマネギを買う",
  "100均でウェットティッシュを買う",
  "なかよし ストリーム店の予約する",
  "テックブログのネタ探す",
  "XX君歓迎会のお店を渋谷で探す",
  "花瓶を中目黒に探しにいく",
  "ランキング上位のストア画像から特徴を洗い出す",
  "矯正中でも食べられるご飯探す",
  "夏服を片付け始める",
  "Google Play からのメールに返信",
  "経費申請",
  "suica にチャージ",
  "WiFi 乗り換え検討",
  "エアコン掃除業者予約",
];

class TodoIndexView extends StatelessWidget {
  const TodoIndexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 一覧'),
        actions: const [SystemButton()],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
              icon: const Icon(
                Icons.check_box_outline_blank,
              ),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('ここで Todo を完了にできます！'),
                  action: SnackBarAction(
                    label: '閉じる',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            title: Text(todos[index]),
            titleTextStyle: Theme.of(context).textTheme.titleMedium,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('ここから Todo を追加できます！'),
            action: SnackBarAction(
              label: '閉じる',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SystemButton extends StatelessWidget {
  const SystemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "システムダイアログです",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "閉じる",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
