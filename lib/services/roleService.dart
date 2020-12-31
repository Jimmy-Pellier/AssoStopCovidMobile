import 'dart:io';

import 'package:assostopcovidmobile/dao/Dao.dart';
import 'package:assostopcovidmobile/models/Role.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RoleService {
  var daoRole = new Dao<Role, Role>(new Role());

  Future<Role> getRole(String guid) async {
    var roleObject = new Role();

    var response = await daoRole.get(DotEnv().env['BackEnd_Url'] + '/bykeycloakid?keycloakid=' + guid, roleObject);

    if (response.statusCode == HttpStatus.ok) {}

    return roleObject;
  }
}
