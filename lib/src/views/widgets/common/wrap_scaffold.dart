import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WrapScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const WrapScaffold({Key? key, required this.body, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).push('/settings');
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: body);
  }
}
