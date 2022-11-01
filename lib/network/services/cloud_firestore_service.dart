import 'package:cloud_firestore/cloud_firestore.dart';

typedef ResponseBuilder<T> = T Function(Map<String, dynamic> data);
typedef QueryBuilder = Query<Map<String, dynamic>>? Function(
  Query<Map<String, dynamic>> query,
);

class CloudFireStoreService {
  CloudFireStoreService._() {
    _fireStore = FirebaseFirestore.instance;
  }

  static final CloudFireStoreService instance = CloudFireStoreService._();
  late final FirebaseFirestore _fireStore;

  /**
   * Add data with an auto-generated documentId
   */
  Future addData({
    required String collPath,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.collection(collPath).add(data);
  }

  /**
   * Set data with document path
   */
  Future setDocData({
    required String docPath,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    await _fireStore.doc(docPath).set(data, SetOptions(merge: merge));
  }

  /**
   * Update data with document path
   */
  Future updateDocData({
    required String docPath,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.doc(docPath).update(data);
  }

  /**
   * Delete data with document path
   */
  Future deleteDocData({required String docPath}) async {
    await _fireStore.doc(docPath).delete();
  }

  /**
   * Get all data in collection
   */
  Future<List<T>> getDocsData<T>({
    required String collPath,
    required ResponseBuilder<T> responseBuilder,
    QueryBuilder? queryBuilder,
  }) async {
    Query<Map<String, dynamic>> query = _fireStore.collection(collPath);

    if (queryBuilder != null) {
      query = queryBuilder.call(query)!;
    }

    final snapshots = await query.get();

    final dataList = snapshots.docs
        .map((doc) => doc.exists ? responseBuilder(doc.data()) : null)
        .toList();

    dataList.removeWhere((value) => value == null);

    return dataList.cast<T>();
  }

  /**
   * Get data with document path
   */
  Future<T?> getDocData<T>({
    required String docPath,
    required ResponseBuilder<T> responseBuilder,
  }) async {
    final snapshot = await _fireStore.doc(docPath).get();
    if (snapshot.data() == null) {
      return null;
    }

    return responseBuilder(snapshot.data()!);
  }

  /**
   * Stream all data in collection
   */
  Stream<List<T>> collectionStream<T>({
    required String collPath,
    required ResponseBuilder<T> responseBuilder,
    QueryBuilder? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query = _fireStore.collection(collPath);

    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }

    return query.snapshots().map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => responseBuilder(snapshot.data()))
          .where((value) => value != null)
          .toList();

      if (sort != null) {
        result.sort(sort);
      }

      return result;
    });
  }

  /**
   * Stream data with document path
   */
  Stream<T?> documentStream<T>({
    required String docPath,
    required ResponseBuilder<T> responseBuilder,
  }) {
    final reference = _fireStore.doc(docPath);

    return reference.snapshots().map((snapshot) {
      return snapshot.data() != null ? responseBuilder(snapshot.data()!) : null;
    });
  }
}
