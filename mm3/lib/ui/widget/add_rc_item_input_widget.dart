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
import 'package:drift/drift.dart';
import 'package:provider/provider.dart';

import '../../data/drift_database.dart';

class AddRapidchartItemInput extends StatefulWidget {
  const AddRapidchartItemInput({
    Key? key,
  }) : super(key: key);

  @override
  _AddRapidchartItemInputState createState() => _AddRapidchartItemInputState();
}

class _AddRapidchartItemInputState extends State<AddRapidchartItemInput> {
  DateTime newTaskDate = new DateTime.now();
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTextField(context),

          ///_buildTagSelector(context),
          //_buildDateButton(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Task Name'),
        onSubmitted: (inputName) {
          /*final dao = Provider.of<RapidChartDao>(context);
          final task = TasksCompanion(
            name: Value(inputName),
            dueDate: Value(newTaskDate),
            tagName: Value(selectedTag?.name),
          );
          dao.insertTask(task);*/
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      //newTaskDate = null;
      //selectedTag = null;
      controller.clear();
    });
  }
}
