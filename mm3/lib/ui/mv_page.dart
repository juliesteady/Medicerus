import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import '../drug.dart';
import '../dbHelper.dart';
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
  late Future<List<Prescription>> prescriptions;
  final userdbHelper = UserDatabaseHelper.instance;

  @protected
  @mustCallSuper
  void initState() {
    prescriptions = userdbHelper.getPrescriptions();
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
              Text(presc.name),
              Text(presc.totalAmount.toString()),
              Text(presc.unit),
              Text(presc.daySupply.toString()),
              Text(presc.fillDate.toString()),
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
    );
  }
}
