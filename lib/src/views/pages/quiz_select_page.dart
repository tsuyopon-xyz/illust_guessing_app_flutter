import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/quiz_status.dart';
import 'package:illust_guessing_app/src/providers/selected_quiz_progress_provider.dart';

import 'package:illust_guessing_app/src/providers/quiz_list_provider_v2.dart'
    show quizListProviderV2;
import 'package:illust_guessing_app/src/models/quiz_v2.dart' show QuizV2;
import 'package:illust_guessing_app/src/views/widgets/common/loading_indicator.dart'
    show LoadingIndicator;

class QuizSelectPage extends ConsumerWidget {
  const QuizSelectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<QuizV2>> asyncValue = ref.watch(quizListProviderV2);

    return asyncValue.when(data: (List<QuizV2> quizList) {
      // return _QuizListView(quizList: quizList);
      return const Center(child: LoadingIndicator());
    }, error: (error, stack) {
      print(error);
      return const Center(child: Text('Error...'));
    }, loading: () {
      return const Center(child: LoadingIndicator());
    });
  }
}

// class _QuizListView extends ConsumerWidget {
//   const _QuizListView({Key? key, required this.quizList}) : super(key: key);

//   final List<QuizV2> quizList;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var quizStatusList = ref.watch(quiz);

//     return ListView.separated(
//       itemCount: quizList.length,
//       itemBuilder: (BuildContext context, int index) {
//         final quiz = quizList[index];
//         final quizStatus = quizStatusList.firstWhere(
//             (_quizStatus) => _quizStatus.quizId == quiz.id,
//             orElse: () => QuizStatus(quizId: -1) // -1 == Not Found
//             );

//         // TODO: ステージのクリア状況を管理するstateを用意して、idを元にロックが解除されているか確認する

//         return Container(
//           decoration: quizStatus.isLocked
//               ? new BoxDecoration(color: Colors.grey.shade400)
//               : null,
//           child: ListTile(
//             contentPadding: const EdgeInsets.all(8),
//             enabled: !quizStatus.isLocked,
//             onTap: () {
//               final sqp = ref.read(selectedQuizProgressProvider.notifier);
//               final _quiz = sqp.state.quiz;

//               if (_quiz == null) {
//                 print("Quizセットします");
//                 sqp.selectQuiz(quiz);
//               } else if (sqp.hasNextChapter()) {
//                 print("次のチャプターに移動");
//                 sqp.goToNextChapter();
//               } else {
//                 print("チャプター終わってます");
//               }
//             },
//             leading: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 quizStatus.isLocked
//                     ? const Icon(Icons.lock)
//                     : quizStatus.isCompleted
//                         ? Icon(Icons.check_circle, color: Colors.green.shade400)
//                         : Icon(Icons.lock_open, color: Colors.orange.shade400)
//               ],
//             ),
//             title: Text(quiz.id.toString(),
//                 style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600)),
//             subtitle: Text(quiz.title,
//                 style: TextStyle(fontSize: 18.0, color: Colors.grey.shade900)),
//             selectedColor: Colors.indigo.shade600,
//           ),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const Divider(height: 0);
//       },
//     );
//   }
// }
