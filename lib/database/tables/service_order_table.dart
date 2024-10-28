import 'package:drift/drift.dart';

@DataClassName('ServiceOrder')
class ServiceOrderTable extends Table {
  @JsonKey('raw_content_description')
  TextColumn get rawContentDescription => text()();
}
