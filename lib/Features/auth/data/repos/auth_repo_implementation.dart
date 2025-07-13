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
      var userEntity = await getUserData(userId: user.uid);
      return Right(userEntity);
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImplementation.signInWithEmailAndPassword: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDocumentExists(
        path: BackendEndpoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      if (user != null) await firebaseAuthServices.deleteUser();
      log("Exception in AuthRepoImplementation.signInWithGoogle: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDocumentExists(
        path: BackendEndpoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      if (user != null) await firebaseAuthServices.deleteUser();
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
        documentId: user.uid,
      );
    } catch (e) {
      log("Exception in AuthRepoImplementation.addUserData: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpoints.getUserData,
        documentId: userId,
      );
      return UserModel.fromJson(data);
    } catch (e) {
      log("Exception in AuthRepoImplementation.getUserData: $e");
      return UserModel.fromJson({});
    }
  }
}
