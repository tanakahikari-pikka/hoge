import 'package:flutter/material.dart';

// シードデータ
// 好きなように内容変えて問題ないです
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

// クラス名を自分なりに変えて実装を進めてください
// 自分の名前を入れると他の人と被らないので良さそうです
class TodoIndexSampleView extends StatelessWidget {
  const TodoIndexSampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(),
      ),
    );
  }
}
