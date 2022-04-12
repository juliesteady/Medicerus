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
// import 'package:provider/provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import '../data/drift_database.dart';
// import 'widget/add_mv_item_input_widget.dart';

class MedviewPage extends StatefulWidget {
  @override
  _MedviewPageState createState() => _MedviewPageState();
}

class _MedviewPageState extends State<MedviewPage> {
  //final formKey = GlobalKey<FormState>();
  final List<Widget> _medicationWidgets = [];

  void _addMedicationWidget() {
    setState(() {
      _medicationWidgets.add(_medication());
    });
  }

  Widget _medication() {
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("This is a widget."),
                ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedView'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _medicationWidgets.length,
          itemBuilder: (context, index) {
            return Dismissible(
              child: _medication(),
              key: UniqueKey(),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  _medicationWidgets.removeAt(index);
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
          }),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add Drug'),
        onPressed: _addMedicationWidget,
      ),
    );
  }
}
