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
        throw CustomExceptions(message: 'weak-password');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'email already in use');
      } else {
        throw CustomExceptions(message: 'something went wrong, try again');
      }
    } catch (e) {
      throw CustomExceptions(message: 'something went wrong, try again');
    }
  }
}
