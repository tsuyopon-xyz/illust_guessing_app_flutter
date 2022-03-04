import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/views/quiz_select_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'イラスト推理',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('イラスト推理'),
        ),
        body: const QuizSelectView(),
      ),
    );
  }
}
