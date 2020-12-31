import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  final GlobalObjectKey<NavigatorState> navigatorkey;
  final Color backgroundColor;

  BottomNavBarWidget({Key key, this.navigatorkey, this.backgroundColor}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

enum Page { screenDashboard, screenProfile, screenSearch, Dashboard, Events, Qrcode }

extension on Page {
  String get route => describeEnum(this);
}

class _NavbarState extends State<BottomNavBarWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: widget.backgroundColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: index,
      onTap: (value) {
        setState(() {
          index = value;
        });

        switch (value) {
          case 0:
            widget.navigatorkey.currentState.pushNamed(Page.Dashboard.route);
            break;
          case 1:
            widget.navigatorkey.currentState.pushNamed(Page.screenProfile.route);
            break;
          case 2:
            widget.navigatorkey.currentState.pushNamed(Page.Events.route);
            break;
          case 3:
            widget.navigatorkey.currentState.pushNamed(Page.Qrcode.route);
            break;
          default:
        }
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Equipe',
          icon: Icon(Icons.people),
        ),
        /* BottomNavigationBarItem(
          label: 'Effectif',
          icon: Icon(Icons.switch_account),
        ),*/
        BottomNavigationBarItem(
          label: 'Evènement',
          icon: Icon(Icons.calendar_today),
        ),
        BottomNavigationBarItem(
          label: 'Qr Code',
          icon: Icon(Icons.qr_code),
        ),
      ],
    );
  }
}
