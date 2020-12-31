import 'dart:io';

import 'package:assostopcovidmobile/dao/Dao.dart';
import 'package:assostopcovidmobile/models/Personne.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PersonneService {
  var daoRole = new Dao<Personne, Personne>(new Personne());

  PersonneService();

  get(userId) async {
    var personneObject = new Personne();

    var response = await daoRole.get(DotEnv().env['BackEnd_Url'] + '/assostopcovid/api/byuser?userid=' + userId, personneObject);

    if (response.statusCode == HttpStatus.ok) {}
    return personneObject;
  }
}
