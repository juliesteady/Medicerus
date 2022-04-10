import 'dart:async';
import 'dart:io';
import 'package:medicerus/medlog.dart';
import 'package:medicerus/otcdrug.dart';
import 'package:medicerus/prescription.dart';

import 'drug.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

class UserDatabaseHelper {
  static final UserDatabaseHelper instance = UserDatabaseHelper._init();
  static Database? _database;
  UserDatabaseHelper._init();

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    if (_database != null) {
      return _database!;
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      _database = await openDatabase(path,
          version: _databaseVersion, onCreate: _onCreate);
      return _database!;
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE prescriptions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        totalamount INTEGER NOT NULL,
        unit TEXT NOT NULL,
        daysupply INTEGER NOT NULL,
        reqamountperday INTEGER GENERATED ALWAYS
          AS (totalamount / daysupply),
        rxnumber TEXT,
        filldate TEXT NOT NULL,
        expdate TEXT,
        details TEXT,
        pharmphonenum TEXT,
        substancename TEXT
      );
      
      CREATE TABLE otcdrugs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        recamount INTEGER NOT NULL,
        unit TEXT NOT NULL,
        rectime TEXT NOT NULL,
        rectimetype TEXT NOT NULL,
        details TEXT,
        substancename TEXT
      );
      
      CREATE TABLE medlog (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        timetaken TEXT NOT NULL,
        prescriptionstatus INTEGER NOT NULL DEFAULT 0,
        prescid INTEGER,
        otcid INTEGER,
        amounttaken INTEGER NOT NULL,
        unit TEXT NOT NULL,
        substancename TEXT,
        FOREIGN KEY(prescid) REFERENCES prescription (id),
        FOREIGN KEY(otcid) REFERENCES otcdrug (id)
      );
    ''');
  }

  Future<List<Prescription>> getPrescriptions() async {
    final db = await instance.database;
    List<Map<String, dynamic>> presclist =
        await db.rawQuery('SELECT * from prescriptions');
    return List.generate(presclist.length, (i) {
      return Prescription(
          id: presclist[i]['id'],
          name: presclist[i]['name'],
          totalAmount: presclist[i]['totalamount'],
          unit: presclist[i]['unit'],
          daySupply: presclist[i]['daysupply'],
          reqAmountPerDay: presclist[i]['reqamountperday'],
          fillDate: presclist[i]['filldate'],
          rxNumber: presclist[i]['rxnumber'],
          expDate: presclist[i]['expdate'],
          details: presclist[i]['details'],
          pharmPhoneNum: presclist[i]['pharmphonenum'],
          substanceName: presclist[i]['substancename']);
    });
  }

  Future<List<OTCDrug>> getOTCDrugs() async {
    final db = await instance.database;
    List<Map<String, dynamic>> otclist =
        await db.rawQuery('SELECT * from prescriptions');
    return List.generate(otclist.length, (i) {
      return OTCDrug(
          id: otclist[i]['id'],
          name: otclist[i]['name'],
          recAmount: otclist[i]['recamount'],
          unit: otclist[i]['unit'],
          recTime: otclist[i]['rectime'],
          recTimeType: otclist[i]['rectimetype'],
          details: otclist[i]['details'],
          substanceName: otclist[i]['substance']);
    });
  }

  Future<List<MedLog>> getMedLog() async {
    final db = await instance.database;
    List<Map<String, dynamic>> medloglist =
        await db.rawQuery('SELECT * from prescriptions');
    return List.generate(medloglist.length, (i) {
      return MedLog(
          id: medloglist[i]['id'],
          name: medloglist[i]['name'],
          timetaken: medloglist[i]['timetaken'],
          prescriptionstatus: medloglist[i]['prescriptionstatus'],
          prescid: medloglist[i]['prescid'],
          otcid: medloglist[i]['otcid'],
          amounttaken: medloglist[i]['amounttaken'],
          unit: medloglist[i]['unit'],
          substanceName: medloglist[i]['substance']);
    });
  }

  static const _databaseName = "usermed.db";

  static const _databaseVersion = 1;
}
