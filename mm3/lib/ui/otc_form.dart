import 'package:flutter/material.dart';

import '../drug.dart';
import '../otcdrug.dart';
import '../userDbHelper.dart';

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

  final amountController = TextEditingController();
  final formController = TextEditingController();
  final timeController = TextEditingController();
  final timetypeController = TextEditingController();
  final detailsController = TextEditingController();

  final userdbHelper = UserDatabaseHelper.instance;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountController.dispose();
    formController.dispose();
    timeController.dispose();
    timetypeController.dispose();
    detailsController.dispose();
    super.dispose();
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
                controller: formController,
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
                controller: timeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter the usage time',
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
                controller: timetypeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter the time type',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: detailsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  labelText: 'Enter any warnings or details',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Added Over the Counter Drug to Medview Tab')),
                        );
                        OTCDrug otcDrug = OTCDrug(
                            name: 'presc drug name',
                            recAmount: int.parse(amountController.text),
                            unit: formController.text,
                            recTime: int.parse(timeController.text),
                            recTimeType: timetypeController.text,
                            details: detailsController.text);
                        userdbHelper.insertOrUpdateOTCDrug(otcDrug);
                      }
                    },
                    child: const Text("Add Drug"),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
