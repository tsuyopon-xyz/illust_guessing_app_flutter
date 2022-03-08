abstract class IRepository<T> {
  Future<T> find({required int id, bool includes = false});
  Future<List<T>> findAll({bool includes = false});
  Future<List<T>> findWhere({required String where, bool includes = false});
  Future<bool> save(T data);
  Future<bool> saveAll(List<T> dataList);
  Future<bool> delete(T data);
  Future<bool> deleteAll();
}
