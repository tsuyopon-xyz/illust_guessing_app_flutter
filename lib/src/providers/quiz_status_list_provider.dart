import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/quiz_status.dart' show QuizStatus;
import '../repositories/quiz_status_repository.dart' show QuizStatusRepository;
import '../utils/quiz_status_list_manager.dart' show QuizStatusListManager;

final quizStatusListProvider = StateNotifierProvider.autoDispose<
    _QuizStatusListNotifier, List<QuizStatus>>((_) {
  return _QuizStatusListNotifier();
});

class _QuizStatusListNotifier extends StateNotifier<List<QuizStatus>> {
  late final QuizStatusRepository _repository;
  bool isInitialized = false;

  // _QuizStatusListNotifier() : super([]);
  _QuizStatusListNotifier() : super([]) {
    final manager = QuizStatusListManager();
    _repository = QuizStatusRepository(manager);
    _init();
  }

  Future<void> _init() async {
    await load();

    isInitialized = true;
  }

  Future<void> load() async {
    List<QuizStatus> quizStatusList = await _repository.findAll();
    state = quizStatusList;
  }

  Future<bool> save(List<QuizStatus> dataList) async {
    bool result = await _repository.saveAll(dataList);
    await load();

    return result;
  }

  Future<bool> delete() async {
    bool result = await _repository.deleteAll();
    await load();

    return result;
  }
}
