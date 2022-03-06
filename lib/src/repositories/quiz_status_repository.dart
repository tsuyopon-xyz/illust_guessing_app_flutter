import 'i_repository.dart' show IRepository;
import '../models/quiz_status.dart' show QuizStatus;
import '../utils/quiz_status_list_manager.dart' show QuizStatusListManager;

class QuizStatusRepository implements IRepository<QuizStatus> {
  final QuizStatusListManager _quizStatusListManager;

  QuizStatusRepository(this._quizStatusListManager);

  @override
  Future<QuizStatus> find() {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<QuizStatus>> findAll() async {
    return await _quizStatusListManager.load();
  }

  @override
  Future<bool> save(QuizStatus data) async {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAll(List<QuizStatus> dataList) async {
    return await _quizStatusListManager.save(dataList);
  }

  @override
  Future<bool> delete(QuizStatus data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAll() async {
    return await _quizStatusListManager.delete();
  }
}
