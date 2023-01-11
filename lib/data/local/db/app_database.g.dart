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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ClientTableTable clientTable = $ClientTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [clientTable];
}
