import 'dart:io';

import 'package:assostopcovidmobile/dao/Dao.dart';
import 'package:assostopcovidmobile/models/Evenement.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EvenementService {
  var dao = new Dao<Evenement, Evenement>(new Evenement());

  EvenementService();

  Future<List<Evenement>> getListactif(userId) async {
    var associationObject = new List<Evenement>();

    var response = await dao.getList(
        DotEnv().env['BackEnd_Url'] + '/assostopcovid/api/evenementsmobile/actif?userid=' + await userId, associationObject);

    if (response.statusCode != HttpStatus.ok) {
      associationObject = null;
    }
    return associationObject;
  }

  setPresence(Evenement evenement, Future<String> userId) async {
    var response = await dao.put(
        DotEnv().env['BackEnd_Url'] + '/assostopcovid/api/evenementsmobile/${evenement.id}/present?userid= ${await userId}',
        evenement,
        null);

    return response.statusCode;
  }

  setAbsence(Evenement evenement, Future<String> userId) async {
    var response = await dao.put(
        DotEnv().env['BackEnd_Url'] + '/assostopcovid/api/evenementsmobile/${evenement.id}/absent?userid= ${await userId}',
        evenement,
        null);

    return response.statusCode;
  }
}
