import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

part 'moor_database.g.dart';

final _uuid = Uuid();

// Medicerus stuff here

// Medication: a particular instance of a medication.  A prescription for one
// medication that is picked up at the store would result in one record in
// this table.

//@DataClassName("Medications")
class Medications extends Table {
  // TODO: Fix this- why isn't ClientDefault working?  Make the primary key
  //       be a UUID.
  TextColumn get id => text().clientDefault(() => _uuid.v4())();

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
  Set<Column> get primaryKey => {id};
}

// TODO: this is the format of the NDC tables as provided by the FDA.  This
//       should be fixed so that it is type-proper.

class NdcProducts extends Table {
  TextColumn get product_id => text().withLength(min: 4, max: 24)();
  TextColumn get product_ndc => text().withLength(min: 4, max: 16)();
  TextColumn get product_type_name => text().withLength(min: 4, max: 32)();
  TextColumn get proprietary_name => text().withLength(min: 0, max: 64)();
  TextColumn get proprietary_name_suffix => text().withLength(min: 0, max: 12)();
  TextColumn get non_proprietary_name => text().withLength(min: 0, max: 64)();
  TextColumn get dosage_form_name => text().withLength(min: 0, max: 64)();
  TextColumn get routename => text().withLength(min: 0, max: 64)();
  TextColumn get start_marketing_date => text().withLength(min: 0, max: 64)();
  TextColumn get end_marketing_date => text().withLength(min: 0, max: 64)();
  TextColumn get marketing_category_name => text().withLength(min: 0, max: 64)();
  TextColumn get application_number => text().withLength(min: 0, max: 64)();
  TextColumn get labeler_name => text().withLength(min: 0, max: 64)();
  TextColumn get substance_name => text().withLength(min: 0, max: 64)();
  TextColumn get active_numerator_strength => text().withLength(min: 0, max: 12)();
  TextColumn get active_ingred_unit => text().withLength(min: 0, max: 4)();
  TextColumn get pharm_classes => text().withLength(min: 0, max: 64)();
  TextColumn get dea_schedule => text().withLength(min: 0, max: 64)();
  TextColumn get ndc_exclude_flag => text().withLength(min: 0, max: 64)();
  TextColumn get listing_record_certified_through => text().withLength(min: 0, max: 64)();
}

class MedEvents extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get medication_id => text().nullable().customConstraint('NULL REFERENCES medications(id)')();
  DateTimeColumn get event_dtm => dateTime().nullable()();
}

// Original stuff below
class Tasks extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tagName =>
      text().nullable().customConstraint('NULL REFERENCES tags(name)')();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();
}

class Tags extends Table {
  TextColumn get name => text().withLength(min: 1, max: 10)();
  IntColumn get color => integer()();

  @override
  Set<Column> get primaryKey => {name};
}

class TaskWithTag {
  final Task task;
  final Tag tag;

  TaskWithTag({
    @required this.task,
    @required this.tag,
  });
}

@UseMoor(tables: [Tasks, Tags, Medications, MedEvents], daos: [TaskDao, TagDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {
            await migrator.addColumn(tasks, tasks.tagName);
            await migrator.createTable(tags);
          }
        },
    //  TODO: Why doesn't the below work?  the method customStatement is not
    //  defined for the class OpeningDetails
        /*beforeOpen: (db, details) async {
          await db.customStatement('PRAGMA foreign_keys = ON');
        },*/
      );
}

@UseMoor(tables: [NdcProducts], daos: [NdcDao])
class NdcDatabase extends _$NdcDatabase {

  // MyDatabase(String path) : super(FlutterQueryExecutor(path: path));

  NdcDatabase(String path)
    : super(FlutterQueryExecutor.inDatabaseFolder(
          path: path, logStatements: true));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Medications])
class MedicationsDao extends DatabaseAccessor<AppDatabase> with _$MedicationsDaoMixin {
  final AppDatabase db;

  MedicationsDao(this.db) : super(db);

  Stream <List<Medication>> watchAllMedications() {
    return (select(medications)
      ..orderBy(
        [
              (t) =>
              OrderingTerm(expression: t.is_prn, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.short_name),
        ],
      ))
        .watch()
        /*.map((rows) => rows.map(
          (row) {
        return TaskWithTag(
          task: row.readTable(tasks),
          tag: row.readTable(tags),
        );
      },
    )*/
       ;// .toList());
  }

  Future insertMedication(Insertable<Medication> medication) => into(medications).insert(medication);
  Future updateMedication(Insertable<Medication> medication) => update(medications).replace(medication);
  //Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}


@UseDao(
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
  Future <NdcProduct> getMedicationByNdc(String ndc_number) => (select(ndcProducts)..where((t) => t.product_ndc.equals(ndc_number))).getSingle();

  watchNdcItems() {}

}

@UseDao(tables: [Tasks, Tags])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

  Stream<List<TaskWithTag>> watchAllTasks() {
    return (select(tasks)
          ..orderBy(
            [
              (t) =>
                  OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.name),
            ],
          ))
        .join(
          [
            leftOuterJoin(tags, tags.name.equalsExp(tasks.tagName)),
          ],
        )
        .watch()
        .map((rows) => rows.map(
              (row) {
                return TaskWithTag(
                  task: row.readTable(tasks),
                  tag: row.readTable(tags),
                );
              },
            ).toList());
  }

  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}

@UseDao(tables: [Tags])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  final AppDatabase db;

  TagDao(this.db) : super(db);

  Stream<List<Tag>> watchTags() => select(tags).watch();
  Future insertTag(Insertable<Tag> tag) => into(tags).insert(tag);
}
