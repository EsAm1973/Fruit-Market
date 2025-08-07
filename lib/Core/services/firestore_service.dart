import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_market/Core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data()!;
  }

  @override
  Future<bool> checkIfDocumentExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
    String? orderBy,
    bool descending = false,
    int? limit,
    Map<String, dynamic>? whereEqual,
  }) async {
    Query<Map<String, dynamic>> query = firestore.collection(path);

    // إذا فيه فلتر مساواة
    if (whereEqual != null) {
      whereEqual.forEach((field, value) {
        query = query.where(field, isEqualTo: value);
      });
    }

    // إذا فيه ترتيب
    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending);
    }

    // إذا فيه حد أقصى
    if (limit != null) {
      query = query.limit(limit);
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }
}
