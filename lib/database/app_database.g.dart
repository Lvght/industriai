// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ServiceOrderTableTable extends ServiceOrderTable
    with TableInfo<$ServiceOrderTableTable, ServiceOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceOrderTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transcriptionMeta =
      const VerificationMeta('transcription');
  @override
  late final GeneratedColumn<String> transcription = GeneratedColumn<String>(
      'transcription', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, transcription];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_order_table';
  @override
  VerificationContext validateIntegrity(Insertable<ServiceOrder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('transcription')) {
      context.handle(
          _transcriptionMeta,
          transcription.isAcceptableOrUnknown(
              data['transcription']!, _transcriptionMeta));
    } else if (isInserting) {
      context.missing(_transcriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceOrder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      transcription: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transcription'])!,
    );
  }

  @override
  $ServiceOrderTableTable createAlias(String alias) {
    return $ServiceOrderTableTable(attachedDatabase, alias);
  }
}

class ServiceOrder extends DataClass implements Insertable<ServiceOrder> {
  final String id;
  final String transcription;
  const ServiceOrder({required this.id, required this.transcription});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transcription'] = Variable<String>(transcription);
    return map;
  }

  ServiceOrderTableCompanion toCompanion(bool nullToAbsent) {
    return ServiceOrderTableCompanion(
      id: Value(id),
      transcription: Value(transcription),
    );
  }

  factory ServiceOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceOrder(
      id: serializer.fromJson<String>(json['id']),
      transcription: serializer.fromJson<String>(json['text']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'text': serializer.toJson<String>(transcription),
    };
  }

  ServiceOrder copyWith({String? id, String? transcription}) => ServiceOrder(
        id: id ?? this.id,
        transcription: transcription ?? this.transcription,
      );
  ServiceOrder copyWithCompanion(ServiceOrderTableCompanion data) {
    return ServiceOrder(
      id: data.id.present ? data.id.value : this.id,
      transcription: data.transcription.present
          ? data.transcription.value
          : this.transcription,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceOrder(')
          ..write('id: $id, ')
          ..write('transcription: $transcription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, transcription);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceOrder &&
          other.id == this.id &&
          other.transcription == this.transcription);
}

class ServiceOrderTableCompanion extends UpdateCompanion<ServiceOrder> {
  final Value<String> id;
  final Value<String> transcription;
  final Value<int> rowid;
  const ServiceOrderTableCompanion({
    this.id = const Value.absent(),
    this.transcription = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServiceOrderTableCompanion.insert({
    required String id,
    required String transcription,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        transcription = Value(transcription);
  static Insertable<ServiceOrder> custom({
    Expression<String>? id,
    Expression<String>? transcription,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transcription != null) 'transcription': transcription,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServiceOrderTableCompanion copyWith(
      {Value<String>? id, Value<String>? transcription, Value<int>? rowid}) {
    return ServiceOrderTableCompanion(
      id: id ?? this.id,
      transcription: transcription ?? this.transcription,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transcription.present) {
      map['transcription'] = Variable<String>(transcription.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceOrderTableCompanion(')
          ..write('id: $id, ')
          ..write('transcription: $transcription, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ServiceOrderTableTable serviceOrderTable =
      $ServiceOrderTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [serviceOrderTable];
}

typedef $$ServiceOrderTableTableCreateCompanionBuilder
    = ServiceOrderTableCompanion Function({
  required String id,
  required String transcription,
  Value<int> rowid,
});
typedef $$ServiceOrderTableTableUpdateCompanionBuilder
    = ServiceOrderTableCompanion Function({
  Value<String> id,
  Value<String> transcription,
  Value<int> rowid,
});

class $$ServiceOrderTableTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceOrderTableTable> {
  $$ServiceOrderTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transcription => $composableBuilder(
      column: $table.transcription, builder: (column) => ColumnFilters(column));
}

class $$ServiceOrderTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceOrderTableTable> {
  $$ServiceOrderTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transcription => $composableBuilder(
      column: $table.transcription,
      builder: (column) => ColumnOrderings(column));
}

class $$ServiceOrderTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceOrderTableTable> {
  $$ServiceOrderTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transcription => $composableBuilder(
      column: $table.transcription, builder: (column) => column);
}

class $$ServiceOrderTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ServiceOrderTableTable,
    ServiceOrder,
    $$ServiceOrderTableTableFilterComposer,
    $$ServiceOrderTableTableOrderingComposer,
    $$ServiceOrderTableTableAnnotationComposer,
    $$ServiceOrderTableTableCreateCompanionBuilder,
    $$ServiceOrderTableTableUpdateCompanionBuilder,
    (
      ServiceOrder,
      BaseReferences<_$AppDatabase, $ServiceOrderTableTable, ServiceOrder>
    ),
    ServiceOrder,
    PrefetchHooks Function()> {
  $$ServiceOrderTableTableTableManager(
      _$AppDatabase db, $ServiceOrderTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceOrderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceOrderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceOrderTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> transcription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ServiceOrderTableCompanion(
            id: id,
            transcription: transcription,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String transcription,
            Value<int> rowid = const Value.absent(),
          }) =>
              ServiceOrderTableCompanion.insert(
            id: id,
            transcription: transcription,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ServiceOrderTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ServiceOrderTableTable,
    ServiceOrder,
    $$ServiceOrderTableTableFilterComposer,
    $$ServiceOrderTableTableOrderingComposer,
    $$ServiceOrderTableTableAnnotationComposer,
    $$ServiceOrderTableTableCreateCompanionBuilder,
    $$ServiceOrderTableTableUpdateCompanionBuilder,
    (
      ServiceOrder,
      BaseReferences<_$AppDatabase, $ServiceOrderTableTable, ServiceOrder>
    ),
    ServiceOrder,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ServiceOrderTableTableTableManager get serviceOrderTable =>
      $$ServiceOrderTableTableTableManager(_db, _db.serviceOrderTable);
}
