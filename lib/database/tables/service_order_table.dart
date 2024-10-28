import 'package:drift/drift.dart';

@DataClassName('ServiceOrder')
class ServiceOrderTable extends Table {
  @JsonKey('id')
  TextColumn get id => text()();

  @JsonKey('text')
  TextColumn get transcription => text()();

  @override
  Set<Column> get primaryKey => {id};
}
