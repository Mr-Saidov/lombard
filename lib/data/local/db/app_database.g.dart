// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ClientTableTable extends ClientTable
    with TableInfo<$ClientTableTable, ClientTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _surnameMeta =
      const VerificationMeta('surname');
  @override
  late final GeneratedColumn<String> surname = GeneratedColumn<String>(
      'surname', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _middlenameMeta =
      const VerificationMeta('middlename');
  @override
  late final GeneratedColumn<String> middlename = GeneratedColumn<String>(
      'middlename', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pinflMeta = const VerificationMeta('pinfl');
  @override
  late final GeneratedColumn<String> pinfl = GeneratedColumn<String>(
      'pinfl', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, surname, middlename, pinfl];
  @override
  String get aliasedName => _alias ?? 'client_table';
  @override
  String get actualTableName => 'client_table';
  @override
  VerificationContext validateIntegrity(Insertable<ClientTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('surname')) {
      context.handle(_surnameMeta,
          surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta));
    }
    if (data.containsKey('middlename')) {
      context.handle(
          _middlenameMeta,
          middlename.isAcceptableOrUnknown(
              data['middlename']!, _middlenameMeta));
    }
    if (data.containsKey('pinfl')) {
      context.handle(
          _pinflMeta, pinfl.isAcceptableOrUnknown(data['pinfl']!, _pinflMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      surname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surname']),
      middlename: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}middlename']),
      pinfl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pinfl']),
    );
  }

  @override
  $ClientTableTable createAlias(String alias) {
    return $ClientTableTable(attachedDatabase, alias);
  }
}

class ClientTableData extends DataClass implements Insertable<ClientTableData> {
  final int? id;
  final String? name;
  final String? surname;
  final String? middlename;
  final String? pinfl;
  const ClientTableData(
      {this.id, this.name, this.surname, this.middlename, this.pinfl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = Variable<String>(surname);
    }
    if (!nullToAbsent || middlename != null) {
      map['middlename'] = Variable<String>(middlename);
    }
    if (!nullToAbsent || pinfl != null) {
      map['pinfl'] = Variable<String>(pinfl);
    }
    return map;
  }

  ClientTableCompanion toCompanion(bool nullToAbsent) {
    return ClientTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      surname: surname == null && nullToAbsent
          ? const Value.absent()
          : Value(surname),
      middlename: middlename == null && nullToAbsent
          ? const Value.absent()
          : Value(middlename),
      pinfl:
          pinfl == null && nullToAbsent ? const Value.absent() : Value(pinfl),
    );
  }

  factory ClientTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientTableData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      surname: serializer.fromJson<String?>(json['surname']),
      middlename: serializer.fromJson<String?>(json['middlename']),
      pinfl: serializer.fromJson<String?>(json['pinfl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'surname': serializer.toJson<String?>(surname),
      'middlename': serializer.toJson<String?>(middlename),
      'pinfl': serializer.toJson<String?>(pinfl),
    };
  }

  ClientTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> surname = const Value.absent(),
          Value<String?> middlename = const Value.absent(),
          Value<String?> pinfl = const Value.absent()}) =>
      ClientTableData(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        surname: surname.present ? surname.value : this.surname,
        middlename: middlename.present ? middlename.value : this.middlename,
        pinfl: pinfl.present ? pinfl.value : this.pinfl,
      );
  @override
  String toString() {
    return (StringBuffer('ClientTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('middlename: $middlename, ')
          ..write('pinfl: $pinfl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, surname, middlename, pinfl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.surname == this.surname &&
          other.middlename == this.middlename &&
          other.pinfl == this.pinfl);
}

class ClientTableCompanion extends UpdateCompanion<ClientTableData> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> surname;
  final Value<String?> middlename;
  final Value<String?> pinfl;
  const ClientTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.middlename = const Value.absent(),
    this.pinfl = const Value.absent(),
  });
  ClientTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.middlename = const Value.absent(),
    this.pinfl = const Value.absent(),
  });
  static Insertable<ClientTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? surname,
    Expression<String>? middlename,
    Expression<String>? pinfl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (middlename != null) 'middlename': middlename,
      if (pinfl != null) 'pinfl': pinfl,
    });
  }

  ClientTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<String?>? surname,
      Value<String?>? middlename,
      Value<String?>? pinfl}) {
    return ClientTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      middlename: middlename ?? this.middlename,
      pinfl: pinfl ?? this.pinfl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    if (middlename.present) {
      map['middlename'] = Variable<String>(middlename.value);
    }
    if (pinfl.present) {
      map['pinfl'] = Variable<String>(pinfl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('middlename: $middlename, ')
          ..write('pinfl: $pinfl')
          ..write(')'))
        .toString();
  }
}

