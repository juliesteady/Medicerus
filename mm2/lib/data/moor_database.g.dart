// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String tagName;
  final String name;
  final DateTime dueDate;
  final bool completed;
  Task(
      {@required this.id,
      this.tagName,
      @required this.name,
      this.dueDate,
      @required this.completed});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      tagName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_name']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      dueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
    );
  }
  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      tagName: serializer.fromJson<String>(json['tagName']),
      name: serializer.fromJson<String>(json['name']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tagName': serializer.toJson<String>(tagName),
      'name': serializer.toJson<String>(name),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  @override
  TasksCompanion createCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      tagName: tagName == null && nullToAbsent
          ? const Value.absent()
          : Value(tagName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
    );
  }

  Task copyWith(
          {int id,
          String tagName,
          String name,
          DateTime dueDate,
          bool completed}) =>
      Task(
        id: id ?? this.id,
        tagName: tagName ?? this.tagName,
        name: name ?? this.name,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('tagName: $tagName, ')
          ..write('name: $name, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(tagName.hashCode,
          $mrjc(name.hashCode, $mrjc(dueDate.hashCode, completed.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.tagName == this.tagName &&
          other.name == this.name &&
          other.dueDate == this.dueDate &&
          other.completed == this.completed);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> tagName;
  final Value<String> name;
  final Value<DateTime> dueDate;
  final Value<bool> completed;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.tagName = const Value.absent(),
    this.name = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    this.tagName = const Value.absent(),
    @required String name,
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  }) : name = Value(name);
  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> tagName,
      Value<String> name,
      Value<DateTime> dueDate,
      Value<bool> completed}) {
    return TasksCompanion(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
    );
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _tagNameMeta = const VerificationMeta('tagName');
  GeneratedTextColumn _tagName;
  @override
  GeneratedTextColumn get tagName => _tagName ??= _constructTagName();
  GeneratedTextColumn _constructTagName() {
    return GeneratedTextColumn('tag_name', $tableName, true,
        $customConstraints: 'NULL REFERENCES tags(name)');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  GeneratedDateTimeColumn _dueDate;
  @override
  GeneratedDateTimeColumn get dueDate => _dueDate ??= _constructDueDate();
  GeneratedDateTimeColumn _constructDueDate() {
    return GeneratedDateTimeColumn(
      'due_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, tagName, name, dueDate, completed];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(TasksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.tagName.present) {
      context.handle(_tagNameMeta,
          tagName.isAcceptableValue(d.tagName.value, _tagNameMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.dueDate.present) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableValue(d.dueDate.value, _dueDateMeta));
    }
    if (d.completed.present) {
      context.handle(_completedMeta,
          completed.isAcceptableValue(d.completed.value, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TasksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.tagName.present) {
      map['tag_name'] = Variable<String, StringType>(d.tagName.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.dueDate.present) {
      map['due_date'] = Variable<DateTime, DateTimeType>(d.dueDate.value);
    }
    if (d.completed.present) {
      map['completed'] = Variable<bool, BoolType>(d.completed.value);
    }
    return map;
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String name;
  final int color;
  Tag({@required this.name, @required this.color});
  factory Tag.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Tag(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
    );
  }
  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tag(
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
    };
  }

  @override
  TagsCompanion createCompanion(bool nullToAbsent) {
    return TagsCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
    );
  }

  Tag copyWith({String name, int color}) => Tag(
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, color.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tag && other.name == this.name && other.color == this.color);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> name;
  final Value<int> color;
  const TagsCompanion({
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  TagsCompanion.insert({
    @required String name,
    @required int color,
  })  : name = Value(name),
        color = Value(color);
  TagsCompanion copyWith({Value<String> name, Value<int> color}) {
    return TagsCompanion(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  final GeneratedDatabase _db;
  final String _alias;
  $TagsTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, color];
  @override
  $TagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tags';
  @override
  final String actualTableName = 'tags';
  @override
  VerificationContext validateIntegrity(TagsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.color.present) {
      context.handle(
          _colorMeta, color.isAcceptableValue(d.color.value, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Tag map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tag.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TagsCompanion d) {
    final map = <String, Variable>{};
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.color.present) {
      map['color'] = Variable<int, IntType>(d.color.value);
    }
    return map;
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(_db, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final int batch_number;
  final bool is_active;
  final bool is_prn;
  final String long_Name;
  final String short_name;
  final String directions;
  final String ndc_id;
  final String rx_number;
  final DateTime rx_expire_date;
  final DateTime fill_date;
  final double fill_qty;
  final double fill_days;
  final double remaining_fill_avail;
  final double safe_delay;
  final String barcode;
  final String manufacturer;
  final String manufacturer_batch;
  final DateTime last_administered;
  Medication(
      {@required this.id,
      this.batch_number,
      @required this.is_active,
      @required this.is_prn,
      @required this.long_Name,
      @required this.short_name,
      @required this.directions,
      @required this.ndc_id,
      @required this.rx_number,
      this.rx_expire_date,
      this.fill_date,
      this.fill_qty,
      this.fill_days,
      this.remaining_fill_avail,
      this.safe_delay,
      @required this.barcode,
      @required this.manufacturer,
      @required this.manufacturer_batch,
      this.last_administered});
  factory Medication.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Medication(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      batch_number: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}batch_number']),
      is_active:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_active']),
      is_prn:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_prn']),
      long_Name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}long_name']),
      short_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}short_name']),
      directions: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}directions']),
      ndc_id:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ndc_id']),
      rx_number: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}rx_number']),
      rx_expire_date: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}rx_expire_date']),
      fill_date: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}fill_date']),
      fill_qty: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}fill_qty']),
      fill_days: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}fill_days']),
      remaining_fill_avail: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}remaining_fill_avail']),
      safe_delay: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}safe_delay']),
      barcode:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}barcode']),
      manufacturer: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}manufacturer']),
      manufacturer_batch: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}manufacturer_batch']),
      last_administered: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_administered']),
    );
  }
  factory Medication.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      batch_number: serializer.fromJson<int>(json['batch_number']),
      is_active: serializer.fromJson<bool>(json['is_active']),
      is_prn: serializer.fromJson<bool>(json['is_prn']),
      long_Name: serializer.fromJson<String>(json['long_Name']),
      short_name: serializer.fromJson<String>(json['short_name']),
      directions: serializer.fromJson<String>(json['directions']),
      ndc_id: serializer.fromJson<String>(json['ndc_id']),
      rx_number: serializer.fromJson<String>(json['rx_number']),
      rx_expire_date: serializer.fromJson<DateTime>(json['rx_expire_date']),
      fill_date: serializer.fromJson<DateTime>(json['fill_date']),
      fill_qty: serializer.fromJson<double>(json['fill_qty']),
      fill_days: serializer.fromJson<double>(json['fill_days']),
      remaining_fill_avail:
          serializer.fromJson<double>(json['remaining_fill_avail']),
      safe_delay: serializer.fromJson<double>(json['safe_delay']),
      barcode: serializer.fromJson<String>(json['barcode']),
      manufacturer: serializer.fromJson<String>(json['manufacturer']),
      manufacturer_batch:
          serializer.fromJson<String>(json['manufacturer_batch']),
      last_administered:
          serializer.fromJson<DateTime>(json['last_administered']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batch_number': serializer.toJson<int>(batch_number),
      'is_active': serializer.toJson<bool>(is_active),
      'is_prn': serializer.toJson<bool>(is_prn),
      'long_Name': serializer.toJson<String>(long_Name),
      'short_name': serializer.toJson<String>(short_name),
      'directions': serializer.toJson<String>(directions),
      'ndc_id': serializer.toJson<String>(ndc_id),
      'rx_number': serializer.toJson<String>(rx_number),
      'rx_expire_date': serializer.toJson<DateTime>(rx_expire_date),
      'fill_date': serializer.toJson<DateTime>(fill_date),
      'fill_qty': serializer.toJson<double>(fill_qty),
      'fill_days': serializer.toJson<double>(fill_days),
      'remaining_fill_avail': serializer.toJson<double>(remaining_fill_avail),
      'safe_delay': serializer.toJson<double>(safe_delay),
      'barcode': serializer.toJson<String>(barcode),
      'manufacturer': serializer.toJson<String>(manufacturer),
      'manufacturer_batch': serializer.toJson<String>(manufacturer_batch),
      'last_administered': serializer.toJson<DateTime>(last_administered),
    };
  }

  @override
  MedicationsCompanion createCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      batch_number: batch_number == null && nullToAbsent
          ? const Value.absent()
          : Value(batch_number),
      is_active: is_active == null && nullToAbsent
          ? const Value.absent()
          : Value(is_active),
      is_prn:
          is_prn == null && nullToAbsent ? const Value.absent() : Value(is_prn),
      long_Name: long_Name == null && nullToAbsent
          ? const Value.absent()
          : Value(long_Name),
      short_name: short_name == null && nullToAbsent
          ? const Value.absent()
          : Value(short_name),
      directions: directions == null && nullToAbsent
          ? const Value.absent()
          : Value(directions),
      ndc_id:
          ndc_id == null && nullToAbsent ? const Value.absent() : Value(ndc_id),
      rx_number: rx_number == null && nullToAbsent
          ? const Value.absent()
          : Value(rx_number),
      rx_expire_date: rx_expire_date == null && nullToAbsent
          ? const Value.absent()
          : Value(rx_expire_date),
      fill_date: fill_date == null && nullToAbsent
          ? const Value.absent()
          : Value(fill_date),
      fill_qty: fill_qty == null && nullToAbsent
          ? const Value.absent()
          : Value(fill_qty),
      fill_days: fill_days == null && nullToAbsent
          ? const Value.absent()
          : Value(fill_days),
      remaining_fill_avail: remaining_fill_avail == null && nullToAbsent
          ? const Value.absent()
          : Value(remaining_fill_avail),
      safe_delay: safe_delay == null && nullToAbsent
          ? const Value.absent()
          : Value(safe_delay),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      manufacturer: manufacturer == null && nullToAbsent
          ? const Value.absent()
          : Value(manufacturer),
      manufacturer_batch: manufacturer_batch == null && nullToAbsent
          ? const Value.absent()
          : Value(manufacturer_batch),
      last_administered: last_administered == null && nullToAbsent
          ? const Value.absent()
          : Value(last_administered),
    );
  }

  Medication copyWith(
          {String id,
          int batch_number,
          bool is_active,
          bool is_prn,
          String long_Name,
          String short_name,
          String directions,
          String ndc_id,
          String rx_number,
          DateTime rx_expire_date,
          DateTime fill_date,
          double fill_qty,
          double fill_days,
          double remaining_fill_avail,
          double safe_delay,
          String barcode,
          String manufacturer,
          String manufacturer_batch,
          DateTime last_administered}) =>
      Medication(
        id: id ?? this.id,
        batch_number: batch_number ?? this.batch_number,
        is_active: is_active ?? this.is_active,
        is_prn: is_prn ?? this.is_prn,
        long_Name: long_Name ?? this.long_Name,
        short_name: short_name ?? this.short_name,
        directions: directions ?? this.directions,
        ndc_id: ndc_id ?? this.ndc_id,
        rx_number: rx_number ?? this.rx_number,
        rx_expire_date: rx_expire_date ?? this.rx_expire_date,
        fill_date: fill_date ?? this.fill_date,
        fill_qty: fill_qty ?? this.fill_qty,
        fill_days: fill_days ?? this.fill_days,
        remaining_fill_avail: remaining_fill_avail ?? this.remaining_fill_avail,
        safe_delay: safe_delay ?? this.safe_delay,
        barcode: barcode ?? this.barcode,
        manufacturer: manufacturer ?? this.manufacturer,
        manufacturer_batch: manufacturer_batch ?? this.manufacturer_batch,
        last_administered: last_administered ?? this.last_administered,
      );
  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('batch_number: $batch_number, ')
          ..write('is_active: $is_active, ')
          ..write('is_prn: $is_prn, ')
          ..write('long_Name: $long_Name, ')
          ..write('short_name: $short_name, ')
          ..write('directions: $directions, ')
          ..write('ndc_id: $ndc_id, ')
          ..write('rx_number: $rx_number, ')
          ..write('rx_expire_date: $rx_expire_date, ')
          ..write('fill_date: $fill_date, ')
          ..write('fill_qty: $fill_qty, ')
          ..write('fill_days: $fill_days, ')
          ..write('remaining_fill_avail: $remaining_fill_avail, ')
          ..write('safe_delay: $safe_delay, ')
          ..write('barcode: $barcode, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('manufacturer_batch: $manufacturer_batch, ')
          ..write('last_administered: $last_administered')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          batch_number.hashCode,
          $mrjc(
              is_active.hashCode,
              $mrjc(
                  is_prn.hashCode,
                  $mrjc(
                      long_Name.hashCode,
                      $mrjc(
                          short_name.hashCode,
                          $mrjc(
                              directions.hashCode,
                              $mrjc(
                                  ndc_id.hashCode,
                                  $mrjc(
                                      rx_number.hashCode,
                                      $mrjc(
                                          rx_expire_date.hashCode,
                                          $mrjc(
                                              fill_date.hashCode,
                                              $mrjc(
                                                  fill_qty.hashCode,
                                                  $mrjc(
                                                      fill_days.hashCode,
                                                      $mrjc(
                                                          remaining_fill_avail
                                                              .hashCode,
                                                          $mrjc(
                                                              safe_delay
                                                                  .hashCode,
                                                              $mrjc(
                                                                  barcode
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      manufacturer
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          manufacturer_batch
                                                                              .hashCode,
                                                                          last_administered
                                                                              .hashCode)))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.batch_number == this.batch_number &&
          other.is_active == this.is_active &&
          other.is_prn == this.is_prn &&
          other.long_Name == this.long_Name &&
          other.short_name == this.short_name &&
          other.directions == this.directions &&
          other.ndc_id == this.ndc_id &&
          other.rx_number == this.rx_number &&
          other.rx_expire_date == this.rx_expire_date &&
          other.fill_date == this.fill_date &&
          other.fill_qty == this.fill_qty &&
          other.fill_days == this.fill_days &&
          other.remaining_fill_avail == this.remaining_fill_avail &&
          other.safe_delay == this.safe_delay &&
          other.barcode == this.barcode &&
          other.manufacturer == this.manufacturer &&
          other.manufacturer_batch == this.manufacturer_batch &&
          other.last_administered == this.last_administered);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<int> batch_number;
  final Value<bool> is_active;
  final Value<bool> is_prn;
  final Value<String> long_Name;
  final Value<String> short_name;
  final Value<String> directions;
  final Value<String> ndc_id;
  final Value<String> rx_number;
  final Value<DateTime> rx_expire_date;
  final Value<DateTime> fill_date;
  final Value<double> fill_qty;
  final Value<double> fill_days;
  final Value<double> remaining_fill_avail;
  final Value<double> safe_delay;
  final Value<String> barcode;
  final Value<String> manufacturer;
  final Value<String> manufacturer_batch;
  final Value<DateTime> last_administered;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.batch_number = const Value.absent(),
    this.is_active = const Value.absent(),
    this.is_prn = const Value.absent(),
    this.long_Name = const Value.absent(),
    this.short_name = const Value.absent(),
    this.directions = const Value.absent(),
    this.ndc_id = const Value.absent(),
    this.rx_number = const Value.absent(),
    this.rx_expire_date = const Value.absent(),
    this.fill_date = const Value.absent(),
    this.fill_qty = const Value.absent(),
    this.fill_days = const Value.absent(),
    this.remaining_fill_avail = const Value.absent(),
    this.safe_delay = const Value.absent(),
    this.barcode = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.manufacturer_batch = const Value.absent(),
    this.last_administered = const Value.absent(),
  });
  MedicationsCompanion.insert({
    this.id = const Value.absent(),
    this.batch_number = const Value.absent(),
    @required bool is_active,
    @required bool is_prn,
    @required String long_Name,
    @required String short_name,
    @required String directions,
    @required String ndc_id,
    @required String rx_number,
    this.rx_expire_date = const Value.absent(),
    this.fill_date = const Value.absent(),
    this.fill_qty = const Value.absent(),
    this.fill_days = const Value.absent(),
    this.remaining_fill_avail = const Value.absent(),
    this.safe_delay = const Value.absent(),
    @required String barcode,
    @required String manufacturer,
    @required String manufacturer_batch,
    this.last_administered = const Value.absent(),
  })  : is_active = Value(is_active),
        is_prn = Value(is_prn),
        long_Name = Value(long_Name),
        short_name = Value(short_name),
        directions = Value(directions),
        ndc_id = Value(ndc_id),
        rx_number = Value(rx_number),
        barcode = Value(barcode),
        manufacturer = Value(manufacturer),
        manufacturer_batch = Value(manufacturer_batch);
  MedicationsCompanion copyWith(
      {Value<String> id,
      Value<int> batch_number,
      Value<bool> is_active,
      Value<bool> is_prn,
      Value<String> long_Name,
      Value<String> short_name,
      Value<String> directions,
      Value<String> ndc_id,
      Value<String> rx_number,
      Value<DateTime> rx_expire_date,
      Value<DateTime> fill_date,
      Value<double> fill_qty,
      Value<double> fill_days,
      Value<double> remaining_fill_avail,
      Value<double> safe_delay,
      Value<String> barcode,
      Value<String> manufacturer,
      Value<String> manufacturer_batch,
      Value<DateTime> last_administered}) {
    return MedicationsCompanion(
      id: id ?? this.id,
      batch_number: batch_number ?? this.batch_number,
      is_active: is_active ?? this.is_active,
      is_prn: is_prn ?? this.is_prn,
      long_Name: long_Name ?? this.long_Name,
      short_name: short_name ?? this.short_name,
      directions: directions ?? this.directions,
      ndc_id: ndc_id ?? this.ndc_id,
      rx_number: rx_number ?? this.rx_number,
      rx_expire_date: rx_expire_date ?? this.rx_expire_date,
      fill_date: fill_date ?? this.fill_date,
      fill_qty: fill_qty ?? this.fill_qty,
      fill_days: fill_days ?? this.fill_days,
      remaining_fill_avail: remaining_fill_avail ?? this.remaining_fill_avail,
      safe_delay: safe_delay ?? this.safe_delay,
      barcode: barcode ?? this.barcode,
      manufacturer: manufacturer ?? this.manufacturer,
      manufacturer_batch: manufacturer_batch ?? this.manufacturer_batch,
      last_administered: last_administered ?? this.last_administered,
    );
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  final GeneratedDatabase _db;
  final String _alias;
  $MedicationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => _uuid.v4();
  }

  final VerificationMeta _batch_numberMeta =
      const VerificationMeta('batch_number');
  GeneratedIntColumn _batch_number;
  @override
  GeneratedIntColumn get batch_number =>
      _batch_number ??= _constructBatchNumber();
  GeneratedIntColumn _constructBatchNumber() {
    return GeneratedIntColumn(
      'batch_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _is_activeMeta = const VerificationMeta('is_active');
  GeneratedBoolColumn _is_active;
  @override
  GeneratedBoolColumn get is_active => _is_active ??= _constructIsActive();
  GeneratedBoolColumn _constructIsActive() {
    return GeneratedBoolColumn(
      'is_active',
      $tableName,
      false,
    );
  }

  final VerificationMeta _is_prnMeta = const VerificationMeta('is_prn');
  GeneratedBoolColumn _is_prn;
  @override
  GeneratedBoolColumn get is_prn => _is_prn ??= _constructIsPrn();
  GeneratedBoolColumn _constructIsPrn() {
    return GeneratedBoolColumn(
      'is_prn',
      $tableName,
      false,
    );
  }

  final VerificationMeta _long_NameMeta = const VerificationMeta('long_Name');
  GeneratedTextColumn _long_Name;
  @override
  GeneratedTextColumn get long_Name => _long_Name ??= _constructLongName();
  GeneratedTextColumn _constructLongName() {
    return GeneratedTextColumn('long_name', $tableName, false,
        minTextLength: 4, maxTextLength: 256);
  }

  final VerificationMeta _short_nameMeta = const VerificationMeta('short_name');
  GeneratedTextColumn _short_name;
  @override
  GeneratedTextColumn get short_name => _short_name ??= _constructShortName();
  GeneratedTextColumn _constructShortName() {
    return GeneratedTextColumn('short_name', $tableName, false,
        minTextLength: 4, maxTextLength: 64);
  }

  final VerificationMeta _directionsMeta = const VerificationMeta('directions');
  GeneratedTextColumn _directions;
  @override
  GeneratedTextColumn get directions => _directions ??= _constructDirections();
  GeneratedTextColumn _constructDirections() {
    return GeneratedTextColumn('directions', $tableName, false,
        minTextLength: 1, maxTextLength: 4096);
  }

  final VerificationMeta _ndc_idMeta = const VerificationMeta('ndc_id');
  GeneratedTextColumn _ndc_id;
  @override
  GeneratedTextColumn get ndc_id => _ndc_id ??= _constructNdcId();
  GeneratedTextColumn _constructNdcId() {
    return GeneratedTextColumn('ndc_id', $tableName, false,
        minTextLength: 1, maxTextLength: 24);
  }

  final VerificationMeta _rx_numberMeta = const VerificationMeta('rx_number');
  GeneratedTextColumn _rx_number;
  @override
  GeneratedTextColumn get rx_number => _rx_number ??= _constructRxNumber();
  GeneratedTextColumn _constructRxNumber() {
    return GeneratedTextColumn('rx_number', $tableName, false,
        minTextLength: 1, maxTextLength: 24);
  }

  final VerificationMeta _rx_expire_dateMeta =
      const VerificationMeta('rx_expire_date');
  GeneratedDateTimeColumn _rx_expire_date;
  @override
  GeneratedDateTimeColumn get rx_expire_date =>
      _rx_expire_date ??= _constructRxExpireDate();
  GeneratedDateTimeColumn _constructRxExpireDate() {
    return GeneratedDateTimeColumn(
      'rx_expire_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fill_dateMeta = const VerificationMeta('fill_date');
  GeneratedDateTimeColumn _fill_date;
  @override
  GeneratedDateTimeColumn get fill_date => _fill_date ??= _constructFillDate();
  GeneratedDateTimeColumn _constructFillDate() {
    return GeneratedDateTimeColumn(
      'fill_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fill_qtyMeta = const VerificationMeta('fill_qty');
  GeneratedRealColumn _fill_qty;
  @override
  GeneratedRealColumn get fill_qty => _fill_qty ??= _constructFillQty();
  GeneratedRealColumn _constructFillQty() {
    return GeneratedRealColumn(
      'fill_qty',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fill_daysMeta = const VerificationMeta('fill_days');
  GeneratedRealColumn _fill_days;
  @override
  GeneratedRealColumn get fill_days => _fill_days ??= _constructFillDays();
  GeneratedRealColumn _constructFillDays() {
    return GeneratedRealColumn(
      'fill_days',
      $tableName,
      true,
    );
  }

  final VerificationMeta _remaining_fill_availMeta =
      const VerificationMeta('remaining_fill_avail');
  GeneratedRealColumn _remaining_fill_avail;
  @override
  GeneratedRealColumn get remaining_fill_avail =>
      _remaining_fill_avail ??= _constructRemainingFillAvail();
  GeneratedRealColumn _constructRemainingFillAvail() {
    return GeneratedRealColumn(
      'remaining_fill_avail',
      $tableName,
      true,
    );
  }

  final VerificationMeta _safe_delayMeta = const VerificationMeta('safe_delay');
  GeneratedRealColumn _safe_delay;
  @override
  GeneratedRealColumn get safe_delay => _safe_delay ??= _constructSafeDelay();
  GeneratedRealColumn _constructSafeDelay() {
    return GeneratedRealColumn(
      'safe_delay',
      $tableName,
      true,
    );
  }

  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  GeneratedTextColumn _barcode;
  @override
  GeneratedTextColumn get barcode => _barcode ??= _constructBarcode();
  GeneratedTextColumn _constructBarcode() {
    return GeneratedTextColumn('barcode', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _manufacturerMeta =
      const VerificationMeta('manufacturer');
  GeneratedTextColumn _manufacturer;
  @override
  GeneratedTextColumn get manufacturer =>
      _manufacturer ??= _constructManufacturer();
  GeneratedTextColumn _constructManufacturer() {
    return GeneratedTextColumn('manufacturer', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _manufacturer_batchMeta =
      const VerificationMeta('manufacturer_batch');
  GeneratedTextColumn _manufacturer_batch;
  @override
  GeneratedTextColumn get manufacturer_batch =>
      _manufacturer_batch ??= _constructManufacturerBatch();
  GeneratedTextColumn _constructManufacturerBatch() {
    return GeneratedTextColumn('manufacturer_batch', $tableName, false,
        minTextLength: 0, maxTextLength: 16);
  }

  final VerificationMeta _last_administeredMeta =
      const VerificationMeta('last_administered');
  GeneratedDateTimeColumn _last_administered;
  @override
  GeneratedDateTimeColumn get last_administered =>
      _last_administered ??= _constructLastAdministered();
  GeneratedDateTimeColumn _constructLastAdministered() {
    return GeneratedDateTimeColumn(
      'last_administered',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        batch_number,
        is_active,
        is_prn,
        long_Name,
        short_name,
        directions,
        ndc_id,
        rx_number,
        rx_expire_date,
        fill_date,
        fill_qty,
        fill_days,
        remaining_fill_avail,
        safe_delay,
        barcode,
        manufacturer,
        manufacturer_batch,
        last_administered
      ];
  @override
  $MedicationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'medications';
  @override
  final String actualTableName = 'medications';
  @override
  VerificationContext validateIntegrity(MedicationsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.batch_number.present) {
      context.handle(
          _batch_numberMeta,
          batch_number.isAcceptableValue(
              d.batch_number.value, _batch_numberMeta));
    }
    if (d.is_active.present) {
      context.handle(_is_activeMeta,
          is_active.isAcceptableValue(d.is_active.value, _is_activeMeta));
    } else if (isInserting) {
      context.missing(_is_activeMeta);
    }
    if (d.is_prn.present) {
      context.handle(
          _is_prnMeta, is_prn.isAcceptableValue(d.is_prn.value, _is_prnMeta));
    } else if (isInserting) {
      context.missing(_is_prnMeta);
    }
    if (d.long_Name.present) {
      context.handle(_long_NameMeta,
          long_Name.isAcceptableValue(d.long_Name.value, _long_NameMeta));
    } else if (isInserting) {
      context.missing(_long_NameMeta);
    }
    if (d.short_name.present) {
      context.handle(_short_nameMeta,
          short_name.isAcceptableValue(d.short_name.value, _short_nameMeta));
    } else if (isInserting) {
      context.missing(_short_nameMeta);
    }
    if (d.directions.present) {
      context.handle(_directionsMeta,
          directions.isAcceptableValue(d.directions.value, _directionsMeta));
    } else if (isInserting) {
      context.missing(_directionsMeta);
    }
    if (d.ndc_id.present) {
      context.handle(
          _ndc_idMeta, ndc_id.isAcceptableValue(d.ndc_id.value, _ndc_idMeta));
    } else if (isInserting) {
      context.missing(_ndc_idMeta);
    }
    if (d.rx_number.present) {
      context.handle(_rx_numberMeta,
          rx_number.isAcceptableValue(d.rx_number.value, _rx_numberMeta));
    } else if (isInserting) {
      context.missing(_rx_numberMeta);
    }
    if (d.rx_expire_date.present) {
      context.handle(
          _rx_expire_dateMeta,
          rx_expire_date.isAcceptableValue(
              d.rx_expire_date.value, _rx_expire_dateMeta));
    }
    if (d.fill_date.present) {
      context.handle(_fill_dateMeta,
          fill_date.isAcceptableValue(d.fill_date.value, _fill_dateMeta));
    }
    if (d.fill_qty.present) {
      context.handle(_fill_qtyMeta,
          fill_qty.isAcceptableValue(d.fill_qty.value, _fill_qtyMeta));
    }
    if (d.fill_days.present) {
      context.handle(_fill_daysMeta,
          fill_days.isAcceptableValue(d.fill_days.value, _fill_daysMeta));
    }
    if (d.remaining_fill_avail.present) {
      context.handle(
          _remaining_fill_availMeta,
          remaining_fill_avail.isAcceptableValue(
              d.remaining_fill_avail.value, _remaining_fill_availMeta));
    }
    if (d.safe_delay.present) {
      context.handle(_safe_delayMeta,
          safe_delay.isAcceptableValue(d.safe_delay.value, _safe_delayMeta));
    }
    if (d.barcode.present) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableValue(d.barcode.value, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (d.manufacturer.present) {
      context.handle(
          _manufacturerMeta,
          manufacturer.isAcceptableValue(
              d.manufacturer.value, _manufacturerMeta));
    } else if (isInserting) {
      context.missing(_manufacturerMeta);
    }
    if (d.manufacturer_batch.present) {
      context.handle(
          _manufacturer_batchMeta,
          manufacturer_batch.isAcceptableValue(
              d.manufacturer_batch.value, _manufacturer_batchMeta));
    } else if (isInserting) {
      context.missing(_manufacturer_batchMeta);
    }
    if (d.last_administered.present) {
      context.handle(
          _last_administeredMeta,
          last_administered.isAcceptableValue(
              d.last_administered.value, _last_administeredMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Medication.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MedicationsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.batch_number.present) {
      map['batch_number'] = Variable<int, IntType>(d.batch_number.value);
    }
    if (d.is_active.present) {
      map['is_active'] = Variable<bool, BoolType>(d.is_active.value);
    }
    if (d.is_prn.present) {
      map['is_prn'] = Variable<bool, BoolType>(d.is_prn.value);
    }
    if (d.long_Name.present) {
      map['long_name'] = Variable<String, StringType>(d.long_Name.value);
    }
    if (d.short_name.present) {
      map['short_name'] = Variable<String, StringType>(d.short_name.value);
    }
    if (d.directions.present) {
      map['directions'] = Variable<String, StringType>(d.directions.value);
    }
    if (d.ndc_id.present) {
      map['ndc_id'] = Variable<String, StringType>(d.ndc_id.value);
    }
    if (d.rx_number.present) {
      map['rx_number'] = Variable<String, StringType>(d.rx_number.value);
    }
    if (d.rx_expire_date.present) {
      map['rx_expire_date'] =
          Variable<DateTime, DateTimeType>(d.rx_expire_date.value);
    }
    if (d.fill_date.present) {
      map['fill_date'] = Variable<DateTime, DateTimeType>(d.fill_date.value);
    }
    if (d.fill_qty.present) {
      map['fill_qty'] = Variable<double, RealType>(d.fill_qty.value);
    }
    if (d.fill_days.present) {
      map['fill_days'] = Variable<double, RealType>(d.fill_days.value);
    }
    if (d.remaining_fill_avail.present) {
      map['remaining_fill_avail'] =
          Variable<double, RealType>(d.remaining_fill_avail.value);
    }
    if (d.safe_delay.present) {
      map['safe_delay'] = Variable<double, RealType>(d.safe_delay.value);
    }
    if (d.barcode.present) {
      map['barcode'] = Variable<String, StringType>(d.barcode.value);
    }
    if (d.manufacturer.present) {
      map['manufacturer'] = Variable<String, StringType>(d.manufacturer.value);
    }
    if (d.manufacturer_batch.present) {
      map['manufacturer_batch'] =
          Variable<String, StringType>(d.manufacturer_batch.value);
    }
    if (d.last_administered.present) {
      map['last_administered'] =
          Variable<DateTime, DateTimeType>(d.last_administered.value);
    }
    return map;
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(_db, alias);
  }
}

class MedEvent extends DataClass implements Insertable<MedEvent> {
  final String id;
  final String medication_id;
  final DateTime event_dtm;
  MedEvent({@required this.id, this.medication_id, this.event_dtm});
  factory MedEvent.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return MedEvent(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      medication_id: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}medication_id']),
      event_dtm: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_dtm']),
    );
  }
  factory MedEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MedEvent(
      id: serializer.fromJson<String>(json['id']),
      medication_id: serializer.fromJson<String>(json['medication_id']),
      event_dtm: serializer.fromJson<DateTime>(json['event_dtm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medication_id': serializer.toJson<String>(medication_id),
      'event_dtm': serializer.toJson<DateTime>(event_dtm),
    };
  }

  @override
  MedEventsCompanion createCompanion(bool nullToAbsent) {
    return MedEventsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      medication_id: medication_id == null && nullToAbsent
          ? const Value.absent()
          : Value(medication_id),
      event_dtm: event_dtm == null && nullToAbsent
          ? const Value.absent()
          : Value(event_dtm),
    );
  }

  MedEvent copyWith({String id, String medication_id, DateTime event_dtm}) =>
      MedEvent(
        id: id ?? this.id,
        medication_id: medication_id ?? this.medication_id,
        event_dtm: event_dtm ?? this.event_dtm,
      );
  @override
  String toString() {
    return (StringBuffer('MedEvent(')
          ..write('id: $id, ')
          ..write('medication_id: $medication_id, ')
          ..write('event_dtm: $event_dtm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(medication_id.hashCode, event_dtm.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MedEvent &&
          other.id == this.id &&
          other.medication_id == this.medication_id &&
          other.event_dtm == this.event_dtm);
}

class MedEventsCompanion extends UpdateCompanion<MedEvent> {
  final Value<String> id;
  final Value<String> medication_id;
  final Value<DateTime> event_dtm;
  const MedEventsCompanion({
    this.id = const Value.absent(),
    this.medication_id = const Value.absent(),
    this.event_dtm = const Value.absent(),
  });
  MedEventsCompanion.insert({
    this.id = const Value.absent(),
    this.medication_id = const Value.absent(),
    this.event_dtm = const Value.absent(),
  });
  MedEventsCompanion copyWith(
      {Value<String> id,
      Value<String> medication_id,
      Value<DateTime> event_dtm}) {
    return MedEventsCompanion(
      id: id ?? this.id,
      medication_id: medication_id ?? this.medication_id,
      event_dtm: event_dtm ?? this.event_dtm,
    );
  }
}

class $MedEventsTable extends MedEvents
    with TableInfo<$MedEventsTable, MedEvent> {
  final GeneratedDatabase _db;
  final String _alias;
  $MedEventsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => _uuid.v4();
  }

  final VerificationMeta _medication_idMeta =
      const VerificationMeta('medication_id');
  GeneratedTextColumn _medication_id;
  @override
  GeneratedTextColumn get medication_id =>
      _medication_id ??= _constructMedicationId();
  GeneratedTextColumn _constructMedicationId() {
    return GeneratedTextColumn('medication_id', $tableName, true,
        $customConstraints: 'NULL REFERENCES medications(id)');
  }

  final VerificationMeta _event_dtmMeta = const VerificationMeta('event_dtm');
  GeneratedDateTimeColumn _event_dtm;
  @override
  GeneratedDateTimeColumn get event_dtm => _event_dtm ??= _constructEventDtm();
  GeneratedDateTimeColumn _constructEventDtm() {
    return GeneratedDateTimeColumn(
      'event_dtm',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, medication_id, event_dtm];
  @override
  $MedEventsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'med_events';
  @override
  final String actualTableName = 'med_events';
  @override
  VerificationContext validateIntegrity(MedEventsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.medication_id.present) {
      context.handle(
          _medication_idMeta,
          medication_id.isAcceptableValue(
              d.medication_id.value, _medication_idMeta));
    }
    if (d.event_dtm.present) {
      context.handle(_event_dtmMeta,
          event_dtm.isAcceptableValue(d.event_dtm.value, _event_dtmMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MedEvent map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MedEvent.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MedEventsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.medication_id.present) {
      map['medication_id'] =
          Variable<String, StringType>(d.medication_id.value);
    }
    if (d.event_dtm.present) {
      map['event_dtm'] = Variable<DateTime, DateTimeType>(d.event_dtm.value);
    }
    return map;
  }

  @override
  $MedEventsTable createAlias(String alias) {
    return $MedEventsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  $TagsTable _tags;
  $TagsTable get tags => _tags ??= $TagsTable(this);
  $MedicationsTable _medications;
  $MedicationsTable get medications => _medications ??= $MedicationsTable(this);
  $MedEventsTable _medEvents;
  $MedEventsTable get medEvents => _medEvents ??= $MedEventsTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as AppDatabase);
  TagDao _tagDao;
  TagDao get tagDao => _tagDao ??= TagDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tasks, tags, medications, medEvents];
}

class NdcProduct extends DataClass implements Insertable<NdcProduct> {
  final String product_id;
  final String product_ndc;
  final String product_type_name;
  final String proprietary_name;
  final String proprietary_name_suffix;
  final String non_proprietary_name;
  final String dosage_form_name;
  final String routename;
  final String start_marketing_date;
  final String end_marketing_date;
  final String marketing_category_name;
  final String application_number;
  final String labeler_name;
  final String substance_name;
  final String active_numerator_strength;
  final String active_ingred_unit;
  final String pharm_classes;
  final String dea_schedule;
  final String ndc_exclude_flag;
  final String listing_record_certified_through;
  NdcProduct(
      {@required this.product_id,
      @required this.product_ndc,
      @required this.product_type_name,
      @required this.proprietary_name,
      @required this.proprietary_name_suffix,
      @required this.non_proprietary_name,
      @required this.dosage_form_name,
      @required this.routename,
      @required this.start_marketing_date,
      @required this.end_marketing_date,
      @required this.marketing_category_name,
      @required this.application_number,
      @required this.labeler_name,
      @required this.substance_name,
      @required this.active_numerator_strength,
      @required this.active_ingred_unit,
      @required this.pharm_classes,
      @required this.dea_schedule,
      @required this.ndc_exclude_flag,
      @required this.listing_record_certified_through});
  factory NdcProduct.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NdcProduct(
      product_id: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id']),
      product_ndc: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_ndc']),
      product_type_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_type_name']),
      proprietary_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}proprietary_name']),
      proprietary_name_suffix: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}proprietary_name_suffix']),
      non_proprietary_name: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}non_proprietary_name']),
      dosage_form_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dosage_form_name']),
      routename: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}routename']),
      start_marketing_date: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}start_marketing_date']),
      end_marketing_date: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}end_marketing_date']),
      marketing_category_name: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}marketing_category_name']),
      application_number: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}application_number']),
      labeler_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}labeler_name']),
      substance_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}substance_name']),
      active_numerator_strength: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}active_numerator_strength']),
      active_ingred_unit: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}active_ingred_unit']),
      pharm_classes: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pharm_classes']),
      dea_schedule: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dea_schedule']),
      ndc_exclude_flag: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ndc_exclude_flag']),
      listing_record_certified_through: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}listing_record_certified_through']),
    );
  }
  factory NdcProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NdcProduct(
      product_id: serializer.fromJson<String>(json['product_id']),
      product_ndc: serializer.fromJson<String>(json['product_ndc']),
      product_type_name: serializer.fromJson<String>(json['product_type_name']),
      proprietary_name: serializer.fromJson<String>(json['proprietary_name']),
      proprietary_name_suffix:
          serializer.fromJson<String>(json['proprietary_name_suffix']),
      non_proprietary_name:
          serializer.fromJson<String>(json['non_proprietary_name']),
      dosage_form_name: serializer.fromJson<String>(json['dosage_form_name']),
      routename: serializer.fromJson<String>(json['routename']),
      start_marketing_date:
          serializer.fromJson<String>(json['start_marketing_date']),
      end_marketing_date:
          serializer.fromJson<String>(json['end_marketing_date']),
      marketing_category_name:
          serializer.fromJson<String>(json['marketing_category_name']),
      application_number:
          serializer.fromJson<String>(json['application_number']),
      labeler_name: serializer.fromJson<String>(json['labeler_name']),
      substance_name: serializer.fromJson<String>(json['substance_name']),
      active_numerator_strength:
          serializer.fromJson<String>(json['active_numerator_strength']),
      active_ingred_unit:
          serializer.fromJson<String>(json['active_ingred_unit']),
      pharm_classes: serializer.fromJson<String>(json['pharm_classes']),
      dea_schedule: serializer.fromJson<String>(json['dea_schedule']),
      ndc_exclude_flag: serializer.fromJson<String>(json['ndc_exclude_flag']),
      listing_record_certified_through:
          serializer.fromJson<String>(json['listing_record_certified_through']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'product_id': serializer.toJson<String>(product_id),
      'product_ndc': serializer.toJson<String>(product_ndc),
      'product_type_name': serializer.toJson<String>(product_type_name),
      'proprietary_name': serializer.toJson<String>(proprietary_name),
      'proprietary_name_suffix':
          serializer.toJson<String>(proprietary_name_suffix),
      'non_proprietary_name': serializer.toJson<String>(non_proprietary_name),
      'dosage_form_name': serializer.toJson<String>(dosage_form_name),
      'routename': serializer.toJson<String>(routename),
      'start_marketing_date': serializer.toJson<String>(start_marketing_date),
      'end_marketing_date': serializer.toJson<String>(end_marketing_date),
      'marketing_category_name':
          serializer.toJson<String>(marketing_category_name),
      'application_number': serializer.toJson<String>(application_number),
      'labeler_name': serializer.toJson<String>(labeler_name),
      'substance_name': serializer.toJson<String>(substance_name),
      'active_numerator_strength':
          serializer.toJson<String>(active_numerator_strength),
      'active_ingred_unit': serializer.toJson<String>(active_ingred_unit),
      'pharm_classes': serializer.toJson<String>(pharm_classes),
      'dea_schedule': serializer.toJson<String>(dea_schedule),
      'ndc_exclude_flag': serializer.toJson<String>(ndc_exclude_flag),
      'listing_record_certified_through':
          serializer.toJson<String>(listing_record_certified_through),
    };
  }

  @override
  NdcProductsCompanion createCompanion(bool nullToAbsent) {
    return NdcProductsCompanion(
      product_id: product_id == null && nullToAbsent
          ? const Value.absent()
          : Value(product_id),
      product_ndc: product_ndc == null && nullToAbsent
          ? const Value.absent()
          : Value(product_ndc),
      product_type_name: product_type_name == null && nullToAbsent
          ? const Value.absent()
          : Value(product_type_name),
      proprietary_name: proprietary_name == null && nullToAbsent
          ? const Value.absent()
          : Value(proprietary_name),
      proprietary_name_suffix: proprietary_name_suffix == null && nullToAbsent
          ? const Value.absent()
          : Value(proprietary_name_suffix),
      non_proprietary_name: non_proprietary_name == null && nullToAbsent
          ? const Value.absent()
          : Value(non_proprietary_name),
      dosage_form_name: dosage_form_name == null && nullToAbsent
          ? const Value.absent()
          : Value(dosage_form_name),
      routename: routename == null && nullToAbsent
          ? const Value.absent()
          : Value(routename),
      start_marketing_date: start_marketing_date == null && nullToAbsent
          ? const Value.absent()
          : Value(start_marketing_date),
      end_marketing_date: end_marketing_date == null && nullToAbsent
          ? const Value.absent()
          : Value(end_marketing_date),
      marketing_category_name: marketing_category_name == null && nullToAbsent
          ? const Value.absent()
          : Value(marketing_category_name),
      application_number: application_number == null && nullToAbsent
          ? const Value.absent()
          : Value(application_number),
      labeler_name: labeler_name == null && nullToAbsent
          ? const Value.absent()
          : Value(labeler_name),
      substance_name: substance_name == null && nullToAbsent
          ? const Value.absent()
          : Value(substance_name),
      active_numerator_strength:
          active_numerator_strength == null && nullToAbsent
              ? const Value.absent()
              : Value(active_numerator_strength),
      active_ingred_unit: active_ingred_unit == null && nullToAbsent
          ? const Value.absent()
          : Value(active_ingred_unit),
      pharm_classes: pharm_classes == null && nullToAbsent
          ? const Value.absent()
          : Value(pharm_classes),
      dea_schedule: dea_schedule == null && nullToAbsent
          ? const Value.absent()
          : Value(dea_schedule),
      ndc_exclude_flag: ndc_exclude_flag == null && nullToAbsent
          ? const Value.absent()
          : Value(ndc_exclude_flag),
      listing_record_certified_through:
          listing_record_certified_through == null && nullToAbsent
              ? const Value.absent()
              : Value(listing_record_certified_through),
    );
  }

  NdcProduct copyWith(
          {String product_id,
          String product_ndc,
          String product_type_name,
          String proprietary_name,
          String proprietary_name_suffix,
          String non_proprietary_name,
          String dosage_form_name,
          String routename,
          String start_marketing_date,
          String end_marketing_date,
          String marketing_category_name,
          String application_number,
          String labeler_name,
          String substance_name,
          String active_numerator_strength,
          String active_ingred_unit,
          String pharm_classes,
          String dea_schedule,
          String ndc_exclude_flag,
          String listing_record_certified_through}) =>
      NdcProduct(
        product_id: product_id ?? this.product_id,
        product_ndc: product_ndc ?? this.product_ndc,
        product_type_name: product_type_name ?? this.product_type_name,
        proprietary_name: proprietary_name ?? this.proprietary_name,
        proprietary_name_suffix:
            proprietary_name_suffix ?? this.proprietary_name_suffix,
        non_proprietary_name: non_proprietary_name ?? this.non_proprietary_name,
        dosage_form_name: dosage_form_name ?? this.dosage_form_name,
        routename: routename ?? this.routename,
        start_marketing_date: start_marketing_date ?? this.start_marketing_date,
        end_marketing_date: end_marketing_date ?? this.end_marketing_date,
        marketing_category_name:
            marketing_category_name ?? this.marketing_category_name,
        application_number: application_number ?? this.application_number,
        labeler_name: labeler_name ?? this.labeler_name,
        substance_name: substance_name ?? this.substance_name,
        active_numerator_strength:
            active_numerator_strength ?? this.active_numerator_strength,
        active_ingred_unit: active_ingred_unit ?? this.active_ingred_unit,
        pharm_classes: pharm_classes ?? this.pharm_classes,
        dea_schedule: dea_schedule ?? this.dea_schedule,
        ndc_exclude_flag: ndc_exclude_flag ?? this.ndc_exclude_flag,
        listing_record_certified_through: listing_record_certified_through ??
            this.listing_record_certified_through,
      );
  @override
  String toString() {
    return (StringBuffer('NdcProduct(')
          ..write('product_id: $product_id, ')
          ..write('product_ndc: $product_ndc, ')
          ..write('product_type_name: $product_type_name, ')
          ..write('proprietary_name: $proprietary_name, ')
          ..write('proprietary_name_suffix: $proprietary_name_suffix, ')
          ..write('non_proprietary_name: $non_proprietary_name, ')
          ..write('dosage_form_name: $dosage_form_name, ')
          ..write('routename: $routename, ')
          ..write('start_marketing_date: $start_marketing_date, ')
          ..write('end_marketing_date: $end_marketing_date, ')
          ..write('marketing_category_name: $marketing_category_name, ')
          ..write('application_number: $application_number, ')
          ..write('labeler_name: $labeler_name, ')
          ..write('substance_name: $substance_name, ')
          ..write('active_numerator_strength: $active_numerator_strength, ')
          ..write('active_ingred_unit: $active_ingred_unit, ')
          ..write('pharm_classes: $pharm_classes, ')
          ..write('dea_schedule: $dea_schedule, ')
          ..write('ndc_exclude_flag: $ndc_exclude_flag, ')
          ..write(
              'listing_record_certified_through: $listing_record_certified_through')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      product_id.hashCode,
      $mrjc(
          product_ndc.hashCode,
          $mrjc(
              product_type_name.hashCode,
              $mrjc(
                  proprietary_name.hashCode,
                  $mrjc(
                      proprietary_name_suffix.hashCode,
                      $mrjc(
                          non_proprietary_name.hashCode,
                          $mrjc(
                              dosage_form_name.hashCode,
                              $mrjc(
                                  routename.hashCode,
                                  $mrjc(
                                      start_marketing_date.hashCode,
                                      $mrjc(
                                          end_marketing_date.hashCode,
                                          $mrjc(
                                              marketing_category_name.hashCode,
                                              $mrjc(
                                                  application_number.hashCode,
                                                  $mrjc(
                                                      labeler_name.hashCode,
                                                      $mrjc(
                                                          substance_name
                                                              .hashCode,
                                                          $mrjc(
                                                              active_numerator_strength
                                                                  .hashCode,
                                                              $mrjc(
                                                                  active_ingred_unit
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      pharm_classes
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          dea_schedule
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              ndc_exclude_flag.hashCode,
                                                                              listing_record_certified_through.hashCode))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NdcProduct &&
          other.product_id == this.product_id &&
          other.product_ndc == this.product_ndc &&
          other.product_type_name == this.product_type_name &&
          other.proprietary_name == this.proprietary_name &&
          other.proprietary_name_suffix == this.proprietary_name_suffix &&
          other.non_proprietary_name == this.non_proprietary_name &&
          other.dosage_form_name == this.dosage_form_name &&
          other.routename == this.routename &&
          other.start_marketing_date == this.start_marketing_date &&
          other.end_marketing_date == this.end_marketing_date &&
          other.marketing_category_name == this.marketing_category_name &&
          other.application_number == this.application_number &&
          other.labeler_name == this.labeler_name &&
          other.substance_name == this.substance_name &&
          other.active_numerator_strength == this.active_numerator_strength &&
          other.active_ingred_unit == this.active_ingred_unit &&
          other.pharm_classes == this.pharm_classes &&
          other.dea_schedule == this.dea_schedule &&
          other.ndc_exclude_flag == this.ndc_exclude_flag &&
          other.listing_record_certified_through ==
              this.listing_record_certified_through);
}

class NdcProductsCompanion extends UpdateCompanion<NdcProduct> {
  final Value<String> product_id;
  final Value<String> product_ndc;
  final Value<String> product_type_name;
  final Value<String> proprietary_name;
  final Value<String> proprietary_name_suffix;
  final Value<String> non_proprietary_name;
  final Value<String> dosage_form_name;
  final Value<String> routename;
  final Value<String> start_marketing_date;
  final Value<String> end_marketing_date;
  final Value<String> marketing_category_name;
  final Value<String> application_number;
  final Value<String> labeler_name;
  final Value<String> substance_name;
  final Value<String> active_numerator_strength;
  final Value<String> active_ingred_unit;
  final Value<String> pharm_classes;
  final Value<String> dea_schedule;
  final Value<String> ndc_exclude_flag;
  final Value<String> listing_record_certified_through;
  const NdcProductsCompanion({
    this.product_id = const Value.absent(),
    this.product_ndc = const Value.absent(),
    this.product_type_name = const Value.absent(),
    this.proprietary_name = const Value.absent(),
    this.proprietary_name_suffix = const Value.absent(),
    this.non_proprietary_name = const Value.absent(),
    this.dosage_form_name = const Value.absent(),
    this.routename = const Value.absent(),
    this.start_marketing_date = const Value.absent(),
    this.end_marketing_date = const Value.absent(),
    this.marketing_category_name = const Value.absent(),
    this.application_number = const Value.absent(),
    this.labeler_name = const Value.absent(),
    this.substance_name = const Value.absent(),
    this.active_numerator_strength = const Value.absent(),
    this.active_ingred_unit = const Value.absent(),
    this.pharm_classes = const Value.absent(),
    this.dea_schedule = const Value.absent(),
    this.ndc_exclude_flag = const Value.absent(),
    this.listing_record_certified_through = const Value.absent(),
  });
  NdcProductsCompanion.insert({
    @required String product_id,
    @required String product_ndc,
    @required String product_type_name,
    @required String proprietary_name,
    @required String proprietary_name_suffix,
    @required String non_proprietary_name,
    @required String dosage_form_name,
    @required String routename,
    @required String start_marketing_date,
    @required String end_marketing_date,
    @required String marketing_category_name,
    @required String application_number,
    @required String labeler_name,
    @required String substance_name,
    @required String active_numerator_strength,
    @required String active_ingred_unit,
    @required String pharm_classes,
    @required String dea_schedule,
    @required String ndc_exclude_flag,
    @required String listing_record_certified_through,
  })  : product_id = Value(product_id),
        product_ndc = Value(product_ndc),
        product_type_name = Value(product_type_name),
        proprietary_name = Value(proprietary_name),
        proprietary_name_suffix = Value(proprietary_name_suffix),
        non_proprietary_name = Value(non_proprietary_name),
        dosage_form_name = Value(dosage_form_name),
        routename = Value(routename),
        start_marketing_date = Value(start_marketing_date),
        end_marketing_date = Value(end_marketing_date),
        marketing_category_name = Value(marketing_category_name),
        application_number = Value(application_number),
        labeler_name = Value(labeler_name),
        substance_name = Value(substance_name),
        active_numerator_strength = Value(active_numerator_strength),
        active_ingred_unit = Value(active_ingred_unit),
        pharm_classes = Value(pharm_classes),
        dea_schedule = Value(dea_schedule),
        ndc_exclude_flag = Value(ndc_exclude_flag),
        listing_record_certified_through =
            Value(listing_record_certified_through);
  NdcProductsCompanion copyWith(
      {Value<String> product_id,
      Value<String> product_ndc,
      Value<String> product_type_name,
      Value<String> proprietary_name,
      Value<String> proprietary_name_suffix,
      Value<String> non_proprietary_name,
      Value<String> dosage_form_name,
      Value<String> routename,
      Value<String> start_marketing_date,
      Value<String> end_marketing_date,
      Value<String> marketing_category_name,
      Value<String> application_number,
      Value<String> labeler_name,
      Value<String> substance_name,
      Value<String> active_numerator_strength,
      Value<String> active_ingred_unit,
      Value<String> pharm_classes,
      Value<String> dea_schedule,
      Value<String> ndc_exclude_flag,
      Value<String> listing_record_certified_through}) {
    return NdcProductsCompanion(
      product_id: product_id ?? this.product_id,
      product_ndc: product_ndc ?? this.product_ndc,
      product_type_name: product_type_name ?? this.product_type_name,
      proprietary_name: proprietary_name ?? this.proprietary_name,
      proprietary_name_suffix:
          proprietary_name_suffix ?? this.proprietary_name_suffix,
      non_proprietary_name: non_proprietary_name ?? this.non_proprietary_name,
      dosage_form_name: dosage_form_name ?? this.dosage_form_name,
      routename: routename ?? this.routename,
      start_marketing_date: start_marketing_date ?? this.start_marketing_date,
      end_marketing_date: end_marketing_date ?? this.end_marketing_date,
      marketing_category_name:
          marketing_category_name ?? this.marketing_category_name,
      application_number: application_number ?? this.application_number,
      labeler_name: labeler_name ?? this.labeler_name,
      substance_name: substance_name ?? this.substance_name,
      active_numerator_strength:
          active_numerator_strength ?? this.active_numerator_strength,
      active_ingred_unit: active_ingred_unit ?? this.active_ingred_unit,
      pharm_classes: pharm_classes ?? this.pharm_classes,
      dea_schedule: dea_schedule ?? this.dea_schedule,
      ndc_exclude_flag: ndc_exclude_flag ?? this.ndc_exclude_flag,
      listing_record_certified_through: listing_record_certified_through ??
          this.listing_record_certified_through,
    );
  }
}

class $NdcProductsTable extends NdcProducts
    with TableInfo<$NdcProductsTable, NdcProduct> {
  final GeneratedDatabase _db;
  final String _alias;
  $NdcProductsTable(this._db, [this._alias]);
  final VerificationMeta _product_idMeta = const VerificationMeta('product_id');
  GeneratedTextColumn _product_id;
  @override
  GeneratedTextColumn get product_id => _product_id ??= _constructProductId();
  GeneratedTextColumn _constructProductId() {
    return GeneratedTextColumn('product_id', $tableName, false,
        minTextLength: 4, maxTextLength: 24);
  }

  final VerificationMeta _product_ndcMeta =
      const VerificationMeta('product_ndc');
  GeneratedTextColumn _product_ndc;
  @override
  GeneratedTextColumn get product_ndc =>
      _product_ndc ??= _constructProductNdc();
  GeneratedTextColumn _constructProductNdc() {
    return GeneratedTextColumn('product_ndc', $tableName, false,
        minTextLength: 4, maxTextLength: 16);
  }

  final VerificationMeta _product_type_nameMeta =
      const VerificationMeta('product_type_name');
  GeneratedTextColumn _product_type_name;
  @override
  GeneratedTextColumn get product_type_name =>
      _product_type_name ??= _constructProductTypeName();
  GeneratedTextColumn _constructProductTypeName() {
    return GeneratedTextColumn('product_type_name', $tableName, false,
        minTextLength: 4, maxTextLength: 32);
  }

  final VerificationMeta _proprietary_nameMeta =
      const VerificationMeta('proprietary_name');
  GeneratedTextColumn _proprietary_name;
  @override
  GeneratedTextColumn get proprietary_name =>
      _proprietary_name ??= _constructProprietaryName();
  GeneratedTextColumn _constructProprietaryName() {
    return GeneratedTextColumn('proprietary_name', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _proprietary_name_suffixMeta =
      const VerificationMeta('proprietary_name_suffix');
  GeneratedTextColumn _proprietary_name_suffix;
  @override
  GeneratedTextColumn get proprietary_name_suffix =>
      _proprietary_name_suffix ??= _constructProprietaryNameSuffix();
  GeneratedTextColumn _constructProprietaryNameSuffix() {
    return GeneratedTextColumn('proprietary_name_suffix', $tableName, false,
        minTextLength: 0, maxTextLength: 12);
  }

  final VerificationMeta _non_proprietary_nameMeta =
      const VerificationMeta('non_proprietary_name');
  GeneratedTextColumn _non_proprietary_name;
  @override
  GeneratedTextColumn get non_proprietary_name =>
      _non_proprietary_name ??= _constructNonProprietaryName();
  GeneratedTextColumn _constructNonProprietaryName() {
    return GeneratedTextColumn('non_proprietary_name', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _dosage_form_nameMeta =
      const VerificationMeta('dosage_form_name');
  GeneratedTextColumn _dosage_form_name;
  @override
  GeneratedTextColumn get dosage_form_name =>
      _dosage_form_name ??= _constructDosageFormName();
  GeneratedTextColumn _constructDosageFormName() {
    return GeneratedTextColumn('dosage_form_name', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _routenameMeta = const VerificationMeta('routename');
  GeneratedTextColumn _routename;
  @override
  GeneratedTextColumn get routename => _routename ??= _constructRoutename();
  GeneratedTextColumn _constructRoutename() {
    return GeneratedTextColumn('routename', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _start_marketing_dateMeta =
      const VerificationMeta('start_marketing_date');
  GeneratedTextColumn _start_marketing_date;
  @override
  GeneratedTextColumn get start_marketing_date =>
      _start_marketing_date ??= _constructStartMarketingDate();
  GeneratedTextColumn _constructStartMarketingDate() {
    return GeneratedTextColumn('start_marketing_date', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _end_marketing_dateMeta =
      const VerificationMeta('end_marketing_date');
  GeneratedTextColumn _end_marketing_date;
  @override
  GeneratedTextColumn get end_marketing_date =>
      _end_marketing_date ??= _constructEndMarketingDate();
  GeneratedTextColumn _constructEndMarketingDate() {
    return GeneratedTextColumn('end_marketing_date', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _marketing_category_nameMeta =
      const VerificationMeta('marketing_category_name');
  GeneratedTextColumn _marketing_category_name;
  @override
  GeneratedTextColumn get marketing_category_name =>
      _marketing_category_name ??= _constructMarketingCategoryName();
  GeneratedTextColumn _constructMarketingCategoryName() {
    return GeneratedTextColumn('marketing_category_name', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _application_numberMeta =
      const VerificationMeta('application_number');
  GeneratedTextColumn _application_number;
  @override
  GeneratedTextColumn get application_number =>
      _application_number ??= _constructApplicationNumber();
  GeneratedTextColumn _constructApplicationNumber() {
    return GeneratedTextColumn('application_number', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _labeler_nameMeta =
      const VerificationMeta('labeler_name');
  GeneratedTextColumn _labeler_name;
  @override
  GeneratedTextColumn get labeler_name =>
      _labeler_name ??= _constructLabelerName();
  GeneratedTextColumn _constructLabelerName() {
    return GeneratedTextColumn('labeler_name', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _substance_nameMeta =
      const VerificationMeta('substance_name');
  GeneratedTextColumn _substance_name;
  @override
  GeneratedTextColumn get substance_name =>
      _substance_name ??= _constructSubstanceName();
  GeneratedTextColumn _constructSubstanceName() {
    return GeneratedTextColumn('substance_name', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _active_numerator_strengthMeta =
      const VerificationMeta('active_numerator_strength');
  GeneratedTextColumn _active_numerator_strength;
  @override
  GeneratedTextColumn get active_numerator_strength =>
      _active_numerator_strength ??= _constructActiveNumeratorStrength();
  GeneratedTextColumn _constructActiveNumeratorStrength() {
    return GeneratedTextColumn('active_numerator_strength', $tableName, false,
        minTextLength: 0, maxTextLength: 12);
  }

  final VerificationMeta _active_ingred_unitMeta =
      const VerificationMeta('active_ingred_unit');
  GeneratedTextColumn _active_ingred_unit;
  @override
  GeneratedTextColumn get active_ingred_unit =>
      _active_ingred_unit ??= _constructActiveIngredUnit();
  GeneratedTextColumn _constructActiveIngredUnit() {
    return GeneratedTextColumn('active_ingred_unit', $tableName, false,
        minTextLength: 0, maxTextLength: 4);
  }

  final VerificationMeta _pharm_classesMeta =
      const VerificationMeta('pharm_classes');
  GeneratedTextColumn _pharm_classes;
  @override
  GeneratedTextColumn get pharm_classes =>
      _pharm_classes ??= _constructPharmClasses();
  GeneratedTextColumn _constructPharmClasses() {
    return GeneratedTextColumn('pharm_classes', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _dea_scheduleMeta =
      const VerificationMeta('dea_schedule');
  GeneratedTextColumn _dea_schedule;
  @override
  GeneratedTextColumn get dea_schedule =>
      _dea_schedule ??= _constructDeaSchedule();
  GeneratedTextColumn _constructDeaSchedule() {
    return GeneratedTextColumn('dea_schedule', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _ndc_exclude_flagMeta =
      const VerificationMeta('ndc_exclude_flag');
  GeneratedTextColumn _ndc_exclude_flag;
  @override
  GeneratedTextColumn get ndc_exclude_flag =>
      _ndc_exclude_flag ??= _constructNdcExcludeFlag();
  GeneratedTextColumn _constructNdcExcludeFlag() {
    return GeneratedTextColumn('ndc_exclude_flag', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _listing_record_certified_throughMeta =
      const VerificationMeta('listing_record_certified_through');
  GeneratedTextColumn _listing_record_certified_through;
  @override
  GeneratedTextColumn get listing_record_certified_through =>
      _listing_record_certified_through ??=
          _constructListingRecordCertifiedThrough();
  GeneratedTextColumn _constructListingRecordCertifiedThrough() {
    return GeneratedTextColumn(
        'listing_record_certified_through', $tableName, false,
        minTextLength: 0, maxTextLength: 64);
  }

  @override
  List<GeneratedColumn> get $columns => [
        product_id,
        product_ndc,
        product_type_name,
        proprietary_name,
        proprietary_name_suffix,
        non_proprietary_name,
        dosage_form_name,
        routename,
        start_marketing_date,
        end_marketing_date,
        marketing_category_name,
        application_number,
        labeler_name,
        substance_name,
        active_numerator_strength,
        active_ingred_unit,
        pharm_classes,
        dea_schedule,
        ndc_exclude_flag,
        listing_record_certified_through
      ];
  @override
  $NdcProductsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ndc_products';
  @override
  final String actualTableName = 'ndc_products';
  @override
  VerificationContext validateIntegrity(NdcProductsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.product_id.present) {
      context.handle(_product_idMeta,
          product_id.isAcceptableValue(d.product_id.value, _product_idMeta));
    } else if (isInserting) {
      context.missing(_product_idMeta);
    }
    if (d.product_ndc.present) {
      context.handle(_product_ndcMeta,
          product_ndc.isAcceptableValue(d.product_ndc.value, _product_ndcMeta));
    } else if (isInserting) {
      context.missing(_product_ndcMeta);
    }
    if (d.product_type_name.present) {
      context.handle(
          _product_type_nameMeta,
          product_type_name.isAcceptableValue(
              d.product_type_name.value, _product_type_nameMeta));
    } else if (isInserting) {
      context.missing(_product_type_nameMeta);
    }
    if (d.proprietary_name.present) {
      context.handle(
          _proprietary_nameMeta,
          proprietary_name.isAcceptableValue(
              d.proprietary_name.value, _proprietary_nameMeta));
    } else if (isInserting) {
      context.missing(_proprietary_nameMeta);
    }
    if (d.proprietary_name_suffix.present) {
      context.handle(
          _proprietary_name_suffixMeta,
          proprietary_name_suffix.isAcceptableValue(
              d.proprietary_name_suffix.value, _proprietary_name_suffixMeta));
    } else if (isInserting) {
      context.missing(_proprietary_name_suffixMeta);
    }
    if (d.non_proprietary_name.present) {
      context.handle(
          _non_proprietary_nameMeta,
          non_proprietary_name.isAcceptableValue(
              d.non_proprietary_name.value, _non_proprietary_nameMeta));
    } else if (isInserting) {
      context.missing(_non_proprietary_nameMeta);
    }
    if (d.dosage_form_name.present) {
      context.handle(
          _dosage_form_nameMeta,
          dosage_form_name.isAcceptableValue(
              d.dosage_form_name.value, _dosage_form_nameMeta));
    } else if (isInserting) {
      context.missing(_dosage_form_nameMeta);
    }
    if (d.routename.present) {
      context.handle(_routenameMeta,
          routename.isAcceptableValue(d.routename.value, _routenameMeta));
    } else if (isInserting) {
      context.missing(_routenameMeta);
    }
    if (d.start_marketing_date.present) {
      context.handle(
          _start_marketing_dateMeta,
          start_marketing_date.isAcceptableValue(
              d.start_marketing_date.value, _start_marketing_dateMeta));
    } else if (isInserting) {
      context.missing(_start_marketing_dateMeta);
    }
    if (d.end_marketing_date.present) {
      context.handle(
          _end_marketing_dateMeta,
          end_marketing_date.isAcceptableValue(
              d.end_marketing_date.value, _end_marketing_dateMeta));
    } else if (isInserting) {
      context.missing(_end_marketing_dateMeta);
    }
    if (d.marketing_category_name.present) {
      context.handle(
          _marketing_category_nameMeta,
          marketing_category_name.isAcceptableValue(
              d.marketing_category_name.value, _marketing_category_nameMeta));
    } else if (isInserting) {
      context.missing(_marketing_category_nameMeta);
    }
    if (d.application_number.present) {
      context.handle(
          _application_numberMeta,
          application_number.isAcceptableValue(
              d.application_number.value, _application_numberMeta));
    } else if (isInserting) {
      context.missing(_application_numberMeta);
    }
    if (d.labeler_name.present) {
      context.handle(
          _labeler_nameMeta,
          labeler_name.isAcceptableValue(
              d.labeler_name.value, _labeler_nameMeta));
    } else if (isInserting) {
      context.missing(_labeler_nameMeta);
    }
    if (d.substance_name.present) {
      context.handle(
          _substance_nameMeta,
          substance_name.isAcceptableValue(
              d.substance_name.value, _substance_nameMeta));
    } else if (isInserting) {
      context.missing(_substance_nameMeta);
    }
    if (d.active_numerator_strength.present) {
      context.handle(
          _active_numerator_strengthMeta,
          active_numerator_strength.isAcceptableValue(
              d.active_numerator_strength.value,
              _active_numerator_strengthMeta));
    } else if (isInserting) {
      context.missing(_active_numerator_strengthMeta);
    }
    if (d.active_ingred_unit.present) {
      context.handle(
          _active_ingred_unitMeta,
          active_ingred_unit.isAcceptableValue(
              d.active_ingred_unit.value, _active_ingred_unitMeta));
    } else if (isInserting) {
      context.missing(_active_ingred_unitMeta);
    }
    if (d.pharm_classes.present) {
      context.handle(
          _pharm_classesMeta,
          pharm_classes.isAcceptableValue(
              d.pharm_classes.value, _pharm_classesMeta));
    } else if (isInserting) {
      context.missing(_pharm_classesMeta);
    }
    if (d.dea_schedule.present) {
      context.handle(
          _dea_scheduleMeta,
          dea_schedule.isAcceptableValue(
              d.dea_schedule.value, _dea_scheduleMeta));
    } else if (isInserting) {
      context.missing(_dea_scheduleMeta);
    }
    if (d.ndc_exclude_flag.present) {
      context.handle(
          _ndc_exclude_flagMeta,
          ndc_exclude_flag.isAcceptableValue(
              d.ndc_exclude_flag.value, _ndc_exclude_flagMeta));
    } else if (isInserting) {
      context.missing(_ndc_exclude_flagMeta);
    }
    if (d.listing_record_certified_through.present) {
      context.handle(
          _listing_record_certified_throughMeta,
          listing_record_certified_through.isAcceptableValue(
              d.listing_record_certified_through.value,
              _listing_record_certified_throughMeta));
    } else if (isInserting) {
      context.missing(_listing_record_certified_throughMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NdcProduct map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NdcProduct.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(NdcProductsCompanion d) {
    final map = <String, Variable>{};
    if (d.product_id.present) {
      map['product_id'] = Variable<String, StringType>(d.product_id.value);
    }
    if (d.product_ndc.present) {
      map['product_ndc'] = Variable<String, StringType>(d.product_ndc.value);
    }
    if (d.product_type_name.present) {
      map['product_type_name'] =
          Variable<String, StringType>(d.product_type_name.value);
    }
    if (d.proprietary_name.present) {
      map['proprietary_name'] =
          Variable<String, StringType>(d.proprietary_name.value);
    }
    if (d.proprietary_name_suffix.present) {
      map['proprietary_name_suffix'] =
          Variable<String, StringType>(d.proprietary_name_suffix.value);
    }
    if (d.non_proprietary_name.present) {
      map['non_proprietary_name'] =
          Variable<String, StringType>(d.non_proprietary_name.value);
    }
    if (d.dosage_form_name.present) {
      map['dosage_form_name'] =
          Variable<String, StringType>(d.dosage_form_name.value);
    }
    if (d.routename.present) {
      map['routename'] = Variable<String, StringType>(d.routename.value);
    }
    if (d.start_marketing_date.present) {
      map['start_marketing_date'] =
          Variable<String, StringType>(d.start_marketing_date.value);
    }
    if (d.end_marketing_date.present) {
      map['end_marketing_date'] =
          Variable<String, StringType>(d.end_marketing_date.value);
    }
    if (d.marketing_category_name.present) {
      map['marketing_category_name'] =
          Variable<String, StringType>(d.marketing_category_name.value);
    }
    if (d.application_number.present) {
      map['application_number'] =
          Variable<String, StringType>(d.application_number.value);
    }
    if (d.labeler_name.present) {
      map['labeler_name'] = Variable<String, StringType>(d.labeler_name.value);
    }
    if (d.substance_name.present) {
      map['substance_name'] =
          Variable<String, StringType>(d.substance_name.value);
    }
    if (d.active_numerator_strength.present) {
      map['active_numerator_strength'] =
          Variable<String, StringType>(d.active_numerator_strength.value);
    }
    if (d.active_ingred_unit.present) {
      map['active_ingred_unit'] =
          Variable<String, StringType>(d.active_ingred_unit.value);
    }
    if (d.pharm_classes.present) {
      map['pharm_classes'] =
          Variable<String, StringType>(d.pharm_classes.value);
    }
    if (d.dea_schedule.present) {
      map['dea_schedule'] = Variable<String, StringType>(d.dea_schedule.value);
    }
    if (d.ndc_exclude_flag.present) {
      map['ndc_exclude_flag'] =
          Variable<String, StringType>(d.ndc_exclude_flag.value);
    }
    if (d.listing_record_certified_through.present) {
      map['listing_record_certified_through'] = Variable<String, StringType>(
          d.listing_record_certified_through.value);
    }
    return map;
  }

  @override
  $NdcProductsTable createAlias(String alias) {
    return $NdcProductsTable(_db, alias);
  }
}

abstract class _$NdcDatabase extends GeneratedDatabase {
  _$NdcDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NdcProductsTable _ndcProducts;
  $NdcProductsTable get ndcProducts => _ndcProducts ??= $NdcProductsTable(this);
  NdcDao _ndcDao;
  NdcDao get ndcDao => _ndcDao ??= NdcDao(this as NdcDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [ndcProducts];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MedicationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $MedicationsTable get medications => db.medications;
}
mixin _$NdcDaoMixin on DatabaseAccessor<NdcDatabase> {
  $NdcProductsTable get ndcProducts => db.ndcProducts;
}
mixin _$TaskDaoMixin on DatabaseAccessor<AppDatabase> {
  $TasksTable get tasks => db.tasks;
  $TagsTable get tags => db.tags;
}
mixin _$TagDaoMixin on DatabaseAccessor<AppDatabase> {
  $TagsTable get tags => db.tags;
}
