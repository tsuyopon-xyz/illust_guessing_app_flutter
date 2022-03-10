import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/views/widgets/common/wrap_scaffold.dart'
    show WrapScaffold;

class ErrorPage extends HookConsumerWidget {
  const ErrorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const WrapScaffold(
        title: 'Error Page', body: Center(child: Text("Error...")));
  }
}
