import 'dart:io';

import 'package:assostopcovidmobile/dao/Dao.dart';
import 'package:assostopcovidmobile/models/Association.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AssociationService {
  var daoRole = new Dao<Association, Association>(new Association());

  AssociationService();

  Future<Association> get(userId) async {
    var associationObject = new Association();

    var response =
        await daoRole.get(DotEnv().env['BackEnd_Url'] + '/assostopcovid/api/associationsmobile/byuser?userid=' + userId, associationObject);

    if (response.statusCode != HttpStatus.ok) {
      associationObject = null;
    }
    return associationObject;
  }
}
