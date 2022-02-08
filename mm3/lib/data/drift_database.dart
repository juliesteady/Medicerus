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

import 'package:uuid/uuid.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'drift_database.g.dart';

final _uuid = Uuid();

// Medicerus stuff here

// Database Connections.
// TODO: Implement encryption as noted here (use sqlcipher_flutter_libs):
//       https://drift.simonbinder.eu/docs/other-engines/encryption/
//       Otherwise at least make sure that the App Database lives on an
//       encrypted storage.  (FUTURE)

LazyDatabase _openAppDbConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'MedAppData.db'));
    return NativeDatabase(file);
  });
}

LazyDatabase _openNdcDbConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'NDC.db'));
    return NativeDatabase(file);
  });
}

// Database Declarations:

@DriftDatabase(
    tables: [Persons, Medications, ChartEvents],
    daos: [ChartEventsDao, MedicationsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openAppDbConnection());

  @override
  int get schemaVersion => 1;
}

@DriftDatabase(tables: [NdcProducts], daos: [NdcDao])
class NdcDatabase extends _$NdcDatabase {
  NdcDatabase(String path) : super(_openNdcDbConnection());

  @override
  int get schemaVersion => 1;
}

// Table Declarations

// Person: a person.

class Persons extends Table {
  TextColumn get publicid => text().clientDefault(() => _uuid.v4())();
  TextColumn get last_name => text().withLength(min: 1, max: 64)();
  TextColumn get first_name => text().withLength(min: 1, max: 64)();
  DateTimeColumn get created_on =>
      dateTime().clientDefault(() => DateTime.now())();
}

// Medication: a particular instance of a medication.  A prescription for one
// medication that is picked up at the store would result in one record in
// this table.

//@DataClassName("Medications")
class Medications extends Table {
  // TODO: Fix this- why isn't ClientDefault working?  Make the primary key
  //       be a UUID.
  TextColumn get publicid => text().clientDefault(() => _uuid.v4())();

  IntColumn get batch_number => integer().nullable()();
  BoolColumn get is_active => boolean()();
  BoolColumn get is_prn => boolean()();
  TextColumn get long_Name => text().withLength(min: 4, max: 256)();
  TextColumn get short_name => text().withLength(min: 4, max: 64)();
  TextColumn get directions => text().withLength(min: 1, max: 4096)();
  TextColumn get ndc_id => text().withLength(min: 1, max: 24)();
  TextColumn get rx_number => text().withLength(min: 1, max: 24)();
  DateTimeColumn get rx_expire_date => dateTime().nullable()();
  DateTimeColumn get fill_date => dateTime().nullable()();
  RealColumn get fill_qty => real().nullable()();
  RealColumn get fill_days => real().nullable()();
  RealColumn get remaining_fill_avail => real().nullable()();
  RealColumn get safe_delay => real().nullable()();
  TextColumn get barcode => text().withLength(min: 0, max: 64)();
  TextColumn get manufacturer => text().withLength(min: 0, max: 64)();
  TextColumn get manufacturer_batch => text().withLength(min: 0, max: 16)();
  DateTimeColumn get last_administered => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {publicid};
}

// TODO: this is the format of the NDC tables as provided by the FDA.  This
//       should be fixed so that it is type-proper.

class NdcProducts extends Table {
  TextColumn get product_id => text().withLength(min: 4, max: 24)();
  TextColumn get product_ndc => text().withLength(min: 4, max: 16)();
  TextColumn get product_type_name => text().withLength(min: 4, max: 32)();
  TextColumn get proprietary_name => text().withLength(min: 0, max: 64)();
  TextColumn get proprietary_name_suffix =>
      text().withLength(min: 0, max: 12)();
  TextColumn get non_proprietary_name => text().withLength(min: 0, max: 64)();
  TextColumn get dosage_form_name => text().withLength(min: 0, max: 64)();
  TextColumn get routename => text().withLength(min: 0, max: 64)();
  TextColumn get start_marketing_date => text().withLength(min: 0, max: 64)();
  TextColumn get end_marketing_date => text().withLength(min: 0, max: 64)();
  TextColumn get marketing_category_name =>
      text().withLength(min: 0, max: 64)();
  TextColumn get application_number => text().withLength(min: 0, max: 64)();
  TextColumn get labeler_name => text().withLength(min: 0, max: 64)();
  TextColumn get substance_name => text().withLength(min: 0, max: 64)();
  TextColumn get active_numerator_strength =>
      text().withLength(min: 0, max: 12)();
  TextColumn get active_ingred_unit => text().withLength(min: 0, max: 4)();
  TextColumn get pharm_classes => text().withLength(min: 0, max: 64)();
  TextColumn get dea_schedule => text().withLength(min: 0, max: 64)();
  TextColumn get ndc_exclude_flag => text().withLength(min: 0, max: 64)();
  TextColumn get listing_record_certified_through =>
      text().withLength(min: 0, max: 64)();
}

