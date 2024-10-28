// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ServiceOrderTableTable extends ServiceOrderTable
    with TableInfo<$ServiceOrderTableTable, ServiceOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceOrderTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rawContentDescriptionMeta =
      const VerificationMeta('rawContentDescription');
  @override
  late final GeneratedColumn<String> rawContentDescription =
      GeneratedColumn<String>('raw_content_description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [rawContentDescription];
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
    if (data.containsKey('raw_content_description')) {
      context.handle(
          _rawContentDescriptionMeta,
          rawContentDescription.isAcceptableOrUnknown(
              data['raw_content_description']!, _rawContentDescriptionMeta));
    } else if (isInserting) {
      context.missing(_rawContentDescriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ServiceOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceOrder(
      rawContentDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}raw_content_description'])!,
    );
  }

  @override
  $ServiceOrderTableTable createAlias(String alias) {
    return $ServiceOrderTableTable(attachedDatabase, alias);
  }
}

class ServiceOrder extends DataClass implements Insertable<ServiceOrder> {
  final String rawContentDescription;
  const ServiceOrder({required this.rawContentDescription});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['raw_content_description'] = Variable<String>(rawContentDescription);
    return map;
  }

  ServiceOrderTableCompanion toCompanion(bool nullToAbsent) {
    return ServiceOrderTableCompanion(
      rawContentDescription: Value(rawContentDescription),
    );
  }

  factory ServiceOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceOrder(
      rawContentDescription:
          serializer.fromJson<String>(json['raw_content_description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'raw_content_description':
          serializer.toJson<String>(rawContentDescription),
    };
  }

  ServiceOrder copyWith({String? rawContentDescription}) => ServiceOrder(
        rawContentDescription:
            rawContentDescription ?? this.rawContentDescription,
      );
  ServiceOrder copyWithCompanion(ServiceOrderTableCompanion data) {
    return ServiceOrder(
      rawContentDescription: data.rawContentDescription.present
          ? data.rawContentDescription.value
          : this.rawContentDescription,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceOrder(')
          ..write('rawContentDescription: $rawContentDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => rawContentDescription.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceOrder &&
          other.rawContentDescription == this.rawContentDescription);
}

class ServiceOrderTableCompanion extends UpdateCompanion<ServiceOrder> {
  final Value<String> rawContentDescription;
  final Value<int> rowid;
  const ServiceOrderTableCompanion({
    this.rawContentDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServiceOrderTableCompanion.insert({
    required String rawContentDescription,
    this.rowid = const Value.absent(),
  }) : rawContentDescription = Value(rawContentDescription);
  static Insertable<ServiceOrder> custom({
    Expression<String>? rawContentDescription,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (rawContentDescription != null)
        'raw_content_description': rawContentDescription,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServiceOrderTableCompanion copyWith(
      {Value<String>? rawContentDescription, Value<int>? rowid}) {
    return ServiceOrderTableCompanion(
      rawContentDescription:
          rawContentDescription ?? this.rawContentDescription,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rawContentDescription.present) {
      map['raw_content_description'] =
          Variable<String>(rawContentDescription.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceOrderTableCompanion(')
          ..write('rawContentDescription: $rawContentDescription, ')
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
  required String rawContentDescription,
  Value<int> rowid,
});
typedef $$ServiceOrderTableTableUpdateCompanionBuilder
    = ServiceOrderTableCompanion Function({
  Value<String> rawContentDescription,
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
  ColumnFilters<String> get rawContentDescription => $composableBuilder(
      column: $table.rawContentDescription,
      builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get rawContentDescription => $composableBuilder(
      column: $table.rawContentDescription,
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
  GeneratedColumn<String> get rawContentDescription => $composableBuilder(
      column: $table.rawContentDescription, builder: (column) => column);
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
            Value<String> rawContentDescription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ServiceOrderTableCompanion(
            rawContentDescription: rawContentDescription,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String rawContentDescription,
            Value<int> rowid = const Value.absent(),
          }) =>
              ServiceOrderTableCompanion.insert(
            rawContentDescription: rawContentDescription,
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
