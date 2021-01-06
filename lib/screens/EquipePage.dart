import 'package:assostopcovidmobile/models/Equipe.dart';
import 'package:assostopcovidmobile/services/Constant.dart';
import 'package:assostopcovidmobile/services/EquipeService.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipePage extends StatefulWidget {
  final EquipeService equipeService = new EquipeService();

  EquipePage(Key key) : super(key: key);

  @override
  _EquipePage createState() => _EquipePage();
}

const PrimaryColor = const Color(0xFF151026);

class _EquipePage extends State<EquipePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
        key: _scaffoldkey,
        future:  widget.equipeService.getByUserId(storage.read(key: userId_Key)),
        builder: (context, data) {

          if (data.hasData) {
            Equipe equipe = data.data;

            Widget categorieSection = Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Icon(
                                Icons.sports_basketball,
                              ))
                        ],
                      )),
                  Expanded(
                    /*1*/
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              equipe != null && equipe.categorieDesignation != null ? equipe.categorieDesignation : '',
                              softWrap: true,
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );

            Widget entraineurSection = Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Icon(
                                Icons.sports,
                              ))
                        ],
                      )),
                  Expanded(
                    /*1*/
                    flex: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              equipe != null && equipe.entraineur != null ? equipe.entraineur : '',
                              softWrap: true,
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Icon(
                                Icons.people,
                              ))
                        ],
                      )),
                  Expanded(
                    /*1*/
                    flex: 35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              equipe != null ? equipe.nbJoueur.toString() + ' joueurs' : '',
                              softWrap: true,
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            );

            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/basketball-team.jpg',
                      width: 600,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        data.data != null ? data.data.designation : '',
                        softWrap: true,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    categorieSection,
                    entraineurSection,
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Effectif',
                          softWrap: true,
                          style: TextStyle(fontSize: 24),
                        )),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: data.data != null
                                ? data.data.personnes.length
                                : 0,
                            itemBuilder: (context, index) {
                              return new Card(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <
                                          Widget>[
                                        ListTile(
                                          title: Text('${data.data.personnes[index]
                                              .prenom} ${data.data.personnes[index]
                                              .nom}'),
                                          //subtitle: Text('${dateFormat.format(listEvt[index].dateEvenement)}'),
                                        )
                                      ]));
                            }))


                  ],
                ));
          }
          else{
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.white));
          }
        });
  }
}
