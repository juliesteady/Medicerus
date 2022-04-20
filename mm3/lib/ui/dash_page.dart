/************************************************************
    Medicerus Mobile: Medical Charting App
    Copyright (C) <2022> Joshua Kramer, et. al.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

*************************************************************/

import 'package:flutter/material.dart';
import 'package:medicerus/prescription.dart';
import 'package:medicerus/userDbHelper.dart';
import 'package:sqflite/sqflite.dart';

import '../otcdrug.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import '../data/drift_database.dart';
// import 'widget/add_rc_item_input_widget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final userdbHelper = UserDatabaseHelper.instance;
  late Future<List<Prescription>> prescriptions;
  late Future<List<Prescription>> pinnedPrescriptions;
  late Future<List<Prescription>> loggedPrescriptions;
  late Future<List<Prescription>> unloggedPrescriptions;
  late Future<List<OTCDrug>> otcDrugs;

  @protected
  @mustCallSuper
  void initState() {
    prescriptions = userdbHelper.getPrescriptions();
    pinnedPrescriptions = userdbHelper.getPinnedPrescriptions();
    loggedPrescriptions = userdbHelper.getLoggedPrescriptions();
    unloggedPrescriptions = getUnloggedPrescriptions();
    otcDrugs = userdbHelper.getOTCDrugs();
  }

  Future<List<Prescription>> getUnloggedPrescriptions() async {
    List<Prescription> presc = await prescriptions;
    print(presc);
    List<Prescription> logged = await loggedPrescriptions;
    print(logged);
    // List<Prescription> unlogged = [];
    // presc.forEach((element) {
    //   int? id = element.id;
    //   if (id != null) {
    //     bool shared = false;
    //     logged.forEach((logElement) {
    //       if (logElement.id == id) {
    //         shared = true;
    //       }
    //     });
    //     if (!shared) {
    //       unlogged.add(element);
    //     }
    //   }
    // });
    List<Prescription> unlogged =
        presc.toSet().difference(logged.toSet()).toList();
    print(unlogged);
    return unlogged;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              medDisplayPinned(),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.medication),
                    tileColor: Colors.lightBlue.shade100,
                    //title: const Center( child:
                    title: const Text('Current Medications'),
                    //)
                  ),
                  medDisplayCurrent()
                ],
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                children: <Widget>[
                  ListTile(
                    tileColor: Colors.lightBlue.shade100,
                    leading: Icon(Icons.medication),
                    //title: const Center( child:
                    title: const Text('Recent Medications'),
                    //)
                  ),
                  medDisplayLogged(),
                ],
              ),
            ],
          ),
        ));
  }

  Widget medDisplayPinned() {
    return FutureBuilder(
        future: pinnedPrescriptions,
        builder:
            (BuildContext context, AsyncSnapshot<List<Prescription>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.medication),
                  tileColor: Colors.lightBlue.shade100,
                  //title: const Center( child:
                  title: const Text('Pinned Medications'),
                  //)
                ),
                pinnedListDisplay(snapshot),
              ],
            );
          } else {
            return Container();
          }
        });
  }

  Widget medDisplayLogged() {
    return FutureBuilder(
        future: loggedPrescriptions,
        builder:
            (BuildContext context, AsyncSnapshot<List<Prescription>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              children: <Widget>[
                pinnedListDisplay(snapshot),
              ],
            );
          } else {
            return Container();
          }
        });
  }

  Widget pinnedListDisplay(AsyncSnapshot<List<Prescription>> presclist) {
    int length = presclist.data!.length;
    return Container(
        child: Container(
            // height:
            //     450, //sets height for total list field, prevents overflowing
            child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical, //allows list to be scrollable vertically
      shrinkWrap: true,
      itemCount: length,
      itemBuilder: (context, position) {
        return Material(
          child: InkWell(
              child: Container(
                width: 50, //sets width for the text boxes
                alignment: Alignment.centerLeft, //sets text aligned to the left
                child: displayPrescription(presclist.data![position]),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              ),
              onTap: () {
                // print(presclist.data![position].name);
              }),
          color: Colors.transparent,
        );
      },
    )));
  }

  Widget medDisplayCurrent() {
    // Future<int> druglistlength = _setDrugListLength(drugs);
    return FutureBuilder(
      future: unloggedPrescriptions,
      builder:
          (BuildContext context, AsyncSnapshot<List<Prescription>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                child: const Text(
                  'No prescriptions left to take.',
                  style: TextStyle(fontSize: 14),
                ));
          }
          return pinnedListDisplay(snapshot);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // Widget prescriptionListDisplay(AsyncSnapshot<List<Prescription>> presclist) {
  //   int length = presclist.data!.length;
  //   int itemDisplayCount = 10;
  //   return Expanded(
  //       child: Container(
  //           height:
  //               450, //sets height for total list field, prevents overflowing
  //           child: ListView.builder(
  //             scrollDirection:
  //                 Axis.vertical, //allows list to be scrollable vertically
  //             shrinkWrap: true,
  //             itemCount: length,
  //             itemBuilder: (context, position) {
  //               return Material(
  //                 child: InkWell(
  //                     child: Container(
  //                       width: 50, //sets width for the text boxes
  //                       alignment: Alignment
  //                           .centerLeft, //sets text aligned to the left
  //                       child: displayPrescription(presclist.data![position]),
  //                       padding: const EdgeInsets.all(3.0),
  //                       decoration: BoxDecoration(
  //                           border: Border.all(color: Colors.blueAccent)),
  //                     ),
  //                     onTap: () {
  //                       print(presclist.data![position].name);
  //                     }),
  //                 color: Colors.transparent,
  //               );
  //             },
  //           )));
  // }

  Widget displayPrescription(Prescription presc) {
    return Builder(builder: (BuildContext context) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            constraints: BoxConstraints(maxWidth: 25),
            child: Icon(Icons.medication)),
        Column(children: [
          Container(
              width: 325,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                presc.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              )), //),
          Container(
              width: 325,
              padding: const EdgeInsets.symmetric(vertical: 2),
              //child: new Flexible(
              child: Text(
                (presc.totalAmount / presc.daySupply).toString() +
                    ' ' +
                    presc.unit,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.left,
              )),
        ])
      ]); //),
    });
  }
}
