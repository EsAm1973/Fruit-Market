import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_market/Core/errors/exceptions.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Core/services/database_service.dart';
import 'package:fruit_market/Core/services/firebase_auth_services.dart';
import 'package:fruit_market/Core/utils/backend_endpoints.dart';
import 'package:fruit_market/Features/auth/data/models/user_model.dart';
import 'package:fruit_market/Features/auth/domin/entites/user_entity.dart';
import 'package:fruit_market/Features/auth/domin/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;
  AuthRepoImplementation({
    required this.databaseService,
    required this.firebaseAuthServices,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
        displayName: name,
      );
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomExceptions catch (e) {
      if (user != null) await firebaseAuthServices.deleteUser();
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) await firebaseAuthServices.deleteUser();
      log(
        "Exception in AuthRepoImplementation.createUserWithEmailAndPassword: $e",
      );
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImplementation.signInWithEmailAndPassword: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImplementation.signInWithGoogle: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImplementation.signInWithFacebook: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.addUserData,
        data: user.toMap(),
      );
    } catch (e) {
      log("Exception in AuthRepoImplementation.addUserData: $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
