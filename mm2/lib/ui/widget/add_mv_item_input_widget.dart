import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../../data/moor_database.dart';

class AddMedviewItemInput extends StatefulWidget {
  const AddMedviewItemInput({
    Key key,
  }) : super(key: key);

  @override
  _AddMedviewItemInputState createState() => _AddMedviewItemInputState();
}

class _AddMedviewItemInputState extends State<AddMedviewItemInput> {
  DateTime newTaskDate;
  Tag selectedTag;
  TextEditingController controller;

  var mvItems = List<String>();

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
          //_buildTagSelector(context),
          //_buildNdcList(context),
          _buildGoButton(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: 'NDC Number',
            labelText: 'NDC Number',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))
            )),
        onSubmitted: (inputNDC) {
          // JPK This is how the thing gets back to the main list
          //final dao = Provider.of<MedicationsDao>(context);
          final medDao = Provider.of<MedicationsDao>(context);
          final ndcDao = Provider.of<NdcDao>(context);
          //final medication = MedicationsCompanion(
          //final ndcProduct = NdcProductsCompanion(
          //  product_ndc: Value(inputNDC),
          //);
          final ndcProduct = ndcDao.getMedicationByNdc(inputNDC);
          // The slider panel inserts the task, then Moor, which is watching
          // the database, will display it.

          final medication = ndcProduct as Medication;

          medDao.insertMedication(medication);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  // JPK #LearningFlutter
  // See this link: https://blog.usejournal.com/flutter-search-in-listview-1ffa40956685

  /*ListView _buildNdcList(BuildContext context) {

    String product_name = NdcProduct.

    return (ListView(
    itemCount: mvItems.length,
    itemBuilder: (context, index) {
    return ListTile(
        title: Text('${mvItems[index]}'),
    );
    });

  }*/

  /*StreamBuilder<List<NdcProduct>> _buildTagSelector(BuildContext context) {
    return StreamBuilder<List<NdcProduct>>(
        stream: Provider.of<NdcDao>(context).watchNdcProducts(),
    builder: (context, snapshot) {
    final tags = snapshot.data ?? List();

        DropdownMenuItem<Tag> dropdownFromTag(Tag tag) {
          return DropdownMenuItem(
            value: tag,
            child: Row(
              children: <Widget>[
                Text(tag.name),
                SizedBox(width: 5),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(tag.color),
                  ),
                ),
              ],
            ),
          );
        }

        final dropdownMenuItems =
            tags.map((tag) => dropdownFromTag(tag)).toList()
              // Add a "no tag" item as the first element of the list
              ..insert(
                0,
                DropdownMenuItem(
                  value: null,
                  child: Text('No Tag'),
                ),
              );

        return Expanded(
          child: DropdownButton(
            onChanged: (Tag tag) {
              setState(() {
                selectedTag = tag;
              });
            },
            isExpanded: true,
            value: selectedTag,
            items: dropdownMenuItems,
          ),
        );
      },
    );
  } */

  /*
  StreamBuilder<List<Tag>> _buildTagSelector(BuildContext context) {
    return StreamBuilder<List<Tag>>(
        stream: Provider.of<TagDao>(context).watchTags(),
    builder: (context, snapshot) {
    final tags = snapshot.data ?? List();

        DropdownMenuItem<Tag> dropdownFromTag(Tag tag) {
          return DropdownMenuItem(
            value: tag,
            child: Row(
              children: <Widget>[
                Text(tag.name),
                SizedBox(width: 5),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(tag.color),
                  ),
                ),
              ],
            ),
          );
        }

        final dropdownMenuItems =
            tags.map((tag) => dropdownFromTag(tag)).toList()
              // Add a "no tag" item as the first element of the list
              ..insert(
                0,
                DropdownMenuItem(
                  value: null,
                  child: Text('No Tag'),
                ),
              );

        return Expanded(
          child: DropdownButton(
            onChanged: (Tag tag) {
              setState(() {
                selectedTag = tag;
              });
            },
            isExpanded: true,
            value: selectedTag,
            items: dropdownMenuItems,
          ),
        );
      },
    );
  }

   */

  IconButton _buildGoButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward),
      onPressed: () {}, /*async {
        newTaskDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2050), */
        );

  }

  void resetValuesAfterSubmit() {
    setState(() {
      newTaskDate = null;
      selectedTag = null;
      controller.clear();
    });
  }
}
