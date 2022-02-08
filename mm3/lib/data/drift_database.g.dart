// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Person extends DataClass implements Insertable<Person> {
  final String publicid;
  final String last_name;
  final String first_name;
  final DateTime created_on;
  Person(
      {required this.publicid,
      required this.last_name,
      required this.first_name,
      required this.created_on});
  factory Person.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Person(
      publicid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}publicid'])!,
      last_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name'])!,
      first_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name'])!,
      created_on: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_on'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['publicid'] = Variable<String>(publicid);
    map['last_name'] = Variable<String>(last_name);
    map['first_name'] = Variable<String>(first_name);
    map['created_on'] = Variable<DateTime>(created_on);
    return map;
  }

  PersonsCompanion toCompanion(bool nullToAbsent) {
    return PersonsCompanion(
      publicid: Value(publicid),
      last_name: Value(last_name),
      first_name: Value(first_name),
      created_on: Value(created_on),
    );
  }

  factory Person.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Person(
      publicid: serializer.fromJson<String>(json['publicid']),
      last_name: serializer.fromJson<String>(json['last_name']),
      first_name: serializer.fromJson<String>(json['first_name']),
      created_on: serializer.fromJson<DateTime>(json['created_on']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'publicid': serializer.toJson<String>(publicid),
      'last_name': serializer.toJson<String>(last_name),
      'first_name': serializer.toJson<String>(first_name),
      'created_on': serializer.toJson<DateTime>(created_on),
    };
  }

  Person copyWith(
          {String? publicid,
          String? last_name,
          String? first_name,
          DateTime? created_on}) =>
      Person(
        publicid: publicid ?? this.publicid,
        last_name: last_name ?? this.last_name,
        first_name: first_name ?? this.first_name,
        created_on: created_on ?? this.created_on,
      );
  @override
  String toString() {
    return (StringBuffer('Person(')
          ..write('publicid: $publicid, ')
          ..write('last_name: $last_name, ')
          ..write('first_name: $first_name, ')
          ..write('created_on: $created_on')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(publicid, last_name, first_name, created_on);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          other.publicid == this.publicid &&
          other.last_name == this.last_name &&
          other.first_name == this.first_name &&
          other.created_on == this.created_on);
}

class PersonsCompanion extends UpdateCompanion<Person> {
  final Value<String> publicid;
  final Value<String> last_name;
  final Value<String> first_name;
  final Value<DateTime> created_on;
  const PersonsCompanion({
    this.publicid = const Value.absent(),
    this.last_name = const Value.absent(),
    this.first_name = const Value.absent(),
    this.created_on = const Value.absent(),
  });
  PersonsCompanion.insert({
    this.publicid = const Value.absent(),
    required String last_name,
    required String first_name,
    this.created_on = const Value.absent(),
  })  : last_name = Value(last_name),
        first_name = Value(first_name);
  static Insertable<Person> custom({
    Expression<String>? publicid,
    Expression<String>? last_name,
    Expression<String>? first_name,
    Expression<DateTime>? created_on,
  }) {
    return RawValuesInsertable({
      if (publicid != null) 'publicid': publicid,
      if (last_name != null) 'last_name': last_name,
      if (first_name != null) 'first_name': first_name,
      if (created_on != null) 'created_on': created_on,
    });
  }

  PersonsCompanion copyWith(
      {Value<String>? publicid,
      Value<String>? last_name,
      Value<String>? first_name,
      Value<DateTime>? created_on}) {
    return PersonsCompanion(
      publicid: publicid ?? this.publicid,
      last_name: last_name ?? this.last_name,
      first_name: first_name ?? this.first_name,
      created_on: created_on ?? this.created_on,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (publicid.present) {
      map['publicid'] = Variable<String>(publicid.value);
    }
    if (last_name.present) {
      map['last_name'] = Variable<String>(last_name.value);
    }
    if (first_name.present) {
      map['first_name'] = Variable<String>(first_name.value);
    }
    if (created_on.present) {
      map['created_on'] = Variable<DateTime>(created_on.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonsCompanion(')
          ..write('publicid: $publicid, ')
          ..write('last_name: $last_name, ')
          ..write('first_name: $first_name, ')
          ..write('created_on: $created_on')
          ..write(')'))
        .toString();
  }
}

class $PersonsTable extends Persons with TableInfo<$PersonsTable, Person> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PersonsTable(this._db, [this._alias]);
  final VerificationMeta _publicidMeta = const VerificationMeta('publicid');
  @override
  late final GeneratedColumn<String?> publicid = GeneratedColumn<String?>(
      'publicid', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _last_nameMeta = const VerificationMeta('last_name');
  @override
  late final GeneratedColumn<String?> last_name = GeneratedColumn<String?>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _first_nameMeta = const VerificationMeta('first_name');
  @override
  late final GeneratedColumn<String?> first_name = GeneratedColumn<String?>(
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _created_onMeta = const VerificationMeta('created_on');
  @override
  late final GeneratedColumn<DateTime?> created_on = GeneratedColumn<DateTime?>(
      'created_on', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [publicid, last_name, first_name, created_on];
  @override
  String get aliasedName => _alias ?? 'persons';
  @override
  String get actualTableName => 'persons';
  @override
  VerificationContext validateIntegrity(Insertable<Person> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('publicid')) {
      context.handle(_publicidMeta,
          publicid.isAcceptableOrUnknown(data['publicid']!, _publicidMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_last_nameMeta,
          last_name.isAcceptableOrUnknown(data['last_name']!, _last_nameMeta));
    } else if (isInserting) {
      context.missing(_last_nameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
          _first_nameMeta,
          first_name.isAcceptableOrUnknown(
              data['first_name']!, _first_nameMeta));
    } else if (isInserting) {
      context.missing(_first_nameMeta);
    }
    if (data.containsKey('created_on')) {
      context.handle(
          _created_onMeta,
          created_on.isAcceptableOrUnknown(
              data['created_on']!, _created_onMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Person map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Person.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PersonsTable createAlias(String alias) {
    return $PersonsTable(_db, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final String publicid;
  final int? batch_number;
  final bool is_active;
  final bool is_prn;
  final String long_Name;
  final String short_name;
  final String directions;
  final String ndc_id;
  final String rx_number;
  final DateTime? rx_expire_date;
  final DateTime? fill_date;
  final double? fill_qty;
  final double? fill_days;
  final double? remaining_fill_avail;
  final double? safe_delay;
  final String barcode;
  final String manufacturer;
  final String manufacturer_batch;
  final DateTime? last_administered;
  Medication(
      {required this.publicid,
      this.batch_number,
      required this.is_active,
      required this.is_prn,
      required this.long_Name,
      required this.short_name,
      required this.directions,
      required this.ndc_id,
      required this.rx_number,
      this.rx_expire_date,
      this.fill_date,
      this.fill_qty,
      this.fill_days,
      this.remaining_fill_avail,
      this.safe_delay,
      required this.barcode,
      required this.manufacturer,
      required this.manufacturer_batch,
      this.last_administered});
  factory Medication.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Medication(
      publicid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}publicid'])!,
      batch_number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}batch_number']),
      is_active: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_active'])!,
      is_prn: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_prn'])!,
      long_Name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}long_name'])!,
      short_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}short_name'])!,
      directions: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}directions'])!,
      ndc_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ndc_id'])!,
      rx_number: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rx_number'])!,
      rx_expire_date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rx_expire_date']),
      fill_date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fill_date']),
      fill_qty: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fill_qty']),
      fill_days: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fill_days']),
      remaining_fill_avail: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}remaining_fill_avail']),
      safe_delay: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}safe_delay']),
      barcode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}barcode'])!,
      manufacturer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}manufacturer'])!,
      manufacturer_batch: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}manufacturer_batch'])!,
      last_administered: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_administered']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['publicid'] = Variable<String>(publicid);
    if (!nullToAbsent || batch_number != null) {
      map['batch_number'] = Variable<int?>(batch_number);
    }
    map['is_active'] = Variable<bool>(is_active);
    map['is_prn'] = Variable<bool>(is_prn);
    map['long_name'] = Variable<String>(long_Name);
    map['short_name'] = Variable<String>(short_name);
    map['directions'] = Variable<String>(directions);
    map['ndc_id'] = Variable<String>(ndc_id);
    map['rx_number'] = Variable<String>(rx_number);
    if (!nullToAbsent || rx_expire_date != null) {
      map['rx_expire_date'] = Variable<DateTime?>(rx_expire_date);
    }
    if (!nullToAbsent || fill_date != null) {
      map['fill_date'] = Variable<DateTime?>(fill_date);
    }
    if (!nullToAbsent || fill_qty != null) {
      map['fill_qty'] = Variable<double?>(fill_qty);
    }
    if (!nullToAbsent || fill_days != null) {
      map['fill_days'] = Variable<double?>(fill_days);
    }
    if (!nullToAbsent || remaining_fill_avail != null) {
      map['remaining_fill_avail'] = Variable<double?>(remaining_fill_avail);
    }
    if (!nullToAbsent || safe_delay != null) {
      map['safe_delay'] = Variable<double?>(safe_delay);
    }
    map['barcode'] = Variable<String>(barcode);
    map['manufacturer'] = Variable<String>(manufacturer);
    map['manufacturer_batch'] = Variable<String>(manufacturer_batch);
    if (!nullToAbsent || last_administered != null) {
      map['last_administered'] = Variable<DateTime?>(last_administered);
    }
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      publicid: Value(publicid),
      batch_number: batch_number == null && nullToAbsent
          ? const Value.absent()
          : Value(batch_number),
      is_active: Value(is_active),
      is_prn: Value(is_prn),
      long_Name: Value(long_Name),
      short_name: Value(short_name),
      directions: Value(directions),
      ndc_id: Value(ndc_id),
      rx_number: Value(rx_number),
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
      barcode: Value(barcode),
      manufacturer: Value(manufacturer),
      manufacturer_batch: Value(manufacturer_batch),
      last_administered: last_administered == null && nullToAbsent
          ? const Value.absent()
          : Value(last_administered),
    );
  }

