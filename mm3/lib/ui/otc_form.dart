import 'package:flutter/material.dart';
import '../drug.dart';
import '../otcdrug.dart';
import '../userDbHelper.dart';

class OTCFormPage extends StatefulWidget {
  const OTCFormPage({Key? key, this.drug}) : super(key: key);
  final Drug? drug;

  @override
  OTCFormPageState createState() {
    return OTCFormPageState();
  }
}

class OTCFormPageState extends State<OTCFormPage> {
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final formController = TextEditingController();
  final timeController = TextEditingController();
  final timetypeController = TextEditingController();
  final detailsController = TextEditingController();
  final userdbHelper = UserDatabaseHelper.instance;

  String dropdownValue = 'tablet';

  // Clean up the controller when the widget is disposed.
  @override
  void dispose() {
    amountController.dispose();
    formController.dispose();
    timeController.dispose();
    timetypeController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  Widget buildForm(OTCDrug otcDrug) {
    return Form(
      key: _formKey,
      child: Container(
          margin: const EdgeInsets.all(10),
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
              const Text('Please choose a unit:'),
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: DropdownButtonFormField<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: <String>['tablet', 'mg', 'mL', 'fl oz']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
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
                    child: ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Added Over the Counter Drug to Medview Tab')),
                            );
                            otcDrug.recAmount =
                                int.parse(amountController.text);
                            otcDrug.unit = dropdownValue;
                            otcDrug.recTime = int.parse(timeController.text);
                            otcDrug.recTimeType = timetypeController.text;
                            otcDrug.details = detailsController.text;
                            userdbHelper.insertOrUpdateOTCDrug(otcDrug);
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add Drug'))),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    String drugName = widget.drug!.proprietaryName;
    OTCDrug otcDrug = OTCDrug(
        name: drugName,
        recAmount: 0,
        unit: '',
        recTime: 0,
        recTimeType: '',
        details: '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Over the Counter Medication'),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Text(
            otcDrug.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          buildForm(otcDrug),
        ],
      ),
    );
  }
}
