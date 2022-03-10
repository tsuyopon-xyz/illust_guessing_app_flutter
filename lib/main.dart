import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/selected_quiz_progress.dart';
import 'package:illust_guessing_app/src/providers/selected_quiz_progress_provider.dart';

import 'src/views/pages/quiz_select_page.dart' show QuizSelectPage;
import 'src/views/pages/quiz_page.dart' show QuizPage;
import 'src/views/pages/setting_page.dart' show SettingPage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SelectedQuizProgress sqp = ref.watch(selectedQuizProgressProvider);
    int currentChapterIndex = sqp.currentChapterIndex ?? -1;

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'イラスト推理($currentChapterIndex)',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('イラスト推理($currentChapterIndex)'),
    //     ),
    //     body: const QuizSelectPage(),
    //   ),
    // );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'イラスト推理($currentChapterIndex)',
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'quiz-select',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const QuizSelectPage(),
        );
      },
    ),
    GoRoute(
      path: '/quiz/:quizId',
      name: 'quiz',
      pageBuilder: (context, state) {
        int quizId = int.parse(state.params['quizId'] as String);

        return MaterialPage(
            key: state.pageKey, child: QuizPage(quizId: quizId));
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (context, state) {
        return MaterialPage(key: state.pageKey, child: const SettingPage());
      },
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
      child: Scaffold(body: Center(child: Text(state.error.toString())))),
);
