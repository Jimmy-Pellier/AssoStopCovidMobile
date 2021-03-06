import 'package:assostopcovidmobile/models/Association.dart';
import 'package:assostopcovidmobile/models/QrCodeModel.dart';
import 'package:assostopcovidmobile/models/UserMobile.dart';
import 'package:assostopcovidmobile/screens/Authentication.dart';
import 'package:assostopcovidmobile/screens/EquipePage.dart';
import 'package:assostopcovidmobile/screens/ListeEvenements.dart';
import 'package:assostopcovidmobile/services/HexColor.dart';
import 'package:assostopcovidmobile/widgets/BottomNavBarWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'QrCodePage.dart';

enum Page { screenDashboard, screenProfile, screenSearch, Dashboard, Events, Qrcode }

extension on Page {
  String get route => describeEnum(this);
}

class StartupApplication extends StatelessWidget {
  final Association association;
  final UserMobile user;
  final QrCodeModel qrCode;

  StartupApplication(this.association, this.user, this.qrCode) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BackStack Support App',
      home: MainBodyApp(this.association, this.user, this.qrCode, UniqueKey()),
    );
  }
}

class MainBodyApp extends HookWidget {
  final Association association;
  final UserMobile user;
  final QrCodeModel qrCode;

  final Map<Page, Widget> _fragments = {
    Page.Qrcode: QrCodePage(UniqueKey()),
    Page.screenProfile: EquipePage(UniqueKey()),
    Page.Events: ListeEvenements(UniqueKey()),
  };

  MainBodyApp(this.association, this.user, this.qrCode, key) : super(key: key) {
    _fragments[Page.Dashboard] = DashboardPage(association);
  }

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalObjectKey<NavigatorState>(context);

    return WillPopScope(
      onWillPop: () async {
        if (navigatorKey.currentState.canPop()) {
          navigatorKey.currentState.pop();
          return false;
        }

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: HexColor.fromHex(association.color),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return new Authentication();
              }));

              // _scaffoldkey.currentState.openDrawer();
            },
            child: CircleAvatar(
              radius: 55.0,
              backgroundImage: NetworkImage(DotEnv().env['backendImage_url'] + user.image),
            ),
          ), //Icon(Icons.menu),
          title: Text(association.designation),
          actions: [],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Navigator(
                  key: navigatorKey,
                  initialRoute: Page.Dashboard.route,
                  onGenerateRoute: (settings) {
                    final pageName = settings.name;

                    final page = _fragments.keys.firstWhere((element) => describeEnum(element) == pageName);

                    return MaterialPageRoute(settings: settings, builder: (context) => _fragments[page]);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavBarWidget(key: UniqueKey(), navigatorkey: navigatorKey, backgroundColor: HexColor.fromHex(association.color)),
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(' screenProfile ...'),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final Association association;

  DashboardPage(this.association);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 80.0, left: 10.0, right: 10.0, bottom: 20.0),
        height: 150.0,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(DotEnv().env['backendImage_url'] + association.logo))),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(' screenSearch ...'),
    );
  }
}
