import 'package:flutter/material.dart';
import '../drug.dart';
import '../prescription.dart';
import '../userDbHelper.dart';

class MedFormPage extends StatefulWidget {
  const MedFormPage({Key? key, this.drug}) : super(key: key);
  final Drug? drug;

  @override
  MedFormPageState createState() {
    return MedFormPageState();
  }
}

class MedFormPageState extends State<MedFormPage> {
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final unitController = TextEditingController();
  final daysupplyController = TextEditingController();
  final filldateController = TextEditingController();
  final userdbHelper = UserDatabaseHelper.instance;

  // Clean up the controller when the widget is disposed.
  @override
  void dispose() {
    amountController.dispose();
    unitController.dispose();
    daysupplyController.dispose();
    filldateController.dispose();
    super.dispose();
  }

  Widget buildForm(Prescription presc) {
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
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Added Prescription Medication to Medview Tab')),
                        );
                        presc.totalAmount = int.parse(amountController.text);
                        presc.unit = unitController.text;
                        presc.daySupply = int.parse(daysupplyController.text);
                        presc.fillDate =
                            DateTime.parse(filldateController.text);
                        userdbHelper.insertOrUpdatePrescription(presc);
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

  @override
  Widget build(BuildContext context) {
    String drugName = widget.drug!.proprietaryName;
    Prescription prescDrug = Prescription(
        name: drugName,
        totalAmount: 0,
        unit: '',
        daySupply: 0,
        fillDate: DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Prescription Medication'),
      ),
      body: Column(
        children: [
          Text(
            prescDrug.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          buildForm(prescDrug),
        ],
      ),
    );
  }
}
