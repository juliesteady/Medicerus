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

class OTCFormPage extends StatelessWidget {
  const OTCFormPage({Key? key, this.drug}) : super(key: key);
  final Drug? drug;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Over the Counter Medication'),
      ),
      body: Column(
        children: [
          Text(
            drug!.proprietaryName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const OTCForm(),
        ],
      ),
    );
  }
}

class OTCForm extends StatefulWidget {
  const OTCForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<OTCForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter an amount',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter the unit (tablet/ml/tablespoons/etc)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the unit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter the required time',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter any warnings/details',
                ),
              ),
            ],
          )),
    );
  }
}
