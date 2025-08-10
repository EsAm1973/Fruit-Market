import 'dart:convert';

import 'package:fruit_market/Core/services/shared_prefrences_sengelton.dart';
import 'package:fruit_market/Features/auth/data/models/user_model.dart';
import 'package:fruit_market/Features/auth/domin/entites/user_entity.dart';
import 'package:fruit_market/constants.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kuserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
