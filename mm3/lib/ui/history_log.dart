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
import '../drug.dart';
import '../medlog.dart';
import '../userDbHelper.dart';

class HistoryLogPage extends StatelessWidget {
  HistoryLogPage({
    Key? key,
  }) : super(key: key);
  final userdbHelper = UserDatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Log'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: <Widget>[
            historyLogDisplay()
            //medDisplayWidgetCurrent(searchQuery),
            // const Spacer(),
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _insertPrescription();
          _insertMedLog();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget historyLogDisplay() {
    print('runquery');
    Future<List<MedLog>> logs = this.userdbHelper.getMedLog();
    //Future<int> druglistlength = _setDrugListLength(drugs);
    return FutureBuilder(
      future: logs,
      builder: (BuildContext context, AsyncSnapshot<List<MedLog>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Container(
                height: 450,
                child: const Text(
                  'No logged medications.',
                  style: TextStyle(fontSize: 20),
                ));
          }
          return medLogDisplayList(snapshot);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget medLogDisplayList(AsyncSnapshot<List<MedLog>> loglist) {
    int length = loglist.data!.length;
    return Expanded(
        child: Container(
            height:
                450, //sets height for total list field, prevents overflowing
            child: ListView.builder(
              scrollDirection:
                  Axis.vertical, //allows list to be scrollable vertically
              shrinkWrap: true,
              itemCount: length,
              itemBuilder: (context, position) {
                return Material(
                  child: InkWell(
                    child: Container(
                      width: 50, //sets width for the text boxes
                      alignment:
                          Alignment.centerLeft, //sets text aligned to the left
                      child: medLogDisplayLine(loglist.data![position]),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                    ),
                  ),
                  color: Colors.transparent,
                );
              },
            )));
  }

  Widget medLogDisplayLine(MedLog log) {
// String medType = '';
//     if (drug.prodTypeName.toLowerCase() == 'human otc drug') {
//       medType = 'Over the Counter';
//     } else {
//       medType = 'Prescription Drug';
//     }
    return Builder(builder: (BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(constraints: BoxConstraints(maxWidth: 25), child: Icons.medIcon),
          Column(children: [
            Container(
                width: 325,
                padding: const EdgeInsets.symmetric(vertical: 2),
                //child: new Flexible(
                //padding: const EdgeInsets.all(20.0),
                child: Text(
                  log.name,
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
                  log.timetaken,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.left,
                )), //),
            Container(
                width: 325,
                padding: const EdgeInsets.symmetric(vertical: 2),
                //child: new Flexible(
                child: Text(
                  log.amounttaken.toString() + ' ' + log.unit,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.left,
                )),
            // Container(
            //     width: 325,
            //     padding: const EdgeInsets.symmetric(vertical: 2),
            //     //child: new Flexible(
            //     child: Text(
            //       log.unit,
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: Colors.grey[500],
            //       ),
            //       textAlign: TextAlign.left,
            //     )),
          ]),
        ],
      );
    });
  }

  _insertMedLog() async {
    MedLog testlog = MedLog(
        name: 'drug name',
        timetaken: DateTime.now().toString(),
        prescriptionstatus: false,
        prescid: 2,
        otcid: null,
        amounttaken: 20,
        unit: 'mg',
        substanceName: 'subtance yeahhhhhh');
    userdbHelper.insertOrUpdateMedLog(testlog);
    //   Database db = await UserDatabaseHelper.instance.database;
    //   db.execute(
    //       '''INSERT INTO prescriptions (name, totalamount, unit, daysupply, rxnumber, filldate, expdate, details, substancename)
    // VALUES ('Medicine Name', 60, 'mg', 2, 'rx number', '2022-04-11', '2022-05-11', 'take 2 a day', 'some substance');''');
  }
}
