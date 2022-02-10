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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'data/drift_database.dart';
import 'package:logging/logging.dart';
import 'ui/rc_page.dart';
import 'ui/mv_page.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// JPK Notes:  #LearnFlutter
// How to do tabs: https://medium.com/@sanjay15k/creating-a-complete-tabbar-in-flutter-4f7465803e84
// Date Fields: https://medium.com/flutter-community/datefield-in-flutter-made-easy-3b2424b98cd7
// This code sourced from https://github.com/ResoCoder/flutter-moor-tutorial

final log = Logger('MedicerusLogger');

void main() async {
  // TODO: Configuration parameters for logging?
  Logger.root.level = Level.INFO;

  WidgetsFlutterBinding.ensureInitialized();

  // https://github.com/simolus3/moor/issues/26:
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "ndc.db");

  // TODO: Re-architect this "check to see if NDC database file is present"
  //       routine so that a splash page can properly be displayed during
  //       this process if it will be slow.

// Check if the database exists
  var exists = await databaseExists(path);

  if (!exists) {
    // Should happen only the first time you launch your application
    log.info("NDC does not exist; creating new copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {
      log.warning('Database parent directory does not exist!');
    }

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", "ndc.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    log.info("Opening existing database");
  }
// open the database
  //db = MyDatabase(path);

  runApp(MedicerusApp());
}

class MedicerusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();
    final ndc_db = NdcDatabase('ndc.db');

    // #LearningFlutter: what is this MultiProvider thing?  Any time something
    // is updated- in this case one of the data access objects- the provider
    // will issue a message that other parts of the app (such as pages)
    // will listen for and update themselves accordingly.

    return MultiProvider(
      providers: [
        Provider(create: (_) => db.chartEventsDao),
        Provider(create: (_) => db.medicationsDao)
      ],
      child: MaterialApp(
        title: 'Medicerus HomeChart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Medicerus HomeChart'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // TODO: This was an error- was it correct to put 'late' here?
  late TabController _tabController;
  int _counter = 0;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(icon: new Icon(Icons.fast_rewind)),
            // "QuickList" Tab
            new Tab(icon: new Icon(Icons.fast_forward)),
            // "Medications" Tab
            new Tab(icon: new Icon(Icons.memory))
          ],
          controller: _tabController,
        ),
      ),
      /*body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ), */
      body: TabBarView(
        children: [
          new Text("This is Dashboard View"),
          RapidchartPage(),
          MedviewPage(),
        ],
        controller: _tabController,
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: Icon(Icons.add),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
