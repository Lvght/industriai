import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:industriai/database/tables/service_order_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

part 'app_database.g.dart';

@DriftDatabase(tables: [
  ServiceOrderTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
