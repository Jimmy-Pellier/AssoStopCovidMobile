import 'dart:io';
import 'package:assostopcovidmobile/dao/Dao.dart';
import 'package:assostopcovidmobile/models/QrCodeModel.dart';
import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class QrcodeService {
  final daoQrcodeDao = new Dao<QrCodeModel, QrCodeModel>(new QrCodeModel());

  QrcodeService();

  Future<QrCodeModel> getbyUser(userId) async {
    var object = new QrCodeModel();

    var response =
        await daoQrcodeDao.get(DotEnv().env['BackEnd_Url'] + '/assostopcovid/api/qrcodemobile/generate?userid=' + await userId, object);

    if (response.statusCode != HttpStatus.ok) {
      object = null;
    }

    return object;
  }
}
