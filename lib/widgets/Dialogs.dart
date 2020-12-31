import 'package:assostopcovidmobile/services/HexColor.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: HexColor.fromHex('#183650'),
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(backgroundColor: Colors.white,),
                        SizedBox(height: 10,),
                        Text("Veuillez patienter....",style: TextStyle(color: Colors.white ),)
                      ]),
                    )
                  ]));
        });
  }
}