  factory Medication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      publicid: serializer.fromJson<String>(json['publicid']),
      batch_number: serializer.fromJson<int?>(json['batch_number']),
      is_active: serializer.fromJson<bool>(json['is_active']),
      is_prn: serializer.fromJson<bool>(json['is_prn']),
      long_Name: serializer.fromJson<String>(json['long_Name']),
      short_name: serializer.fromJson<String>(json['short_name']),
      directions: serializer.fromJson<String>(json['directions']),
      ndc_id: serializer.fromJson<String>(json['ndc_id']),
      rx_number: serializer.fromJson<String>(json['rx_number']),
      rx_expire_date: serializer.fromJson<DateTime?>(json['rx_expire_date']),
      fill_date: serializer.fromJson<DateTime?>(json['fill_date']),
      fill_qty: serializer.fromJson<double?>(json['fill_qty']),
      fill_days: serializer.fromJson<double?>(json['fill_days']),
      remaining_fill_avail:
          serializer.fromJson<double?>(json['remaining_fill_avail']),
      safe_delay: serializer.fromJson<double?>(json['safe_delay']),
      barcode: serializer.fromJson<String>(json['barcode']),
      manufacturer: serializer.fromJson<String>(json['manufacturer']),
      manufacturer_batch:
          serializer.fromJson<String>(json['manufacturer_batch']),
      last_administered:
          serializer.fromJson<DateTime?>(json['last_administered']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'publicid': serializer.toJson<String>(publicid),
      'batch_number': serializer.toJson<int?>(batch_number),
      'is_active': serializer.toJson<bool>(is_active),
      'is_prn': serializer.toJson<bool>(is_prn),
      'long_Name': serializer.toJson<String>(long_Name),
      'short_name': serializer.toJson<String>(short_name),
      'directions': serializer.toJson<String>(directions),
      'ndc_id': serializer.toJson<String>(ndc_id),
      'rx_number': serializer.toJson<String>(rx_number),
      'rx_expire_date': serializer.toJson<DateTime?>(rx_expire_date),
      'fill_date': serializer.toJson<DateTime?>(fill_date),
      'fill_qty': serializer.toJson<double?>(fill_qty),
      'fill_days': serializer.toJson<double?>(fill_days),
      'remaining_fill_avail': serializer.toJson<double?>(remaining_fill_avail),
      'safe_delay': serializer.toJson<double?>(safe_delay),
      'barcode': serializer.toJson<String>(barcode),
      'manufacturer': serializer.toJson<String>(manufacturer),
      'manufacturer_batch': serializer.toJson<String>(manufacturer_batch),
      'last_administered': serializer.toJson<DateTime?>(last_administered),
    };
  }

  Medication copyWith(
          {String? publicid,
          int? batch_number,
          bool? is_active,
          bool? is_prn,
          String? long_Name,
          String? short_name,
          String? directions,
          String? ndc_id,
          String? rx_number,
          DateTime? rx_expire_date,
          DateTime? fill_date,
          double? fill_qty,
          double? fill_days,
          double? remaining_fill_avail,
          double? safe_delay,
          String? barcode,
          String? manufacturer,
          String? manufacturer_batch,
          DateTime? last_administered}) =>
      Medication(
        publicid: publicid ?? this.publicid,
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
          ..write('publicid: $publicid, ')
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
  int get hashCode => Object.hash(
      publicid,
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
      last_administered);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.publicid == this.publicid &&
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
  final Value<String> publicid;
  final Value<int?> batch_number;
  final Value<bool> is_active;
  final Value<bool> is_prn;
  final Value<String> long_Name;
  final Value<String> short_name;
  final Value<String> directions;
  final Value<String> ndc_id;
  final Value<String> rx_number;
  final Value<DateTime?> rx_expire_date;
  final Value<DateTime?> fill_date;
  final Value<double?> fill_qty;
  final Value<double?> fill_days;
  final Value<double?> remaining_fill_avail;
  final Value<double?> safe_delay;
  final Value<String> barcode;
  final Value<String> manufacturer;
  final Value<String> manufacturer_batch;
  final Value<DateTime?> last_administered;
  const MedicationsCompanion({
    this.publicid = const Value.absent(),
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
    this.publicid = const Value.absent(),
    this.batch_number = const Value.absent(),
    required bool is_active,
    required bool is_prn,
    required String long_Name,
    required String short_name,
    required String directions,
    required String ndc_id,
    required String rx_number,
    this.rx_expire_date = const Value.absent(),
    this.fill_date = const Value.absent(),
    this.fill_qty = const Value.absent(),
    this.fill_days = const Value.absent(),
    this.remaining_fill_avail = const Value.absent(),
    this.safe_delay = const Value.absent(),
    required String barcode,
    required String manufacturer,
    required String manufacturer_batch,
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
  static Insertable<Medication> custom({
    Expression<String>? publicid,
    Expression<int?>? batch_number,
    Expression<bool>? is_active,
    Expression<bool>? is_prn,
    Expression<String>? long_Name,
    Expression<String>? short_name,
    Expression<String>? directions,
    Expression<String>? ndc_id,
    Expression<String>? rx_number,
    Expression<DateTime?>? rx_expire_date,
    Expression<DateTime?>? fill_date,
    Expression<double?>? fill_qty,
    Expression<double?>? fill_days,
    Expression<double?>? remaining_fill_avail,
    Expression<double?>? safe_delay,
    Expression<String>? barcode,
    Expression<String>? manufacturer,
    Expression<String>? manufacturer_batch,
    Expression<DateTime?>? last_administered,
  }) {
    return RawValuesInsertable({
      if (publicid != null) 'publicid': publicid,
      if (batch_number != null) 'batch_number': batch_number,
      if (is_active != null) 'is_active': is_active,
      if (is_prn != null) 'is_prn': is_prn,
      if (long_Name != null) 'long_name': long_Name,
      if (short_name != null) 'short_name': short_name,
      if (directions != null) 'directions': directions,
      if (ndc_id != null) 'ndc_id': ndc_id,
      if (rx_number != null) 'rx_number': rx_number,
      if (rx_expire_date != null) 'rx_expire_date': rx_expire_date,
      if (fill_date != null) 'fill_date': fill_date,
      if (fill_qty != null) 'fill_qty': fill_qty,
      if (fill_days != null) 'fill_days': fill_days,
      if (remaining_fill_avail != null)
        'remaining_fill_avail': remaining_fill_avail,
      if (safe_delay != null) 'safe_delay': safe_delay,
      if (barcode != null) 'barcode': barcode,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (manufacturer_batch != null) 'manufacturer_batch': manufacturer_batch,
      if (last_administered != null) 'last_administered': last_administered,
    });
  }

  MedicationsCompanion copyWith(
      {Value<String>? publicid,
      Value<int?>? batch_number,
      Value<bool>? is_active,
      Value<bool>? is_prn,
      Value<String>? long_Name,
      Value<String>? short_name,
      Value<String>? directions,
      Value<String>? ndc_id,
      Value<String>? rx_number,
      Value<DateTime?>? rx_expire_date,
      Value<DateTime?>? fill_date,
      Value<double?>? fill_qty,
      Value<double?>? fill_days,
      Value<double?>? remaining_fill_avail,
      Value<double?>? safe_delay,
      Value<String>? barcode,
      Value<String>? manufacturer,
      Value<String>? manufacturer_batch,
      Value<DateTime?>? last_administered}) {
    return MedicationsCompanion(
      publicid: publicid ?? this.publicid,
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (publicid.present) {
      map['publicid'] = Variable<String>(publicid.value);
    }
    if (batch_number.present) {
      map['batch_number'] = Variable<int?>(batch_number.value);
    }
    if (is_active.present) {
      map['is_active'] = Variable<bool>(is_active.value);
    }
    if (is_prn.present) {
      map['is_prn'] = Variable<bool>(is_prn.value);
    }
    if (long_Name.present) {
      map['long_name'] = Variable<String>(long_Name.value);
    }
    if (short_name.present) {
      map['short_name'] = Variable<String>(short_name.value);
    }
    if (directions.present) {
      map['directions'] = Variable<String>(directions.value);
    }
    if (ndc_id.present) {
      map['ndc_id'] = Variable<String>(ndc_id.value);
    }
    if (rx_number.present) {
      map['rx_number'] = Variable<String>(rx_number.value);
    }
    if (rx_expire_date.present) {
      map['rx_expire_date'] = Variable<DateTime?>(rx_expire_date.value);
    }
    if (fill_date.present) {
      map['fill_date'] = Variable<DateTime?>(fill_date.value);
    }
    if (fill_qty.present) {
      map['fill_qty'] = Variable<double?>(fill_qty.value);
    }
    if (fill_days.present) {
      map['fill_days'] = Variable<double?>(fill_days.value);
    }
    if (remaining_fill_avail.present) {
      map['remaining_fill_avail'] =
          Variable<double?>(remaining_fill_avail.value);
    }
    if (safe_delay.present) {
      map['safe_delay'] = Variable<double?>(safe_delay.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (manufacturer.present) {
      map['manufacturer'] = Variable<String>(manufacturer.value);
    }
    if (manufacturer_batch.present) {
      map['manufacturer_batch'] = Variable<String>(manufacturer_batch.value);
    }
    if (last_administered.present) {
      map['last_administered'] = Variable<DateTime?>(last_administered.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('publicid: $publicid, ')
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
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MedicationsTable(this._db, [this._alias]);
  final VerificationMeta _publicidMeta = const VerificationMeta('publicid');
  @override
  late final GeneratedColumn<String?> publicid = GeneratedColumn<String?>(
      'publicid', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _batch_numberMeta =
      const VerificationMeta('batch_number');
  @override
  late final GeneratedColumn<int?> batch_number = GeneratedColumn<int?>(
      'batch_number', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _is_activeMeta = const VerificationMeta('is_active');
  @override
  late final GeneratedColumn<bool?> is_active = GeneratedColumn<bool?>(
      'is_active', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_active IN (0, 1))');
  final VerificationMeta _is_prnMeta = const VerificationMeta('is_prn');
  @override
  late final GeneratedColumn<bool?> is_prn = GeneratedColumn<bool?>(
      'is_prn', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_prn IN (0, 1))');
  final VerificationMeta _long_NameMeta = const VerificationMeta('long_Name');
  @override
  late final GeneratedColumn<String?> long_Name = GeneratedColumn<String?>(
      'long_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 256),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _short_nameMeta = const VerificationMeta('short_name');
  @override
  late final GeneratedColumn<String?> short_name = GeneratedColumn<String?>(
      'short_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _directionsMeta = const VerificationMeta('directions');
  @override
  late final GeneratedColumn<String?> directions = GeneratedColumn<String?>(
      'directions', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 4096),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _ndc_idMeta = const VerificationMeta('ndc_id');
  @override
  late final GeneratedColumn<String?> ndc_id = GeneratedColumn<String?>(
      'ndc_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 24),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _rx_numberMeta = const VerificationMeta('rx_number');
  @override
  late final GeneratedColumn<String?> rx_number = GeneratedColumn<String?>(
      'rx_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 24),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _rx_expire_dateMeta =
      const VerificationMeta('rx_expire_date');
  @override
  late final GeneratedColumn<DateTime?> rx_expire_date =
      GeneratedColumn<DateTime?>('rx_expire_date', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _fill_dateMeta = const VerificationMeta('fill_date');
  @override
  late final GeneratedColumn<DateTime?> fill_date = GeneratedColumn<DateTime?>(
      'fill_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _fill_qtyMeta = const VerificationMeta('fill_qty');
  @override
  late final GeneratedColumn<double?> fill_qty = GeneratedColumn<double?>(
      'fill_qty', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _fill_daysMeta = const VerificationMeta('fill_days');
  @override
  late final GeneratedColumn<double?> fill_days = GeneratedColumn<double?>(
      'fill_days', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _remaining_fill_availMeta =
      const VerificationMeta('remaining_fill_avail');
  @override
  late final GeneratedColumn<double?> remaining_fill_avail =
      GeneratedColumn<double?>('remaining_fill_avail', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _safe_delayMeta = const VerificationMeta('safe_delay');
  @override
  late final GeneratedColumn<double?> safe_delay = GeneratedColumn<double?>(
      'safe_delay', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String?> barcode = GeneratedColumn<String?>(
      'barcode', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _manufacturerMeta =
      const VerificationMeta('manufacturer');
  @override
  late final GeneratedColumn<String?> manufacturer = GeneratedColumn<String?>(
      'manufacturer', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _manufacturer_batchMeta =
      const VerificationMeta('manufacturer_batch');
  @override
  late final GeneratedColumn<String?> manufacturer_batch =
      GeneratedColumn<String?>(
          'manufacturer_batch', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 16),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _last_administeredMeta =
      const VerificationMeta('last_administered');
  @override
  late final GeneratedColumn<DateTime?> last_administered =
      GeneratedColumn<DateTime?>('last_administered', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        publicid,
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
  String get aliasedName => _alias ?? 'medications';
  @override
  String get actualTableName => 'medications';
  @override
  VerificationContext validateIntegrity(Insertable<Medication> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('publicid')) {
      context.handle(_publicidMeta,
          publicid.isAcceptableOrUnknown(data['publicid']!, _publicidMeta));
    }
    if (data.containsKey('batch_number')) {
      context.handle(
          _batch_numberMeta,
          batch_number.isAcceptableOrUnknown(
              data['batch_number']!, _batch_numberMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_is_activeMeta,
          is_active.isAcceptableOrUnknown(data['is_active']!, _is_activeMeta));
    } else if (isInserting) {
      context.missing(_is_activeMeta);
    }
    if (data.containsKey('is_prn')) {
      context.handle(_is_prnMeta,
          is_prn.isAcceptableOrUnknown(data['is_prn']!, _is_prnMeta));
    } else if (isInserting) {
      context.missing(_is_prnMeta);
    }
    if (data.containsKey('long_name')) {
      context.handle(_long_NameMeta,
          long_Name.isAcceptableOrUnknown(data['long_name']!, _long_NameMeta));
    } else if (isInserting) {
      context.missing(_long_NameMeta);
    }
    if (data.containsKey('short_name')) {
      context.handle(
          _short_nameMeta,
          short_name.isAcceptableOrUnknown(
              data['short_name']!, _short_nameMeta));
    } else if (isInserting) {
      context.missing(_short_nameMeta);
    }
    if (data.containsKey('directions')) {
      context.handle(
          _directionsMeta,
          directions.isAcceptableOrUnknown(
              data['directions']!, _directionsMeta));
    } else if (isInserting) {
      context.missing(_directionsMeta);
    }
    if (data.containsKey('ndc_id')) {
      context.handle(_ndc_idMeta,
          ndc_id.isAcceptableOrUnknown(data['ndc_id']!, _ndc_idMeta));
    } else if (isInserting) {
      context.missing(_ndc_idMeta);
    }
    if (data.containsKey('rx_number')) {
      context.handle(_rx_numberMeta,
          rx_number.isAcceptableOrUnknown(data['rx_number']!, _rx_numberMeta));
    } else if (isInserting) {
      context.missing(_rx_numberMeta);
    }
    if (data.containsKey('rx_expire_date')) {
      context.handle(
          _rx_expire_dateMeta,
          rx_expire_date.isAcceptableOrUnknown(
              data['rx_expire_date']!, _rx_expire_dateMeta));
    }
    if (data.containsKey('fill_date')) {
      context.handle(_fill_dateMeta,
          fill_date.isAcceptableOrUnknown(data['fill_date']!, _fill_dateMeta));
    }
    if (data.containsKey('fill_qty')) {
      context.handle(_fill_qtyMeta,
          fill_qty.isAcceptableOrUnknown(data['fill_qty']!, _fill_qtyMeta));
    }
    if (data.containsKey('fill_days')) {
      context.handle(_fill_daysMeta,
          fill_days.isAcceptableOrUnknown(data['fill_days']!, _fill_daysMeta));
    }
    if (data.containsKey('remaining_fill_avail')) {
      context.handle(
          _remaining_fill_availMeta,
          remaining_fill_avail.isAcceptableOrUnknown(
              data['remaining_fill_avail']!, _remaining_fill_availMeta));
    }
    if (data.containsKey('safe_delay')) {
      context.handle(
          _safe_delayMeta,
          safe_delay.isAcceptableOrUnknown(
              data['safe_delay']!, _safe_delayMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('manufacturer')) {
      context.handle(
          _manufacturerMeta,
          manufacturer.isAcceptableOrUnknown(
              data['manufacturer']!, _manufacturerMeta));
    } else if (isInserting) {
      context.missing(_manufacturerMeta);
    }
    if (data.containsKey('manufacturer_batch')) {
      context.handle(
          _manufacturer_batchMeta,
          manufacturer_batch.isAcceptableOrUnknown(
              data['manufacturer_batch']!, _manufacturer_batchMeta));
    } else if (isInserting) {
      context.missing(_manufacturer_batchMeta);
    }
    if (data.containsKey('last_administered')) {
      context.handle(
          _last_administeredMeta,
          last_administered.isAcceptableOrUnknown(
              data['last_administered']!, _last_administeredMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {publicid};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Medication.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(_db, alias);
  }
}

class ChartEvent extends DataClass implements Insertable<ChartEvent> {
  final String id;
  final String? medication_id;
  final double? medication_qty;
  final String qty_units;
  final String event_description;
  final String event_short_desc;
  final DateTime event_dtm;
  ChartEvent(
      {required this.id,
      this.medication_id,
      this.medication_qty,
      required this.qty_units,
      required this.event_description,
      required this.event_short_desc,
      required this.event_dtm});
  factory ChartEvent.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChartEvent(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      medication_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}medication_id']),
      medication_qty: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}medication_qty']),
      qty_units: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qty_units'])!,
      event_description: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}event_description'])!,
      event_short_desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_short_desc'])!,
      event_dtm: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_dtm'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || medication_id != null) {
      map['medication_id'] = Variable<String?>(medication_id);
    }
    if (!nullToAbsent || medication_qty != null) {
      map['medication_qty'] = Variable<double?>(medication_qty);
    }
    map['qty_units'] = Variable<String>(qty_units);
    map['event_description'] = Variable<String>(event_description);
    map['event_short_desc'] = Variable<String>(event_short_desc);
    map['event_dtm'] = Variable<DateTime>(event_dtm);
    return map;
  }

  ChartEventsCompanion toCompanion(bool nullToAbsent) {
    return ChartEventsCompanion(
      id: Value(id),
      medication_id: medication_id == null && nullToAbsent
          ? const Value.absent()
          : Value(medication_id),
      medication_qty: medication_qty == null && nullToAbsent
          ? const Value.absent()
          : Value(medication_qty),
      qty_units: Value(qty_units),
      event_description: Value(event_description),
      event_short_desc: Value(event_short_desc),
      event_dtm: Value(event_dtm),
    );
  }

  factory ChartEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChartEvent(
      id: serializer.fromJson<String>(json['id']),
      medication_id: serializer.fromJson<String?>(json['medication_id']),
      medication_qty: serializer.fromJson<double?>(json['medication_qty']),
      qty_units: serializer.fromJson<String>(json['qty_units']),
      event_description: serializer.fromJson<String>(json['event_description']),
      event_short_desc: serializer.fromJson<String>(json['event_short_desc']),
      event_dtm: serializer.fromJson<DateTime>(json['event_dtm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medication_id': serializer.toJson<String?>(medication_id),
      'medication_qty': serializer.toJson<double?>(medication_qty),
      'qty_units': serializer.toJson<String>(qty_units),
      'event_description': serializer.toJson<String>(event_description),
      'event_short_desc': serializer.toJson<String>(event_short_desc),
      'event_dtm': serializer.toJson<DateTime>(event_dtm),
    };
  }

  ChartEvent copyWith(
          {String? id,
          String? medication_id,
          double? medication_qty,
          String? qty_units,
          String? event_description,
          String? event_short_desc,
          DateTime? event_dtm}) =>
      ChartEvent(
        id: id ?? this.id,
        medication_id: medication_id ?? this.medication_id,
        medication_qty: medication_qty ?? this.medication_qty,
        qty_units: qty_units ?? this.qty_units,
        event_description: event_description ?? this.event_description,
        event_short_desc: event_short_desc ?? this.event_short_desc,
        event_dtm: event_dtm ?? this.event_dtm,
      );
  @override
  String toString() {
    return (StringBuffer('ChartEvent(')
          ..write('id: $id, ')
          ..write('medication_id: $medication_id, ')
          ..write('medication_qty: $medication_qty, ')
          ..write('qty_units: $qty_units, ')
          ..write('event_description: $event_description, ')
          ..write('event_short_desc: $event_short_desc, ')
          ..write('event_dtm: $event_dtm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medication_id, medication_qty, qty_units,
      event_description, event_short_desc, event_dtm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChartEvent &&
          other.id == this.id &&
          other.medication_id == this.medication_id &&
          other.medication_qty == this.medication_qty &&
          other.qty_units == this.qty_units &&
          other.event_description == this.event_description &&
          other.event_short_desc == this.event_short_desc &&
          other.event_dtm == this.event_dtm);
}

class ChartEventsCompanion extends UpdateCompanion<ChartEvent> {
  final Value<String> id;
  final Value<String?> medication_id;
  final Value<double?> medication_qty;
  final Value<String> qty_units;
  final Value<String> event_description;
  final Value<String> event_short_desc;
  final Value<DateTime> event_dtm;
  const ChartEventsCompanion({
    this.id = const Value.absent(),
    this.medication_id = const Value.absent(),
    this.medication_qty = const Value.absent(),
    this.qty_units = const Value.absent(),
    this.event_description = const Value.absent(),
    this.event_short_desc = const Value.absent(),
    this.event_dtm = const Value.absent(),
  });
  ChartEventsCompanion.insert({
    this.id = const Value.absent(),
    this.medication_id = const Value.absent(),
    this.medication_qty = const Value.absent(),
    required String qty_units,
    required String event_description,
    required String event_short_desc,
    this.event_dtm = const Value.absent(),
  })  : qty_units = Value(qty_units),
        event_description = Value(event_description),
        event_short_desc = Value(event_short_desc);
  static Insertable<ChartEvent> custom({
    Expression<String>? id,
    Expression<String?>? medication_id,
    Expression<double?>? medication_qty,
    Expression<String>? qty_units,
    Expression<String>? event_description,
    Expression<String>? event_short_desc,
    Expression<DateTime>? event_dtm,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medication_id != null) 'medication_id': medication_id,
      if (medication_qty != null) 'medication_qty': medication_qty,
      if (qty_units != null) 'qty_units': qty_units,
      if (event_description != null) 'event_description': event_description,
      if (event_short_desc != null) 'event_short_desc': event_short_desc,
      if (event_dtm != null) 'event_dtm': event_dtm,
    });
  }

  ChartEventsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? medication_id,
      Value<double?>? medication_qty,
      Value<String>? qty_units,
      Value<String>? event_description,
      Value<String>? event_short_desc,
      Value<DateTime>? event_dtm}) {
    return ChartEventsCompanion(
      id: id ?? this.id,
      medication_id: medication_id ?? this.medication_id,
      medication_qty: medication_qty ?? this.medication_qty,
      qty_units: qty_units ?? this.qty_units,
      event_description: event_description ?? this.event_description,
      event_short_desc: event_short_desc ?? this.event_short_desc,
      event_dtm: event_dtm ?? this.event_dtm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medication_id.present) {
      map['medication_id'] = Variable<String?>(medication_id.value);
    }
    if (medication_qty.present) {
      map['medication_qty'] = Variable<double?>(medication_qty.value);
    }
    if (qty_units.present) {
      map['qty_units'] = Variable<String>(qty_units.value);
    }
    if (event_description.present) {
      map['event_description'] = Variable<String>(event_description.value);
    }
    if (event_short_desc.present) {
      map['event_short_desc'] = Variable<String>(event_short_desc.value);
    }
    if (event_dtm.present) {
      map['event_dtm'] = Variable<DateTime>(event_dtm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChartEventsCompanion(')
          ..write('id: $id, ')
          ..write('medication_id: $medication_id, ')
          ..write('medication_qty: $medication_qty, ')
          ..write('qty_units: $qty_units, ')
          ..write('event_description: $event_description, ')
          ..write('event_short_desc: $event_short_desc, ')
          ..write('event_dtm: $event_dtm')
          ..write(')'))
        .toString();
  }
}

class $ChartEventsTable extends ChartEvents
    with TableInfo<$ChartEventsTable, ChartEvent> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ChartEventsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _medication_idMeta =
      const VerificationMeta('medication_id');
  @override
  late final GeneratedColumn<String?> medication_id = GeneratedColumn<String?>(
      'medication_id', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES medications(id)');
  final VerificationMeta _medication_qtyMeta =
      const VerificationMeta('medication_qty');
  @override
  late final GeneratedColumn<double?> medication_qty = GeneratedColumn<double?>(
      'medication_qty', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _qty_unitsMeta = const VerificationMeta('qty_units');
  @override
  late final GeneratedColumn<String?> qty_units = GeneratedColumn<String?>(
      'qty_units', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 12),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _event_descriptionMeta =
      const VerificationMeta('event_description');
  @override
  late final GeneratedColumn<String?> event_description =
      GeneratedColumn<String?>('event_description', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 8192),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _event_short_descMeta =
      const VerificationMeta('event_short_desc');
  @override
  late final GeneratedColumn<String?> event_short_desc =
      GeneratedColumn<String?>('event_short_desc', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 80),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _event_dtmMeta = const VerificationMeta('event_dtm');
  @override
  late final GeneratedColumn<DateTime?> event_dtm = GeneratedColumn<DateTime?>(
      'event_dtm', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        medication_id,
        medication_qty,
        qty_units,
        event_description,
        event_short_desc,
        event_dtm
      ];
  @override
  String get aliasedName => _alias ?? 'chart_events';
  @override
  String get actualTableName => 'chart_events';
  @override
  VerificationContext validateIntegrity(Insertable<ChartEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medication_idMeta,
          medication_id.isAcceptableOrUnknown(
              data['medication_id']!, _medication_idMeta));
    }
    if (data.containsKey('medication_qty')) {
      context.handle(
          _medication_qtyMeta,
          medication_qty.isAcceptableOrUnknown(
              data['medication_qty']!, _medication_qtyMeta));
    }
    if (data.containsKey('qty_units')) {
      context.handle(_qty_unitsMeta,
          qty_units.isAcceptableOrUnknown(data['qty_units']!, _qty_unitsMeta));
    } else if (isInserting) {
      context.missing(_qty_unitsMeta);
    }
    if (data.containsKey('event_description')) {
      context.handle(
          _event_descriptionMeta,
          event_description.isAcceptableOrUnknown(
              data['event_description']!, _event_descriptionMeta));
    } else if (isInserting) {
      context.missing(_event_descriptionMeta);
    }
    if (data.containsKey('event_short_desc')) {
      context.handle(
          _event_short_descMeta,
          event_short_desc.isAcceptableOrUnknown(
              data['event_short_desc']!, _event_short_descMeta));
    } else if (isInserting) {
      context.missing(_event_short_descMeta);
    }
    if (data.containsKey('event_dtm')) {
      context.handle(_event_dtmMeta,
          event_dtm.isAcceptableOrUnknown(data['event_dtm']!, _event_dtmMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ChartEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChartEvent.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChartEventsTable createAlias(String alias) {
    return $ChartEventsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PersonsTable persons = $PersonsTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $ChartEventsTable chartEvents = $ChartEventsTable(this);
  late final ChartEventsDao chartEventsDao =
      ChartEventsDao(this as AppDatabase);
  late final MedicationsDao medicationsDao =
      MedicationsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [persons, medications, chartEvents];
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
      {required this.product_id,
      required this.product_ndc,
      required this.product_type_name,
      required this.proprietary_name,
      required this.proprietary_name_suffix,
      required this.non_proprietary_name,
      required this.dosage_form_name,
      required this.routename,
      required this.start_marketing_date,
      required this.end_marketing_date,
      required this.marketing_category_name,
      required this.application_number,
      required this.labeler_name,
      required this.substance_name,
      required this.active_numerator_strength,
      required this.active_ingred_unit,
      required this.pharm_classes,
      required this.dea_schedule,
      required this.ndc_exclude_flag,
      required this.listing_record_certified_through});
  factory NdcProduct.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NdcProduct(
      product_id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id'])!,
      product_ndc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_ndc'])!,
      product_type_name: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}product_type_name'])!,
      proprietary_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}proprietary_name'])!,
      proprietary_name_suffix: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}proprietary_name_suffix'])!,
      non_proprietary_name: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}non_proprietary_name'])!,
      dosage_form_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dosage_form_name'])!,
      routename: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}routename'])!,
      start_marketing_date: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}start_marketing_date'])!,
      end_marketing_date: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}end_marketing_date'])!,
      marketing_category_name: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}marketing_category_name'])!,
      application_number: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}application_number'])!,
      labeler_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}labeler_name'])!,
      substance_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}substance_name'])!,
      active_numerator_strength: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}active_numerator_strength'])!,
      active_ingred_unit: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}active_ingred_unit'])!,
      pharm_classes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pharm_classes'])!,
      dea_schedule: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dea_schedule'])!,
      ndc_exclude_flag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ndc_exclude_flag'])!,
      listing_record_certified_through: const StringType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}listing_record_certified_through'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(product_id);
    map['product_ndc'] = Variable<String>(product_ndc);
    map['product_type_name'] = Variable<String>(product_type_name);
    map['proprietary_name'] = Variable<String>(proprietary_name);
    map['proprietary_name_suffix'] = Variable<String>(proprietary_name_suffix);
    map['non_proprietary_name'] = Variable<String>(non_proprietary_name);
    map['dosage_form_name'] = Variable<String>(dosage_form_name);
    map['routename'] = Variable<String>(routename);
    map['start_marketing_date'] = Variable<String>(start_marketing_date);
    map['end_marketing_date'] = Variable<String>(end_marketing_date);
    map['marketing_category_name'] = Variable<String>(marketing_category_name);
    map['application_number'] = Variable<String>(application_number);
    map['labeler_name'] = Variable<String>(labeler_name);
    map['substance_name'] = Variable<String>(substance_name);
    map['active_numerator_strength'] =
        Variable<String>(active_numerator_strength);
    map['active_ingred_unit'] = Variable<String>(active_ingred_unit);
    map['pharm_classes'] = Variable<String>(pharm_classes);
    map['dea_schedule'] = Variable<String>(dea_schedule);
    map['ndc_exclude_flag'] = Variable<String>(ndc_exclude_flag);
    map['listing_record_certified_through'] =
        Variable<String>(listing_record_certified_through);
    return map;
  }

  NdcProductsCompanion toCompanion(bool nullToAbsent) {
    return NdcProductsCompanion(
      product_id: Value(product_id),
      product_ndc: Value(product_ndc),
      product_type_name: Value(product_type_name),
      proprietary_name: Value(proprietary_name),
      proprietary_name_suffix: Value(proprietary_name_suffix),
      non_proprietary_name: Value(non_proprietary_name),
      dosage_form_name: Value(dosage_form_name),
      routename: Value(routename),
      start_marketing_date: Value(start_marketing_date),
      end_marketing_date: Value(end_marketing_date),
      marketing_category_name: Value(marketing_category_name),
      application_number: Value(application_number),
      labeler_name: Value(labeler_name),
      substance_name: Value(substance_name),
      active_numerator_strength: Value(active_numerator_strength),
      active_ingred_unit: Value(active_ingred_unit),
      pharm_classes: Value(pharm_classes),
      dea_schedule: Value(dea_schedule),
      ndc_exclude_flag: Value(ndc_exclude_flag),
      listing_record_certified_through: Value(listing_record_certified_through),
    );
  }

  factory NdcProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
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

  NdcProduct copyWith(
          {String? product_id,
          String? product_ndc,
          String? product_type_name,
          String? proprietary_name,
          String? proprietary_name_suffix,
          String? non_proprietary_name,
          String? dosage_form_name,
          String? routename,
          String? start_marketing_date,
          String? end_marketing_date,
          String? marketing_category_name,
          String? application_number,
          String? labeler_name,
          String? substance_name,
          String? active_numerator_strength,
          String? active_ingred_unit,
          String? pharm_classes,
          String? dea_schedule,
          String? ndc_exclude_flag,
          String? listing_record_certified_through}) =>
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
  int get hashCode => Object.hash(
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
      listing_record_certified_through);
  @override
  bool operator ==(Object other) =>
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
    required String product_id,
    required String product_ndc,
    required String product_type_name,
    required String proprietary_name,
    required String proprietary_name_suffix,
    required String non_proprietary_name,
    required String dosage_form_name,
    required String routename,
    required String start_marketing_date,
    required String end_marketing_date,
    required String marketing_category_name,
    required String application_number,
    required String labeler_name,
    required String substance_name,
    required String active_numerator_strength,
    required String active_ingred_unit,
    required String pharm_classes,
    required String dea_schedule,
    required String ndc_exclude_flag,
    required String listing_record_certified_through,
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
  static Insertable<NdcProduct> custom({
    Expression<String>? product_id,
    Expression<String>? product_ndc,
    Expression<String>? product_type_name,
    Expression<String>? proprietary_name,
    Expression<String>? proprietary_name_suffix,
    Expression<String>? non_proprietary_name,
    Expression<String>? dosage_form_name,
    Expression<String>? routename,
    Expression<String>? start_marketing_date,
    Expression<String>? end_marketing_date,
    Expression<String>? marketing_category_name,
    Expression<String>? application_number,
    Expression<String>? labeler_name,
    Expression<String>? substance_name,
    Expression<String>? active_numerator_strength,
    Expression<String>? active_ingred_unit,
    Expression<String>? pharm_classes,
    Expression<String>? dea_schedule,
    Expression<String>? ndc_exclude_flag,
    Expression<String>? listing_record_certified_through,
  }) {
    return RawValuesInsertable({
      if (product_id != null) 'product_id': product_id,
      if (product_ndc != null) 'product_ndc': product_ndc,
      if (product_type_name != null) 'product_type_name': product_type_name,
      if (proprietary_name != null) 'proprietary_name': proprietary_name,
      if (proprietary_name_suffix != null)
        'proprietary_name_suffix': proprietary_name_suffix,
      if (non_proprietary_name != null)
        'non_proprietary_name': non_proprietary_name,
      if (dosage_form_name != null) 'dosage_form_name': dosage_form_name,
      if (routename != null) 'routename': routename,
      if (start_marketing_date != null)
        'start_marketing_date': start_marketing_date,
      if (end_marketing_date != null) 'end_marketing_date': end_marketing_date,
      if (marketing_category_name != null)
        'marketing_category_name': marketing_category_name,
      if (application_number != null) 'application_number': application_number,
      if (labeler_name != null) 'labeler_name': labeler_name,
      if (substance_name != null) 'substance_name': substance_name,
      if (active_numerator_strength != null)
        'active_numerator_strength': active_numerator_strength,
      if (active_ingred_unit != null) 'active_ingred_unit': active_ingred_unit,
      if (pharm_classes != null) 'pharm_classes': pharm_classes,
      if (dea_schedule != null) 'dea_schedule': dea_schedule,
      if (ndc_exclude_flag != null) 'ndc_exclude_flag': ndc_exclude_flag,
      if (listing_record_certified_through != null)
        'listing_record_certified_through': listing_record_certified_through,
    });
  }

  NdcProductsCompanion copyWith(
      {Value<String>? product_id,
      Value<String>? product_ndc,
      Value<String>? product_type_name,
      Value<String>? proprietary_name,
      Value<String>? proprietary_name_suffix,
      Value<String>? non_proprietary_name,
      Value<String>? dosage_form_name,
      Value<String>? routename,
      Value<String>? start_marketing_date,
      Value<String>? end_marketing_date,
      Value<String>? marketing_category_name,
      Value<String>? application_number,
      Value<String>? labeler_name,
      Value<String>? substance_name,
      Value<String>? active_numerator_strength,
      Value<String>? active_ingred_unit,
      Value<String>? pharm_classes,
      Value<String>? dea_schedule,
      Value<String>? ndc_exclude_flag,
      Value<String>? listing_record_certified_through}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (product_id.present) {
      map['product_id'] = Variable<String>(product_id.value);
    }
    if (product_ndc.present) {
      map['product_ndc'] = Variable<String>(product_ndc.value);
    }
    if (product_type_name.present) {
      map['product_type_name'] = Variable<String>(product_type_name.value);
    }
    if (proprietary_name.present) {
      map['proprietary_name'] = Variable<String>(proprietary_name.value);
    }
    if (proprietary_name_suffix.present) {
      map['proprietary_name_suffix'] =
          Variable<String>(proprietary_name_suffix.value);
    }
    if (non_proprietary_name.present) {
      map['non_proprietary_name'] =
          Variable<String>(non_proprietary_name.value);
    }
    if (dosage_form_name.present) {
      map['dosage_form_name'] = Variable<String>(dosage_form_name.value);
    }
    if (routename.present) {
      map['routename'] = Variable<String>(routename.value);
    }
    if (start_marketing_date.present) {
      map['start_marketing_date'] =
          Variable<String>(start_marketing_date.value);
    }
    if (end_marketing_date.present) {
      map['end_marketing_date'] = Variable<String>(end_marketing_date.value);
    }
    if (marketing_category_name.present) {
      map['marketing_category_name'] =
          Variable<String>(marketing_category_name.value);
    }
    if (application_number.present) {
      map['application_number'] = Variable<String>(application_number.value);
    }
    if (labeler_name.present) {
      map['labeler_name'] = Variable<String>(labeler_name.value);
    }
    if (substance_name.present) {
      map['substance_name'] = Variable<String>(substance_name.value);
    }
    if (active_numerator_strength.present) {
      map['active_numerator_strength'] =
          Variable<String>(active_numerator_strength.value);
    }
    if (active_ingred_unit.present) {
      map['active_ingred_unit'] = Variable<String>(active_ingred_unit.value);
    }
    if (pharm_classes.present) {
      map['pharm_classes'] = Variable<String>(pharm_classes.value);
    }
    if (dea_schedule.present) {
      map['dea_schedule'] = Variable<String>(dea_schedule.value);
    }
    if (ndc_exclude_flag.present) {
      map['ndc_exclude_flag'] = Variable<String>(ndc_exclude_flag.value);
    }
    if (listing_record_certified_through.present) {
      map['listing_record_certified_through'] =
          Variable<String>(listing_record_certified_through.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NdcProductsCompanion(')
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
}

class $NdcProductsTable extends NdcProducts
    with TableInfo<$NdcProductsTable, NdcProduct> {
  final GeneratedDatabase _db;
  final String? _alias;
  $NdcProductsTable(this._db, [this._alias]);
  final VerificationMeta _product_idMeta = const VerificationMeta('product_id');
  @override
  late final GeneratedColumn<String?> product_id = GeneratedColumn<String?>(
      'product_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 24),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _product_ndcMeta =
      const VerificationMeta('product_ndc');
  @override
  late final GeneratedColumn<String?> product_ndc = GeneratedColumn<String?>(
      'product_ndc', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 16),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _product_type_nameMeta =
      const VerificationMeta('product_type_name');
  @override
  late final GeneratedColumn<String?> product_type_name =
      GeneratedColumn<String?>('product_type_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 4, maxTextLength: 32),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _proprietary_nameMeta =
      const VerificationMeta('proprietary_name');
  @override
  late final GeneratedColumn<String?> proprietary_name =
      GeneratedColumn<String?>('proprietary_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _proprietary_name_suffixMeta =
      const VerificationMeta('proprietary_name_suffix');
  @override
  late final GeneratedColumn<String?> proprietary_name_suffix =
      GeneratedColumn<String?>('proprietary_name_suffix', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 12),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _non_proprietary_nameMeta =
      const VerificationMeta('non_proprietary_name');
  @override
  late final GeneratedColumn<String?> non_proprietary_name =
      GeneratedColumn<String?>('non_proprietary_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _dosage_form_nameMeta =
      const VerificationMeta('dosage_form_name');
  @override
  late final GeneratedColumn<String?> dosage_form_name =
      GeneratedColumn<String?>('dosage_form_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _routenameMeta = const VerificationMeta('routename');
  @override
  late final GeneratedColumn<String?> routename = GeneratedColumn<String?>(
      'routename', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _start_marketing_dateMeta =
      const VerificationMeta('start_marketing_date');
  @override
  late final GeneratedColumn<String?> start_marketing_date =
      GeneratedColumn<String?>('start_marketing_date', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _end_marketing_dateMeta =
      const VerificationMeta('end_marketing_date');
  @override
  late final GeneratedColumn<String?> end_marketing_date =
      GeneratedColumn<String?>(
          'end_marketing_date', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _marketing_category_nameMeta =
      const VerificationMeta('marketing_category_name');
  @override
  late final GeneratedColumn<String?> marketing_category_name =
      GeneratedColumn<String?>('marketing_category_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _application_numberMeta =
      const VerificationMeta('application_number');
  @override
  late final GeneratedColumn<String?> application_number =
      GeneratedColumn<String?>(
          'application_number', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _labeler_nameMeta =
      const VerificationMeta('labeler_name');
  @override
  late final GeneratedColumn<String?> labeler_name = GeneratedColumn<String?>(
      'labeler_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _substance_nameMeta =
      const VerificationMeta('substance_name');
  @override
  late final GeneratedColumn<String?> substance_name = GeneratedColumn<String?>(
      'substance_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _active_numerator_strengthMeta =
      const VerificationMeta('active_numerator_strength');
  @override
  late final GeneratedColumn<String?> active_numerator_strength =
      GeneratedColumn<String?>('active_numerator_strength', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 12),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _active_ingred_unitMeta =
      const VerificationMeta('active_ingred_unit');
  @override
  late final GeneratedColumn<String?> active_ingred_unit =
      GeneratedColumn<String?>(
          'active_ingred_unit', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 4),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _pharm_classesMeta =
      const VerificationMeta('pharm_classes');
  @override
  late final GeneratedColumn<String?> pharm_classes = GeneratedColumn<String?>(
      'pharm_classes', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _dea_scheduleMeta =
      const VerificationMeta('dea_schedule');
  @override
  late final GeneratedColumn<String?> dea_schedule = GeneratedColumn<String?>(
      'dea_schedule', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _ndc_exclude_flagMeta =
      const VerificationMeta('ndc_exclude_flag');
  @override
  late final GeneratedColumn<String?> ndc_exclude_flag =
      GeneratedColumn<String?>('ndc_exclude_flag', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _listing_record_certified_throughMeta =
      const VerificationMeta('listing_record_certified_through');
  @override
  late final GeneratedColumn<String?> listing_record_certified_through =
      GeneratedColumn<String?>(
          'listing_record_certified_through', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 64),
          type: const StringType(),
          requiredDuringInsert: true);
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
  String get aliasedName => _alias ?? 'ndc_products';
  @override
  String get actualTableName => 'ndc_products';
  @override
  VerificationContext validateIntegrity(Insertable<NdcProduct> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
          _product_idMeta,
          product_id.isAcceptableOrUnknown(
              data['product_id']!, _product_idMeta));
    } else if (isInserting) {
      context.missing(_product_idMeta);
    }
    if (data.containsKey('product_ndc')) {
      context.handle(
          _product_ndcMeta,
          product_ndc.isAcceptableOrUnknown(
              data['product_ndc']!, _product_ndcMeta));
    } else if (isInserting) {
      context.missing(_product_ndcMeta);
    }
    if (data.containsKey('product_type_name')) {
      context.handle(
          _product_type_nameMeta,
          product_type_name.isAcceptableOrUnknown(
              data['product_type_name']!, _product_type_nameMeta));
    } else if (isInserting) {
      context.missing(_product_type_nameMeta);
    }
    if (data.containsKey('proprietary_name')) {
      context.handle(
          _proprietary_nameMeta,
          proprietary_name.isAcceptableOrUnknown(
              data['proprietary_name']!, _proprietary_nameMeta));
    } else if (isInserting) {
      context.missing(_proprietary_nameMeta);
    }
    if (data.containsKey('proprietary_name_suffix')) {
      context.handle(
          _proprietary_name_suffixMeta,
          proprietary_name_suffix.isAcceptableOrUnknown(
              data['proprietary_name_suffix']!, _proprietary_name_suffixMeta));
    } else if (isInserting) {
      context.missing(_proprietary_name_suffixMeta);
    }
    if (data.containsKey('non_proprietary_name')) {
      context.handle(
          _non_proprietary_nameMeta,
          non_proprietary_name.isAcceptableOrUnknown(
              data['non_proprietary_name']!, _non_proprietary_nameMeta));
    } else if (isInserting) {
      context.missing(_non_proprietary_nameMeta);
    }
    if (data.containsKey('dosage_form_name')) {
      context.handle(
          _dosage_form_nameMeta,
          dosage_form_name.isAcceptableOrUnknown(
              data['dosage_form_name']!, _dosage_form_nameMeta));
    } else if (isInserting) {
      context.missing(_dosage_form_nameMeta);
    }
    if (data.containsKey('routename')) {
      context.handle(_routenameMeta,
          routename.isAcceptableOrUnknown(data['routename']!, _routenameMeta));
    } else if (isInserting) {
      context.missing(_routenameMeta);
    }
    if (data.containsKey('start_marketing_date')) {
      context.handle(
          _start_marketing_dateMeta,
          start_marketing_date.isAcceptableOrUnknown(
              data['start_marketing_date']!, _start_marketing_dateMeta));
    } else if (isInserting) {
      context.missing(_start_marketing_dateMeta);
    }
    if (data.containsKey('end_marketing_date')) {
      context.handle(
          _end_marketing_dateMeta,
          end_marketing_date.isAcceptableOrUnknown(
              data['end_marketing_date']!, _end_marketing_dateMeta));
    } else if (isInserting) {
      context.missing(_end_marketing_dateMeta);
    }
    if (data.containsKey('marketing_category_name')) {
      context.handle(
          _marketing_category_nameMeta,
          marketing_category_name.isAcceptableOrUnknown(
              data['marketing_category_name']!, _marketing_category_nameMeta));
    } else if (isInserting) {
      context.missing(_marketing_category_nameMeta);
    }
    if (data.containsKey('application_number')) {
      context.handle(
          _application_numberMeta,
          application_number.isAcceptableOrUnknown(
              data['application_number']!, _application_numberMeta));
    } else if (isInserting) {
      context.missing(_application_numberMeta);
    }
    if (data.containsKey('labeler_name')) {
      context.handle(
          _labeler_nameMeta,
          labeler_name.isAcceptableOrUnknown(
              data['labeler_name']!, _labeler_nameMeta));
    } else if (isInserting) {
      context.missing(_labeler_nameMeta);
    }
    if (data.containsKey('substance_name')) {
      context.handle(
          _substance_nameMeta,
          substance_name.isAcceptableOrUnknown(
              data['substance_name']!, _substance_nameMeta));
    } else if (isInserting) {
      context.missing(_substance_nameMeta);
    }
    if (data.containsKey('active_numerator_strength')) {
      context.handle(
          _active_numerator_strengthMeta,
          active_numerator_strength.isAcceptableOrUnknown(
              data['active_numerator_strength']!,
              _active_numerator_strengthMeta));
    } else if (isInserting) {
      context.missing(_active_numerator_strengthMeta);
    }
    if (data.containsKey('active_ingred_unit')) {
      context.handle(
          _active_ingred_unitMeta,
          active_ingred_unit.isAcceptableOrUnknown(
              data['active_ingred_unit']!, _active_ingred_unitMeta));
    } else if (isInserting) {
      context.missing(_active_ingred_unitMeta);
    }
    if (data.containsKey('pharm_classes')) {
      context.handle(
          _pharm_classesMeta,
          pharm_classes.isAcceptableOrUnknown(
              data['pharm_classes']!, _pharm_classesMeta));
    } else if (isInserting) {
      context.missing(_pharm_classesMeta);
    }
    if (data.containsKey('dea_schedule')) {
      context.handle(
          _dea_scheduleMeta,
          dea_schedule.isAcceptableOrUnknown(
              data['dea_schedule']!, _dea_scheduleMeta));
    } else if (isInserting) {
      context.missing(_dea_scheduleMeta);
    }
    if (data.containsKey('ndc_exclude_flag')) {
      context.handle(
          _ndc_exclude_flagMeta,
          ndc_exclude_flag.isAcceptableOrUnknown(
              data['ndc_exclude_flag']!, _ndc_exclude_flagMeta));
    } else if (isInserting) {
      context.missing(_ndc_exclude_flagMeta);
    }
    if (data.containsKey('listing_record_certified_through')) {
      context.handle(
          _listing_record_certified_throughMeta,
          listing_record_certified_through.isAcceptableOrUnknown(
              data['listing_record_certified_through']!,
              _listing_record_certified_throughMeta));
    } else if (isInserting) {
      context.missing(_listing_record_certified_throughMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NdcProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NdcProduct.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NdcProductsTable createAlias(String alias) {
    return $NdcProductsTable(_db, alias);
  }
}

abstract class _$NdcDatabase extends GeneratedDatabase {
  _$NdcDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NdcProductsTable ndcProducts = $NdcProductsTable(this);
  late final NdcDao ndcDao = NdcDao(this as NdcDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [ndcProducts];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MedicationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $MedicationsTable get medications => attachedDatabase.medications;
}
mixin _$QuicklistDaoMixin on DatabaseAccessor<AppDatabase> {
  $MedicationsTable get medications => attachedDatabase.medications;
}
mixin _$NdcDaoMixin on DatabaseAccessor<NdcDatabase> {
  $NdcProductsTable get ndcProducts => attachedDatabase.ndcProducts;
}
mixin _$ChartEventsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChartEventsTable get chartEvents => attachedDatabase.chartEvents;
}
