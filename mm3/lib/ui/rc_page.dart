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
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../data/drift_database.dart';
import 'widget/add_rc_item_input_widget.dart';

class RapidchartPage extends StatefulWidget {
  @override
  _RapidchartPageState createState() => _RapidchartPageState();
}

class _RapidchartPageState extends State<RapidchartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RapidChart'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildRCList(context)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // #JPK #LearningDart: https://github.com/AbdulRahmanAlHamali/flutter_pagewise/issues/63#issuecomment-587512197
          onPressed: () => _showAddItemSheet(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add),
        ));
  }

  _buildRCList(var context) {}

  _showAddItemSheet(var context) {
    showBottomSheet(
        context: context,
        builder: (context) => Container(
              color: Colors.lightBlue[50],
              child: AddRapidchartItemInput(),
            ));
  }
}
