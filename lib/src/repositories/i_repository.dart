abstract class IRepository<T> {
  Future<List<T>> findAll();
  Future<T> find();
  Future<bool> save(T data);
  Future<bool> saveAll(List<T> dataList);
  Future<bool> delete(T data);
  Future<bool> deleteAll();
}
