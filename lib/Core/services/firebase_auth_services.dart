import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_market/Core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'البريد الالكتروني مستخدم بالفعل');
      } else {
        throw CustomExceptions(message: 'هناك خطأ ما, حاول مرة أخرى');
      }
    } catch (e) {
      throw CustomExceptions(message: 'هناك خطأ ما, حاول مرة أخرى');
    }
  }
}
