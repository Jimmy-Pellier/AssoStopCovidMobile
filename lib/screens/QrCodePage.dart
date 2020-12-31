import 'package:assostopcovidmobile/models/QrCodeModel.dart';
import 'package:assostopcovidmobile/services/Constant.dart';

import 'package:assostopcovidmobile/services/QrcodeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatefulWidget {
  final QrcodeService qrcodeService = new QrcodeService();

  QrCodePage(Key key) : super(key: key);

  @override
  _DashBoard createState() => _DashBoard();
}

const PrimaryColor = const Color(0xFF151026);

class _DashBoard extends State<QrCodePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  QrCodeModel qrCode;
  @override
  void initState() {
    super.initState();
    widget.qrcodeService.getbyUser(storage.read(key: userId_Key)).then((result) {
      // If we need to rebuild the widget with the resulting data,
      // make sure to use `setState`
      setState(() {
        qrCode = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Center(
          child: QrImage(
        data: qrCode != null ? qrCode.code : "",
        version: QrVersions.auto,
        size: 320,
        gapless: false,
        errorStateBuilder: (cxt, err) {
          return Container(
            child: Center(
              child: Text(
                "Une erreur est survenue",
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      )),
    );
  }
}
