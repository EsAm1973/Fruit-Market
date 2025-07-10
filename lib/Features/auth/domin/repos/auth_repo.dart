import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Features/auth/domin/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
