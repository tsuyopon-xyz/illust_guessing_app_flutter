import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _wrapPage(const Center(child: Text("設定")));
  }
}

Scaffold _wrapPage(Widget widget) => Scaffold(
    appBar: AppBar(
      title: const Text('設定ページ'),
    ),
    body: widget);
