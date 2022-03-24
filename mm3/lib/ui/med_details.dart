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

class MedDetailsPage extends StatelessWidget {
  const MedDetailsPage({Key? key, required this.drug}) : super(key: key);
  final Drug drug;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drug.proprietaryName),
      ),
      body: Column(children: [
        Container(
            width: 250, child: Text("Substance Name: " + drug.substanceName)),
        Container(
            width: 250,
            child: Text("NonProprietary Name: " + drug.nonproprietaryName)),
        Container(width: 250, child: Text("NDC Number: " + drug.prodNDC)),
      ]
          //     child: ElevatedButton.icon(
          //   icon: const Icon(Icons.arrow_back_ios_new),
          //   label: Text('Back'),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // )
          ),
    );
  }
}
