abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> checkIfDocumentExists({
    required String path,
    required String documentId,
  });

  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
    String? orderBy, // اسم الحقل للترتيب
    bool descending = false, // اتجاه الترتيب
    int? limit, // عدد النتائج الأقصى
    Map<String, dynamic>? whereEqual,
  });
}
