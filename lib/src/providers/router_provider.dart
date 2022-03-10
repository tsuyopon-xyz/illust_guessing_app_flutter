import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:illust_guessing_app/src/views/pages/quiz_page.dart'
    show QuizPage;
import 'package:illust_guessing_app/src/views/pages/quiz_select_page.dart'
    show QuizSelectPage;
import 'package:illust_guessing_app/src/views/pages/setting_page.dart'
    show SettingPage;
import 'package:illust_guessing_app/src/views/pages/error_page.dart'
    show ErrorPage;

import 'package:illust_guessing_app/src/providers/quiz_list_provider_v2.dart'
    show quizListProviderV2;

final routerProvider = Provider((ref) {
  return GoRouter(
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

          final quizList = ref.read(quizListProviderV2).value;
          final quiz = quizList?.where((q) => q.id == quizId).first;

          if (quiz == null) {
            return MaterialPage(
              key: state.pageKey,
              child: const ErrorPage(),
            );
          }

          return MaterialPage(
            key: state.pageKey,
            child: QuizPage(quiz: quiz),
          );
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
});
