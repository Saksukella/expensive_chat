class FSService<T> {
  Stream<List<T>> getStream() {
    throw UnimplementedError();
  }

  Future<void> savetoCloud(T t) async {}

  Future<T?> readCloud({
    String? id,
  }) async {
    return null;
  }

  Future<void> updateCloud(T t, {String? id}) async {}

  Future<void> deleteCloud({String? id}) async {}
}
