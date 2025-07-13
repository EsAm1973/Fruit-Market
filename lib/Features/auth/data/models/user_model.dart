import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_market/Features/auth/domin/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email, required super.name});

  factory UserModel.fromFirebaseUser(User user) =>
      UserModel(uid: user.uid, email: user.email!, name: user.displayName!);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(uid: json['uid'], email: json['email'], name: json['name']);
}
