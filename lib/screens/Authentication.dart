import 'dart:io';

import 'package:assostopcovidmobile/screens/Application.dart';
import 'package:assostopcovidmobile/services/AssociationService.dart';
import 'package:assostopcovidmobile/services/Constant.dart';
import 'package:assostopcovidmobile/services/HexColor.dart';
import 'package:assostopcovidmobile/services/QrcodeService.dart';
import 'package:assostopcovidmobile/services/userService.dart';
import 'package:assostopcovidmobile/widgets/Dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _Authentication createState() => _Authentication();
}

class _Authentication extends State<Authentication> {
  var colorBlue = Color(0xFF1871fb);
  var colorWhite = Color(0xFFFFFFFF);
  var colorBlack = Color(0xFF1e1e1d);
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String _login, _password;
  String message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/header_login.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Container(

                padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                  Text("Connexion",
                    style: TextStyle(color: HexColor.fromHex('#183650'), fontSize: 30)),

              ])),
            Container(
                padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[Text("Merci de bien vouloir vous connecter pour continuer",
                    style: TextStyle(fontSize: 13, color: HexColor.fromHex('#183650')))]
            )),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                      child: TextFormField(

                          decoration: const InputDecoration(
                            labelText: 'Login ',
                          hintText: 'Identifiant',
                            border: const OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (input) => input.isEmpty ? 'Champs invalide' : null,
                        onSaved: (input) => _login = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 20.0, left: 20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Mot de passe ',
                          hintText: 'Mot de Passe',
                          border: const OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(16),
                        ),
                        validator: (input) => input.length < 8 ? 'Le mot de Passe doit contenir au moins 8 caractères' : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                  /*  Container(
                        child:
                        Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: FlatButton(
                              onPressed: () {
                                // envoi email à l'utilisateur avec nouveau mot de passe.
                              },
                              child: Text(
                                'Mot de passe oublié ?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          )
                        ])),*/
                    Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0),
                                // side: BorderSide(color: Colors.red)
                              ),
                              color: HexColor.fromHex('#183650'),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();

                                  Dialogs.showLoadingDialog(context, _keyLoader);

                                  UserService service = new UserService();
                                  await storage.deleteAll();
                                  var res = await service.authentification(_login, _password);

                                  if (res != null &&  res.statusCode == HttpStatus.ok) {
                                    var associationService = new AssociationService();
                                    var userService = new UserService();
                                    var qrcodeService = new QrcodeService();
                                    var userId = await storage.read(key: userId_Key);

                                    var user = await userService.get(userId);
                                    var asso = await associationService.get(userId);
                                    var qrCode = await qrcodeService.getbyUser(userId);
                                    if (asso != null) {
                                      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (BuildContext context) {
                                          return new StartupApplication(asso, user, qrCode);
                                        }),
                                      );
                                    }
                                    else {
                                      setState(() {
                                        message =
                                        "Vous ne disposez pas les droits nécessaires";
                                      });
                                      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                                    }


                                  } else {
                                    setState(() {
                                      message = "le login / mot de passe est incorrect";
                                    });

                                    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                                  }
                                }
                              },
                              child: Text(
                                'SE CONNECTER',
                                style: TextStyle(color: Colors.white, fontSize: 18, backgroundColor: Color.fromRGBO(24, 54, 80, 0.4)),
                              ),
                            ),

                          ],
                        )),
                    Container(
                        child:
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              message,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ])),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