class ChartEvents extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get medication_id =>
      text().nullable().customConstraint('NULL REFERENCES medications(id)')();
  RealColumn get medication_qty => real().nullable()();
  TextColumn get qty_units => text().withLength(min: 0, max: 12)();
  TextColumn get event_description => text().withLength(min: 0, max: 8192)();
  TextColumn get event_short_desc => text().withLength(min: 0, max: 80)();
  DateTimeColumn get event_dtm =>
      dateTime().clientDefault(() => DateTime.now())();
}

// TODO: Implement a task list with schedule.  (FUTURE)
// TODO: Implement tags on various things (chart entries, medications, etc.)
//       (FUTURE)

// Data Access Object declarations.
// https://drift.simonbinder.eu/docs/advanced-features/daos/

@DriftAccessor(tables: [Medications])
class MedicationsDao extends DatabaseAccessor<AppDatabase>
    with _$MedicationsDaoMixin {
  final AppDatabase db;

  MedicationsDao(this.db) : super(db);

  Stream<List<Medication>> watchAllMedications() {
    return (select(medications)
          ..orderBy(
            [
              (t) =>
                  OrderingTerm(expression: t.is_prn, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.short_name),
            ],
          ))
        .watch();
  }

  Future insertMedication(Insertable<Medication> medication) =>
      into(medications).insert(medication);
  Future updateMedication(Insertable<Medication> medication) =>
      update(medications).replace(medication);
}

@DriftAccessor(tables: [Medications])
class QuicklistDao extends DatabaseAccessor<AppDatabase>
    with _$QuicklistDaoMixin {
  final AppDatabase db;

  QuicklistDao(this.db) : super(db);

  Stream<List<Medication>> watchAllMedications() {
    return (select(medications)
          ..orderBy(
            [
              (t) =>
                  OrderingTerm(expression: t.is_prn, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.short_name),
            ],
          ))
        .watch();
  }
}

@DriftAccessor(
  tables: [NdcProducts],
)
class NdcDao extends DatabaseAccessor<NdcDatabase> with _$NdcDaoMixin {
  final NdcDatabase ndc_db;

  NdcDao(this.ndc_db) : super(ndc_db);

  // TODO: determine problem with "ndcProduct" vs "ndc_product" in below line.
  //       It should be ndc_product to be consistent.

  // https://moor.simonbinder.eu/docs/getting-started/writing_queries/
  // https://resocoder.com/2019/07/10/moor-room-for-flutter-2-advanced-queries-daos-fluent-sqlite-database/
  // https://www.reddit.com/r/dartlang/comments/h0dfuu/can_anyone_shed_some_light_on_this_syntax_error/
  Future<NdcProduct> getMedicationByNdc(String ndc_number) =>
      (select(ndcProducts)..where((t) => t.product_ndc.equals(ndc_number)))
          .getSingle();

  watchNdcItems() {}
}

@DriftAccessor(tables: [ChartEvents])
class ChartEventsDao extends DatabaseAccessor<AppDatabase>
    with _$ChartEventsDaoMixin {
  final AppDatabase db;

  ChartEventsDao(this.db) : super(db);

  Future insertChartEvent(Insertable<ChartEvent> chartEvent) =>
      into(chartEvents).insert(chartEvent);
  Future updateChartEvent(Insertable<ChartEvent> chartEvent) =>
      update(chartEvents).replace(chartEvent);
}
