import 'dart:io';

import 'package:assostopcovidmobile/dao/Dao.dart';
import 'package:assostopcovidmobile/models/Equipe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EquipeService {
  var daoRole = new Dao<Equipe, Equipe>(new Equipe());

  EquipeService();

  getByUserId(userId) async {
    var object = new Equipe();

    var response =
        await daoRole.get(DotEnv().env['BackEnd_Url'] + '/assostopcovid/api/equipesmobile/byuser?userid=${await userId}', object);

    if (response.statusCode != HttpStatus.ok) {
      object = null;
    }
    return object;
  }
}