class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gaveMoneyMeta =
      const VerificationMeta('gaveMoney');
  @override
  late final GeneratedColumn<String> gaveMoney = GeneratedColumn<String>(
      'gave_money', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _percentMeta =
      const VerificationMeta('percent');
  @override
  late final GeneratedColumn<int> percent = GeneratedColumn<int>(
      'percent', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, name, gaveMoney, startDate, endDate, percent];
  @override
  String get aliasedName => _alias ?? 'product_table';
  @override
  String get actualTableName => 'product_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProductTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('gave_money')) {
      context.handle(_gaveMoneyMeta,
          gaveMoney.isAcceptableOrUnknown(data['gave_money']!, _gaveMoneyMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('percent')) {
      context.handle(_percentMeta,
          percent.isAcceptableOrUnknown(data['percent']!, _percentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      gaveMoney: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gave_money']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      percent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}percent']),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }
}

class ProductTableData extends DataClass
    implements Insertable<ProductTableData> {
  final int? id;
  final int? clientId;
  final String? name;
  final String? gaveMoney;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? percent;
  const ProductTableData(
      {this.id,
      this.clientId,
      this.name,
      this.gaveMoney,
      this.startDate,
      this.endDate,
      this.percent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || clientId != null) {
      map['client_id'] = Variable<int>(clientId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || gaveMoney != null) {
      map['gave_money'] = Variable<String>(gaveMoney);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || percent != null) {
      map['percent'] = Variable<int>(percent);
    }
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      clientId: clientId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      gaveMoney: gaveMoney == null && nullToAbsent
          ? const Value.absent()
          : Value(gaveMoney),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      percent: percent == null && nullToAbsent
          ? const Value.absent()
          : Value(percent),
    );
  }

  factory ProductTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTableData(
      id: serializer.fromJson<int?>(json['id']),
      clientId: serializer.fromJson<int?>(json['clientId']),
      name: serializer.fromJson<String?>(json['name']),
      gaveMoney: serializer.fromJson<String?>(json['gaveMoney']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      percent: serializer.fromJson<int?>(json['percent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'clientId': serializer.toJson<int?>(clientId),
      'name': serializer.toJson<String?>(name),
      'gaveMoney': serializer.toJson<String?>(gaveMoney),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'percent': serializer.toJson<int?>(percent),
    };
  }

  ProductTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<int?> clientId = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> gaveMoney = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<int?> percent = const Value.absent()}) =>
      ProductTableData(
        id: id.present ? id.value : this.id,
        clientId: clientId.present ? clientId.value : this.clientId,
        name: name.present ? name.value : this.name,
        gaveMoney: gaveMoney.present ? gaveMoney.value : this.gaveMoney,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        percent: percent.present ? percent.value : this.percent,
      );
  @override
  String toString() {
    return (StringBuffer('ProductTableData(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('gaveMoney: $gaveMoney, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('percent: $percent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, clientId, name, gaveMoney, startDate, endDate, percent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTableData &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.name == this.name &&
          other.gaveMoney == this.gaveMoney &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.percent == this.percent);
}

class ProductTableCompanion extends UpdateCompanion<ProductTableData> {
  final Value<int?> id;
  final Value<int?> clientId;
  final Value<String?> name;
  final Value<String?> gaveMoney;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<int?> percent;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.name = const Value.absent(),
    this.gaveMoney = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.percent = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.name = const Value.absent(),
    this.gaveMoney = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.percent = const Value.absent(),
  });
  static Insertable<ProductTableData> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? name,
    Expression<String>? gaveMoney,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? percent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (name != null) 'name': name,
      if (gaveMoney != null) 'gave_money': gaveMoney,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (percent != null) 'percent': percent,
    });
  }

  ProductTableCompanion copyWith(
      {Value<int?>? id,
      Value<int?>? clientId,
      Value<String?>? name,
      Value<String?>? gaveMoney,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<int?>? percent}) {
    return ProductTableCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      gaveMoney: gaveMoney ?? this.gaveMoney,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      percent: percent ?? this.percent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gaveMoney.present) {
      map['gave_money'] = Variable<String>(gaveMoney.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (percent.present) {
      map['percent'] = Variable<int>(percent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('gaveMoney: $gaveMoney, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('percent: $percent')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ClientTableTable clientTable = $ClientTableTable(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [clientTable, productTable];
}
