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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListView(
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
              // medDisplayCurrent()
            ],
          ),
          ListView(
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
            ],
          ),
        ],
      ),
    );
  }

  // Widget medDisplayCurrent() {
  //   print('run query on prescriptions');
  //   Future<List<Prescription>> prescriptions =
  //       this.userdbHelper.getPrescriptions();
  //   // Future<int> druglistlength = _setDrugListLength(drugs);
  //   return FutureBuilder(
  //     future: prescriptions,
  //     builder:
  //         (BuildContext context, AsyncSnapshot<List<Prescription>> snapshot) {
  //       if (snapshot.hasData) {
  //         if (snapshot.data!.isEmpty) {
  //           return Container(
  //               height: 450,
  //               child: const Text(
  //                 'No current prescriptions.',
  //                 style: TextStyle(fontSize: 20),
  //               ));
  //         }
  //         return prescriptionListDisplay(snapshot);
  //       } else {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }

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

  // Widget displayPrescription(Prescription presc) {
  //   return Builder(builder: (BuildContext context) {
  //     return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //       Container(
  //           constraints: BoxConstraints(maxWidth: 25),
  //           child: Icon(Icons.medication)),
  //       Column(children: [
  //         Container(
  //             width: 325,
  //             padding: const EdgeInsets.symmetric(vertical: 2),
  //             //child: new Flexible(
  //             //padding: const EdgeInsets.all(20.0),
  //             child: Text(
  //               presc.name,
  //               style: const TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.black,
  //               ),
  //               textAlign: TextAlign.left,
  //             )), //),
  //         Container(
  //             width: 325,
  //             padding: const EdgeInsets.symmetric(vertical: 2),
  //             //child: new Flexible(
  //             child: Text(
  //               (presc.totalAmount / presc.daySupply).toString(),
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.grey[700],
  //               ),
  //               textAlign: TextAlign.left,
  //             )),
  //       ])
  //     ]); //),
  //   });
  // }
}
