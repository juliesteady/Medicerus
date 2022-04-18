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
import 'package:flutter/cupertino.dart';
import 'package:medicerus/ui/mv_page.dart';
import '../drug.dart';
import '../otcdrug.dart';
import '../prescription.dart';
import '../ui/mv_page.dart';

class MedFormPage extends StatelessWidget {
  const MedFormPage({Key? key, this.drug}) : super(key: key);
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
          const MedForm(),
        ],
      ),
    );
  }
}

class MedForm extends StatefulWidget {
  const MedForm({Key? key}) : super(key: key);

  @override
  MedFormState createState() {
    return MedFormState();
  }
}

class MedFormState extends State<MedForm> {
  final _formKey = GlobalKey<FormState>();

  final amountController = TextEditingController();
  final unitController = TextEditingController();
  final daysupplyController = TextEditingController();
  final filldateController = TextEditingController();

  final List<Widget> _prescDrugWidgets = [];

  // Clean up the controller when the widget is disposed.
  @override
  void dispose() {
    amountController.dispose();
    unitController.dispose();
    daysupplyController.dispose();
    filldateController.dispose();
    super.dispose();
  }

  Widget prescDrugWidget(Prescription prescDrug) {
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
              Text(prescDrug.name),
              Text(prescDrug.totalAmount.toString()),
              Text(prescDrug.unit),
              Text(prescDrug.daySupply.toString()),
              Text(prescDrug.fillDate.toString()),
            ]),
          ),
        ],
      ),
    );
  }

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
                controller: amountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter a usage amount',
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
                controller: unitController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter the drug form',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the drug form';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: daysupplyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter the days supplied',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number of days';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: filldateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter the fill date',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Added Prescription Drug to Medview Tab')),
                      );
                      Prescription prescDrug = Prescription(
                          name: 'presc drug name',
                          totalAmount: int.parse(amountController.text),
                          unit: unitController.text,
                          daySupply: int.parse(daysupplyController.text),
                          fillDate: DateTime.parse(filldateController.text));
                      Widget drugWidget = prescDrugWidget(prescDrug);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedviewPage(
                                  prescDrug: prescDrug,
                                  drugWidget: drugWidget)));
                    }
                  },
                  child: const Text("Add Drug"),
                ),
              ),
            ],
          )),
    );
  }
}
