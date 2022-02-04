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
import 'widget/new_tag_input_widget.dart';
import 'widget/new_task_input_widget.dart';
import 'widget/add_mv_item_input_widget.dart';

class MedviewPage extends StatefulWidget {
  @override
  _MedviewPageState createState() => _MedviewPageState();
}

class _MedviewPageState extends State<MedviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MedView'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context)),
            //NewTaskInput(),
            //NewTagInput(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // #JPK #LearningDart: https://github.com/AbdulRahmanAlHamali/flutter_pagewise/issues/63#issuecomment-587512197
          // onPressed: _showAddItemSheet(context),
          onPressed: () => _showAddItemSheet(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add),
        ));
  }

  _showAddItemSheet(var context) {
    showBottomSheet(
        context: context,
        builder: (context) => Container(
              color: Colors.lightBlue[50],
              child: AddMedviewItemInput(),
            ));
  }

  StreamBuilder<List<TaskWithTag>> _buildTaskList(BuildContext context) {
    final dao = Provider.of<TaskDao>(context);
    return StreamBuilder(
      stream: dao.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<TaskWithTag>> snapshot) {
        final tasks = snapshot.data ?? List();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final item = tasks[index];
            return _buildListItem(item, dao);
          },
        );
      },
    );
  }

  Widget _buildListItem(TaskWithTag item, TaskDao dao) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => dao.deleteTask(item.task),
        )
      ],
      child: CheckboxListTile(
        title: Text(item.task.name),
        subtitle: Text(item.task.dueDate?.toString() ?? 'No date'),
        secondary: _buildTag(item.tag),
        value: item.task.completed,
        onChanged: (newValue) {
          dao.updateTask(item.task.copyWith(completed: newValue));
        },
      ),
    );
  }

  Column _buildTag(Tag tag) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (tag != null) ...[
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(tag.color),
            ),
          ),
          Text(
            tag.name,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ],
    );
  }
}
