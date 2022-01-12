import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'data/moor_database.dart';
import 'ui/rc_page.dart';
import 'ui/mv_page.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// JPK Notes:
// How to do tabs: https://medium.com/@sanjay15k/creating-a-complete-tabbar-in-flutter-4f7465803e84
// Date Fields: https://medium.com/flutter-community/datefield-in-flutter-made-easy-3b2424b98cd7
// This code sourced from https://github.com/ResoCoder/flutter-moor-tutorial

void main () async
{

  // TODO: Re-architect this "check to see if NDC database file is present"
  //       routine so that a splash page can properly be displayed during
  //       this process if it will be slow.

  WidgetsFlutterBinding.ensureInitialized();

  // https://github.com/simolus3/moor/issues/26:
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "ndc.db");

// Check if the database exists
  var exists = await databaseExists(path);

  if (!exists) {
    // Should happen only the first time you launch your application
    print("Creating new copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", "ndc.db"));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);

  } else {
    print("Opening existing database");
  }
// open the database
  //db = MyDatabase(path);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final db = AppDatabase();
    final ndc_db = NdcDatabase('ndc.db');
    return MultiProvider(
      providers: [
        Provider(builder: (_) => db.taskDao),
        Provider(builder: (_) => db.tagDao),
        Provider(builder: (_) => ndc_db.ndcDao)
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
  HomePage({Key key, this.title}) : super(key: key);

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

class _HomePageState extends State<HomePage> with
    SingleTickerProviderStateMixin
{
  TabController _tabController;
  int _counter = 0;

  @override
  void initState()
  {
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
        bottom: TabBar (
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            // Dashboard Tab
            new Tab(icon: new Icon(Icons.dashboard)),
            // "Fast Log" Tab
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
