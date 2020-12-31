import 'package:assostopcovidmobile/models/Evenement.dart';
import 'package:assostopcovidmobile/services/Constant.dart';
import 'package:assostopcovidmobile/services/EvenementService.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListeEvenements extends StatefulWidget {
  final EvenementService evtService = new EvenementService();

  ListeEvenements(Key key) : super(key: key);

  @override
  _ListeEvenements createState() => _ListeEvenements();
}

const PrimaryColor = const Color(0xFF151026);

class _ListeEvenements extends State<ListeEvenements> {

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy à HH:mm");

    return FutureBuilder(
      future: widget.evtService.getListactif(storage.read(key: userId_Key)),
      builder:(context, data) {
        if (data.hasData) {
          List<Evenement> listEvt = data.data;

          return ListView.builder(
              itemCount: listEvt != null ? listEvt.length : 0,
              itemBuilder: (context, index) {
                return new GestureDetector(
                    onTap: () async {
                      if (!listEvt[index].estPresent)
                        await widget.evtService.setPresence(
                            listEvt[index], storage.read(key: userId_Key));
                      else
                        await widget.evtService.setAbsence(
                            listEvt[index], storage.read(key: userId_Key));

                      setState(() {
                        listEvt[index].estPresent = !listEvt[index].estPresent;
                      });

                      // _scaffoldkey.currentState.openDrawer();
                    },
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: listEvt[index].estPresent != null &&
                                listEvt[index].estPresent
                                ? Icon(Icons.check_box)
                                : Icon(Icons.check_box_outline_blank_sharp),
                            title: Text('${listEvt[index].designationType}'),
                            subtitle: Text('${dateFormat.format(
                                listEvt[index].dateEvenement)}'),
                          ),
                        ],
                      ),
                    ));
              });
        }
        else{
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.white));
        }
      },
    );
  }
}
