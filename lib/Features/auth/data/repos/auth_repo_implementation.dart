import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/exceptions.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Core/services/firebase_auth_services.dart';
import 'package:fruit_market/Features/auth/data/models/user_model.dart';
import 'package:fruit_market/Features/auth/domin/entites/user_entity.dart';
import 'package:fruit_market/Features/auth/domin/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  AuthRepoImplementation({required this.firebaseAuthServices});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
