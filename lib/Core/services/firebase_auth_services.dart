import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_market/Core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var user = credential.user!;
      await user.updateDisplayName(displayName);
      await user.reload();
      user = FirebaseAuth.instance.currentUser!;
      return user;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthServices.createUserWithEmailAndPassword: $e",
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'البريد الالكتروني مستخدم بالفعل');
      } else {
        throw CustomExceptions(message: 'هناك خطأ ما, حاول مرة أخرى');
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthServices.createUserWithEmailAndPassword: $e",
      );
      throw CustomExceptions(message: 'هناك خطأ ما, حاول مرة أخرى');
    }
  }
}
