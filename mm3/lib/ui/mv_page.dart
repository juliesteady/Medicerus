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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import '../drug.dart';
import '../dbHelper.dart';
import '../medlog.dart';
import '../prescription.dart';
import '../userDbHelper.dart';
import '../otcdrug.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import '../data/drift_database.dart';
// import 'widget/add_mv_item_input_widget.dart';

class MedviewPage extends StatefulWidget {
  const MedviewPage({Key? key, this.otcDrug}) : super(key: key);
  final OTCDrug? otcDrug;

  @override
  _MedviewPageState createState() => _MedviewPageState();
}

class _MedviewPageState extends State<MedviewPage> {
  // final List<Widget> _medicationWidgets = [];
  late Future<List<Prescription>> prescriptions;
  late Future<List<OTCDrug>> otcDrugs;
  final userdbHelper = UserDatabaseHelper.instance;

  // void _addMedicationWidget() {
  //   setState(() {
  //     _medicationWidgets.add(_medication());
  //   });
  // }

  @protected
  @mustCallSuper
  void initState() {
    prescriptions = userdbHelper.getPrescriptions();
    otcDrugs = userdbHelper.getOTCDrugs();
  }

  Widget _prescWidget(Prescription presc) {
    Icon pinIcon = Icon(Icons.push_pin_outlined);
    if (presc.pinned != null && presc.pinned == true) {
      pinIcon = Icon(Icons.push_pin);
    }
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, bottom: 5, right: 5, top: 15),
                child: Text(
                  presc.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10, bottom: 5, right: 5, top: 20),
                child: Text(
                  'Take 2 per day',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ]),
          ),
          Column(children: [
            IconButton(
                icon: pinIcon,
                onPressed: () {
                  presc.pinned = !presc.pinned;
                  userdbHelper.insertOrUpdatePrescription(presc);
                  setState(() {
                    // _medicationWidgets.removeAt(index);
                    prescriptions = userdbHelper.getPrescriptions();
                  });
                }),
            IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  MedLog newlog = MedLog.withPresc(presc);
                  userdbHelper.insertOrUpdateMedLog(newlog);
                  // userdbHelper.insertOrUpdatePrescription(presc);
                  // setState(() {
                  //   // _medicationWidgets.removeAt(index);
                  //   prescriptions = userdbHelper.getPrescriptions();
                  // });
                })
          ]),
        ],
      ),
    );
  }

  Widget _otcWidget(OTCDrug otcDrug) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(otcDrug.name),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // prescriptions = userdbHelper.getPrescriptions();
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: prescriptions,
          builder: (BuildContext context,
              AsyncSnapshot<List<Prescription>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Container(
                    height: 450,
                    child: const Text(
                      'No current prescriptions.',
                      style: TextStyle(fontSize: 20),
                    ));
              }
              return ListView.builder(
                  // itemCount: _medicationWidgets.length,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      child: _prescWidget(snapshot.data![index]),
                      key: UniqueKey(),
                      onDismissed: (DismissDirection direction) {
                        userdbHelper.deletePrescription(snapshot.data![index]);
                        setState(() {
                          // _medicationWidgets.removeAt(index);
                          prescriptions = userdbHelper.getPrescriptions();
                        });
                      },
                      secondaryBackground: Container(
                        child: const Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        color: Colors.red,
                      ),
                      background: Container(),
                      direction: DismissDirection.endToStart,
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text('Add Drug'),
          // onPressed: _addMedicationWidget,
          onPressed: () {
            _insertPrescription();
          }),
    );
  }

  _insertOTCDrug() async {
    OTCDrug testotc = OTCDrug(
      name: 'drug name',
      recAmount: 0,
      unit: 'tablet',
      recTime: 0,
      recTimeType: 'hours',
    );
    userdbHelper.insertOrUpdateOTCDrug(testotc);
    setState(() {
      otcDrugs = userdbHelper.getOTCDrugs();
    });
  }

  _insertPrescription() async {
    Prescription testpresc = Prescription(
      name: 'Drug name',
      totalAmount: 30,
      unit: 'mg',
      daySupply: 30,
      fillDate: DateTime.parse('2022-04-11'),
      pinned: false,
    );
    userdbHelper.insertOrUpdatePrescription(testpresc);
    setState(() {
      prescriptions = userdbHelper.getPrescriptions();
    });
    //   Database db = await UserDatabaseHelper.instance.database;
    //   db.execute(
    //       '''INSERT INTO prescriptions (name, totalamount, unit, daysupply, rxnumber, filldate, expdate, details, substancename)
    // VALUES ('Medicine Name', 60, 'mg', 2, 'rx number', '2022-04-11', '2022-05-11', 'take 2 a day', 'some substance');''');
  }
}
