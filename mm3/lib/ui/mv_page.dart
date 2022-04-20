import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import '../drug.dart';
import '../dbHelper.dart';
import '../medlog.dart';
import '../otcdrug.dart';
import '../prescription.dart';
import '../userDbHelper.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import '../data/drift_database.dart';
// import 'widget/add_mv_item_input_widget.dart';

class MedviewPage extends StatefulWidget {
  const MedviewPage({Key? key}) : super(key: key);

  @override
  _MedviewPageState createState() => _MedviewPageState();
}

class _MedviewPageState extends State<MedviewPage> {
  // final List<Widget> _medicationWidgets = [];
  late Future<List<Prescription>> prescriptions;
  late Future<List<OTCDrug>> otcDrugs;
  final userdbHelper = UserDatabaseHelper.instance;

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
              Text(presc.name),
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

  Widget _medication(Prescription presc) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                presc.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                presc.totalAmount.toString(),
              ),
              Text(
                presc.unit,
              ),
              Text(
                presc.daySupply.toString(),
              ),
              Text(
                presc.fillDate.toString(),
              ),
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
                      child: _medication(snapshot.data![index]),
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
      name: 'drug name',
      totalAmount: 30,
      unit: 'mg',
      daySupply: 30,
      fillDate: DateTime.parse('2022-04-11'),
      pinned: false,
    );
  }
}
