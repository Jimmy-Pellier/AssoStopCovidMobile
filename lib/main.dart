import 'package:assostopcovidmobile/screens/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(24, 113, 251, .1),
  100: Color.fromRGBO(24, 113, 251, .2),
  200: Color.fromRGBO(24, 113, 251, .3),
  300: Color.fromRGBO(24, 113, 251, .4),
  400: Color.fromRGBO(24, 113, 251, .5),
  500: Color.fromRGBO(24, 113, 251, .6),
  600: Color.fromRGBO(24, 113, 251, .7),
  700: Color.fromRGBO(24, 113, 251, .8),
  800: Color.fromRGBO(24, 113, 251, .9),
  900: Color.fromRGBO(24, 113, 251, 1),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF1871fb, color);
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('fr', ''),
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: colorCustom,
          fontFamily: 'Roboto',
        ),
        home: Scaffold(
          body: Authentication(),
        ));
  }
}
