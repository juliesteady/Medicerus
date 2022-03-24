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
import 'package:medicerus/ui/med_details.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import '../drug.dart';
import '../dbHelper.dart';

class QuicklistPage extends StatefulWidget {
  @override
  _QuicklistPageState createState() => _QuicklistPageState();
}

class _QuicklistPageState extends State<QuicklistPage> {
  Widget customSearchBar = const Text('Search Medications');
  Icon searchIcon = const Icon(Icons.search);
  String searchQuery = "";
  final dbHelper = DatabaseHelper.instance;
  ListView llv = ListView(shrinkWrap: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search medications',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.white,
            ),
            onChanged: (text) {
              // setState(() {
              searchQuery = text;
              // });
            },
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: searchIcon,
              onPressed: () {
                setState(() {
                  searchQuery = searchQuery;
                  // if (searchIcon == Icons.search) {
                  //   searchIcon = const Icon(Icons.cancel);
                  // } else {
                  //   searchIcon = const Icon(Icons.search);
                  //   customSearchBar = const Text('Search Medications');
                  // }
                });
              },
            )
          ],
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text(
                'Get Recent',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: _queryRecentDrugs,
            ),
            ListView(
              shrinkWrap: true,
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.medication),
                  title: Text('Current Medications'),
                ),
              ],
            ),
            medDisplayWidgetCurrent(searchQuery),
            ListView(
              shrinkWrap: true,
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.medication),
                  title: Text('Recent Medications'),
                ),
              ],
            ),
          ],
        ));
  }

  // Widget medDisplayLine(String displayLine) {
  //   return Builder(builder: (BuildContext context) {
  //     return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //       Container(
  //           constraints: BoxConstraints(maxWidth: 20),
  //           padding: EdgeInsets.all(10),
  //           child: Icon(Icons.medical_services)),
  //       Container(
  //           constraints: BoxConstraints(maxWidth: 1000),
  //           padding: EdgeInsets.all(10),
  //           child: Text(displayLine,
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.white,
  //               ))),
  //     ]);
  //   });
  // }

  Widget medDisplayLine2(String propname, String nonpropname) {
    return Builder(builder: (BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 30,
              child: new Flexible(child: Icon(Icons.medical_services))),
          Column(
            children: [
              Container(
                  width: 250,
                  //child: new Flexible(
                  //padding: const EdgeInsets.all(20.0),
                  child: Text(
                    propname,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  )), //),
              Container(
                  width: 250,
                  //child: new Flexible(
                  child: Text(
                    nonpropname,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.left,
                  )), //),
            ],
          ),
        ],
      );
    });
  }

  Widget medDisplayWidgetCurrent(String searchQuery) {
    return FutureBuilder(
      future: this.dbHelper.searchDrugs(searchQuery),
      builder: (BuildContext context, AsyncSnapshot<List<Drug>> snapshot) {
        if (snapshot.hasData) {
          return Container(
              height:
                  325, //sets height for total list field, prevents overflowing
              child: ListView.builder(
                scrollDirection:
                    Axis.vertical, //allows list to be scrollable vertically
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, position) {
                  //return Dismissible(
                  //  direction: DismissDirection.endToStart,
                  //  background: Container(
                  return Material(
                    child: InkWell(
                        child: Container(
                          width: 50, //sets width for the text boxes
                          alignment: Alignment
                              .centerLeft, //sets text aligned to the left
                          child: medDisplayLine2(
                              //sets the text for each box
                              snapshot.data![position]
                                  .proprietaryName //inserts drug's proprietary name into box
                                  .toString(),
                              snapshot.data![position]
                                  .nonproprietaryName //inserts drug's nonproprietary name into same box
                                  .toString()),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent)),
                          //padding: EdgeInserts.symmetric(horizontal: 10.0),
                          //child: Icon(Icons.delete_forever),

                          //child: Text(
                          //  snapshot.data![position].nonproprietaryName.toString(),
                          //  style: TextStyle(
                          //    fontSize: 16,
                          //    color: Colors.white,
                          //),
                          //),
                        ),
                        onTap: () {
                          print(snapshot.data![position].prodNDC.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MedDetailsPage(
                                      drug: snapshot.data![position])));
                        }),
                    color: Colors.transparent,
                  );

                  //key: UniqueKey(),
                  //);
                },
              ));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget medDisplayWidgetRecent() {
    return FutureBuilder(
      future: this.dbHelper.getRecentDrugs(),
      builder: (BuildContext context, AsyncSnapshot<List<Drug>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, position) {
              //return Dismissible(
              //  direction: DismissDirection.endToStart,
              //  background: Container(
              return InkWell(
                onTap: () {
                  print('hey I did the thing');
                },
                child: IgnorePointer(
                  child: Container(
                    //height: 3.0,
                    width: 50,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: medDisplayLine2(
                        snapshot.data![position].proprietaryName.toString(),
                        snapshot.data![position].nonproprietaryName.toString()),
                    //padding: EdgeInserts.symmetric(horizontal: 10.0),
                    //child: Icon(Icons.delete_forever),

                    //child: Text(
                    //  snapshot.data![position].nonproprietaryName.toString(),
                    //  style: TextStyle(
                    //    fontSize: 16,
                    //    color: Colors.white,
                    //),
                    //),
                  ),
                ),
              );

              //key: UniqueKey(),
              //);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _queryDrugs() async {
    //dbHelper.printQuery();
    final drugs = await dbHelper.getRecentDrugs();
    //for (int i = 0; i < drugs.length; i++) {
    //  print(drugs[i].toString());
    // }
    //rows.forEach(print);
  }

  void _queryRecentDrugs() async {
    //dbHelper.printQuery();
    final drugs = await dbHelper.getRecentDrugs();
    //for (int i = 0; i < drugs.length; i++) {
    //  print(drugs[i].toString());
    // }
    //rows.forEach(print);
  }
}
// class _RapidchartPageState extends State<RapidchartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('RapidChart'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(child: _buildRCList(context)),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           // #JPK #LearningDart: https://github.com/AbdulRahmanAlHamali/flutter_pagewise/issues/63#issuecomment-587512197
//           onPressed: () => _showAddItemSheet(context),
//           tooltip: 'Add Item',
//           child: Icon(Icons.add),
//         ));
//   }

//   _buildRCList(var context) {}

//   _showAddItemSheet(var context) {
//     showBottomSheet(
//         context: context,
//         builder: (context) => Container(
//               color: Colors.lightBlue[50],
//               child: AddRapidchartItemInput(),
//             ));
//   }
// }
