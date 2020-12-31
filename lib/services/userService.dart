import 'dart:io';
import 'package:assostopcovidmobile/dao/Dao.dart';
import 'package:assostopcovidmobile/models/User.dart';
import 'package:assostopcovidmobile/models/UserAuth.dart';
import 'package:assostopcovidmobile/models/UserMobile.dart';
import 'package:assostopcovidmobile/services/Constant.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserService {
  final daoUserAuth = new Dao<User, UserAuth>(new User());
  final daoUserMobile = new Dao<UserMobile, UserMobile>(new UserMobile());

  UserService();

  Future<UserMobile> get(userId) async {
    var userObject = new UserMobile();

    var response = await daoUserMobile.get(DotEnv().env['BackEnd_Url'] + '/user/api/usermobile/' + userId, userObject);

    if (response.statusCode != HttpStatus.ok) {
      userObject = null;
    }

    return userObject;
  }

  Future<Response> authentification(
    login,
    password,
  ) async {
    final key = Key.fromUtf8(DotEnv().env['aes_key']);
    final iv = IV.fromUtf8(DotEnv().env['aes_iv']);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));

    final encryptLogin = encrypter.encrypt(login, iv: iv);
    final encryptPass = encrypter.encrypt(password, iv: iv);

    var body = new User();
    var resObject = new UserAuth();
    body.username = encryptLogin.base64;
    body.password = encryptPass.base64;
    body.keyMobile = DotEnv().env['secretKey'];


    var response = await daoUserAuth.post(DotEnv().env['BackEnd_Url'] + "/user/api/usermobile/authenticate", body, resObject);

    if (response.statusCode == HttpStatus.ok) {
      //Enregistrement des token JWT

      storage.write(key: jwtToken_Key, value: resObject.token);
      storage.write(key: jwtRefreshToken_Key, value: resObject.refreshToken);
      storage.write(key: userId_Key, value: resObject.id.toString());
    }

    return response;
  }
}
